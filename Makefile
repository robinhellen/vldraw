DEFAULT: all

.SECONDEXPANSION:

# Vala compiler
ifndef VALACC
VALACC := $(shell find $${PATH//:/ } -name valac-* | sort -r | head -n 1)
endif

ifndef VALACC
$(error Could not find Vala compiler)
endif

# external libraries defined here for consistent versions.
gee=gee-0.8
gio=gio-2.0
gtk=gtk+-3.0
json=json-glib-1.0
xml=libxml-2.0
soup=libsoup-2.4
gmodule=gmodule-2.0

SOURCES=$(wildcard *.vala)

# definitions for component modules
# each module has up to four definitions:
# foo_sources
#    (required)
#    Vala source files for the module
# foo_packages
#    System packages that the module requires to be linked against
# foo_internal packages
#    Other modules that this module depends on
# foo_test_sources
#    Vala source files for the tests for the module

utils_sources= $(wildcard utils/*.vala)
utils_packages=$(gee) $(gtk)

expressions_sources=$(wildcard expressions/*.vala)
expressions_packages=$(gee)
expressions_test_sources=$(wildcard tests/expressions/*.vala)

maths_sources=$(wildcard maths/*.vala)
maths_test_sources=$(wildcard tests/vector/*.vala) $(wildcard tests/*.vala)

options_sources=$(wildcard options/*.vala)
options_internal_packages= maths

lego_objects_sources=$(wildcard  lego/basic_objects/*.vala)
lego_objects_packages=$(gee)
lego_objects_internal_packages=maths

lego_sources:=$(foreach folder, files files/parsing library, $(wildcard lego/$(folder)/*.vala)) \
	$(foreach n, meta_command, lego/objects/nodes/$n.vala)
lego_packages= diva
lego_private_packages=$(json) $(gtk)
lego_internal_packages=maths utils lego_objects
lego_private_internal_packages=application

peeron_sources=$(wildcard peeron/*.vala)
peeron_packages=$(gee) diva
peeron_private_packages=$(soup) $(xml) $(gtk)
peeron_internal_packages=lego_objects ui_widgets part_group

povray_sources=$(wildcard povray/*.vala)
povray_private_packages=$(gio) $(gtk)
povray_internal_packages=lego
povray_private_internal_packages=export ui_widgets

export_sources=$(wildcard export/*.vala)
export_packages=$(gtk) diva
export_internal_packages=lego_objects utils
export_private_internal_packages=ui_widgets

part_group_sources=$(wildcard lego/*.vala)
part_group_packages=$(gee) $(gtk) diva
part_group_internal_packages=lego lego_objects maths utils

drag_and_drop_sources=$(wildcard ui/drag_and_drop/*.vala)
drag_and_drop_packages=$(gee) $(gtk) diva gl
drag_and_drop_internal_packages=lego lego_objects maths utils ui_widgets

gl_render_sources=$(wildcard open_gl/*.vala) $(wildcard open_gl/gl_api/*.vala)
gl_render_packages=gl $(gee) $(gtk) diva
gl_render_internal_packages=lego lego_objects maths expressions utils ui_widgets ui_gtk_gl

ui_gtk_gl_sources=$(wildcard ui/gtk_gl/*.vala)
ui_gtk_gl_packages=$(gtk) $(gee) gl diva
ui_gtk_gl_internal_packages=lego lego_objects maths expressions utils ui_widgets options utils

ui_widgets_sources=$(wildcard ui/*.vala) $(wildcard ui/interfaces/*.vala) $(wildcard ui/undo/*.vala)
ui_widgets_packages=$(gtk) $(gee) gl diva
ui_widgets_internal_packages= application lego lego_objects maths expressions utils options part_group

ui_dialogs_sources=$(wildcard ui/dialogs/*.vala)
ui_dialogs_packages=$(gtk) $(gee) gl diva
ui_dialogs_internal_packages= ui_widgets lego lego_objects maths expressions utils options

move_origin_sources=$(wildcard refactoring/move_origin/*.vala)
move_origin_packages=$(gtk) $(gee) diva
move_origin_internal_packages=ui_widgets lego lego_objects maths expressions utils

steps_sources=$(wildcard steps/*.vala)
steps_packages=$(gtk) $(gee) diva gl
steps_internal_packages=ui_widgets lego lego_objects maths expressions utils gl_render ui_gtk_gl

animation_sources=$(wildcard animation/*.vala)
animation_packages=diva $(gee) $(gtk) gl
animation_internal_packages=lego lego_objects maths expressions utils ui_widgets gl_render ui_gtk_gl

# Libraries that heve been rewritten with dependencies inverted
application_sources=application/application.vala
application_packages=$(gee) diva

INTERNAL_LIBS=utils expressions maths options lego lego_objects part_group \
	application export drag_and_drop gl_render ui_widgets ui_dialogs move_origin ui_gtk_gl

PLUGINS=animation steps povray peeron

VALA_PACKAGES = $(gtk) $(gee) $(json) $(soup) $(xml) gl $(gio) $(gmodule) diva

VALA_PKG_ARGS = $(foreach pkg, $(VALA_PACKAGES), --pkg $(pkg))

VALA_OPTS= --vapidir=vapi $(VALA_PKG_ARGS) -X -w -X -Ivapi -X -msse -X -lm -X -O2
VALA_DEBUG_OPTS= --vapidir=vapi $(VALA_PKG_ARGS) -X -w -X -Ivapi -X -msse -X -lm -g

EXECUTABLE_NAME = ldraw

all: $(EXECUTABLE_NAME) test/expressions.test test/maths.test $(foreach plugin, $(PLUGINS), plugins/$(plugin).so)
	./test/expressions.test
	./test/maths.test

# compilation for the final executable
$(EXECUTABLE_NAME): $(SOURCES) $(foreach lib, $(INTERNAL_LIBS), lib/$(lib).so h/$(lib).h vapi/$(lib).vapi)
	$(VALACC) $(VALA_OPTS) $(SOURCES) -o $(EXECUTABLE_NAME) \
	$(foreach lib, $(INTERNAL_LIBS), --pkg $(lib) -X lib/$(lib).so) \
	-X -Ih -X -ldiva

all_packages = $(foreach pkg, $($(1)_internal_packages), $(pkg) $($(pkg)_packages) $(call all_packages,$(pkg)))

# Compilation for the component modules
lib/%.so h/%.h vapi/%.vapi: $$($$*_sources) $$(foreach lib, $$($$*_internal_packages) $$($$*_private_internal_packages), h/$$(lib).h vapi/$$(lib).vapi)
	$(VALACC) $($*_sources) \
		$(foreach pkg, $(sort \
					$($*_packages) \
					$($*_private_packages) \
					$(call all_packages,$*) \
					$($*_private_internal_packages)\
				),--pkg $(pkg)) \
		$(if $($*_internal_packages) $($*_private_internal_packages), -X -Ih --vapidir=vapi) \
		--library=$* -H h/$*.h --vapi vapi/$*.vapi -o lib/$*.so \
		-X -fpic -X -shared -g -X -w
	touch h/$*.h
	touch vapi/$*.vapi

# Compilation for modules as plugins.
plugins/%.so: $$($$*_sources) $$(foreach lib, $$($$*_internal_packages) $$($$*_private_internal_packages), h/$$(lib).h vapi/$$(lib).vapi)
	$(VALACC) $($*_sources) \
		$(foreach pkg, $(sort \
					$($*_packages) \
					$($*_private_packages) \
					$(call all_packages,$*) \
					$($*_private_internal_packages) \
					$(gmodule) \
				),--pkg $(pkg)) \
		$(if $($*_internal_packages) $($*_private_internal_packages), -X -Ih --vapidir=vapi) \
		--library=$* --vapi vapi/$*.vapi -o plugins/$*.so \
		-X -fpic -X -shared -g -X -w
	touch h/$*.h
	touch vapi/$*.vapi

# (Optional) compilation of per-module tests.
test/%.test: $$($$*_test_sources) lib/%.so h/%.h vapi/%.vapi
ifeq ($$($$*_test_sources),)
	$(warning No tests for $*.)
else
	$(VALACC) $($*_test_sources) \
		-X -Ih --vapidir=vapi \
		$(foreach pkg, $($*_packages) $($*_internal_packages), --pkg $(pkg)) \
		--pkg $* \
		--pkg $(gee) -X -lm \
		-o test/$*.test \
		-g -X -w \
		 $(foreach lib, $($*_internal_packages) $*, -X lib/$(lib).so)
	./test/$*.test
endif

# clean all files created during normal compilation
clean:
	rm -f $(EXECUTABLE_NAME) $(TEST_EXECUTABLE_NAME) $(EXECUTABLE_NAME)_debug
	rm -f h/*.h lib/*.so $(foreach lib, $(INTERNAL_LIBS), vapi/$(lib).vapi)

# clean temporary files that vala leaves during abnormal compilation
tempclean:
	rm -f $(patsubst %.vala,%.vala.c,$(SOURCES) $(TEST_SOURCES))
	rm -f $(patsubst %.vala,%.c,$(SOURCES) $(TEST_SOURCES))
