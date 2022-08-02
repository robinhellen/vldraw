DEFAULT: all

.SECONDEXPANSION:

SHELL = /bin/bash
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

SOURCES=$(wildcard src/*.vala)

# definitions for component modules
# each module has up to 6 definitions:
# foo_sources
#    (required)
#    Vala source files for the module
# foo_packages
#    System packages that the module requires to be linked against
# foo_private_packages
#	 System packages that the module requires, but that are not required by the public API
# foo_internal_packages
#    Other modules that this module depends on
# foo_private_internal_packages
#	 Other modules that this module depends on, but that are not required by the public API.
# foo_test_sources
#    Vala source files for the tests for the module

# Core modules
application_sources=$(wildcard src/modules/application/*.vala)
application_packages=$(gee) $(gio)
application_private_packages=diva

utils_sources= $(wildcard src/modules/utils/*.vala)
utils_packages=$(gee) $(gtk)

expressions_sources=$(wildcard src/modules/expressions/*.vala)
expressions_packages=$(gee)
expressions_test_sources=$(wildcard src/tests/expressions/*.vala)

maths_sources=$(wildcard src/modules/maths/*.vala)
maths_test_sources=$(wildcard src/tests/vector/*.vala) $(wildcard src/tests/*.vala)

options_sources=$(wildcard src/modules/options/*.vala)
options_private_packages=$(gee) $(json) diva
options_internal_packages=maths
options_private_internal_packages=application

lego_objects_sources=$(wildcard src/modules/lego/basic_objects/*.vala)
lego_objects_packages=$(gee) $(gio)
lego_objects_internal_packages=maths

lego_colours_sources=$(wildcard src/modules/lego/colours/*.vala)
lego_colours_packages=$(gee) $(gio)
lego_colours_internal_packages=lego ui_widgets application

lego_sources:=$(foreach folder, files files/parsing library, $(wildcard src/modules/lego/$(folder)/*.vala)) \
	$(foreach n, meta_command, src/modules/lego/objects/nodes/$n.vala)
lego_packages= diva
lego_private_packages=$(json)
lego_internal_packages=maths utils lego_objects application

part_group_sources=$(wildcard src/modules/lego/*.vala)
part_group_packages=
part_group_internal_packages=lego

ui_widgets_sources=$(wildcard src/modules/ui/*.vala) $(wildcard src/modules/ui/interfaces/*.vala) $(wildcard src/modules/ui/undo/*.vala)
ui_widgets_internal_packages=lego part_group
ui_widgets_private_internal_packages=application

export_sources=$(wildcard src/modules/export/*.vala)
export_packages=diva
export_internal_packages=lego_objects utils
export_private_internal_packages=ui_widgets

ui_gtk_gl_sources=$(wildcard src/modules/ui/gtk_gl/*.vala)
ui_gtk_gl_packages=$(gee) gl
ui_gtk_gl_internal_packages=lego ui_widgets utils
ui_gtk_gl_vala_options=--vapidir=vapi

gl_render_sources=$(wildcard src/modules/open_gl/*.vala) $(wildcard src/modules/open_gl/gl_api/*.vala)
gl_render_packages=gl $(gee)
gl_render_internal_packages=lego ui_widgets ui_gtk_gl
gl_render_vala_options=--vapidir=vapi

drag_and_drop_sources=$(wildcard src/modules/ui/drag_and_drop/*.vala)
drag_and_drop_packages=$(gee) diva
drag_and_drop_internal_packages=lego lego_objects maths utils ui_widgets

ui_dialogs_sources=$(wildcard src/modules/ui/dialogs/*.vala)
ui_dialogs_packages=$(gee) gl diva
ui_dialogs_internal_packages= ui_widgets lego lego_objects maths expressions utils options
ui_dialogs_vala_options=--vapidir=vapi

# Plugins

steps_sources=$(wildcard src/plugins/steps/*.vala)
steps_packages=$(gee) diva gl
steps_internal_packages=ui_widgets lego lego_objects maths expressions utils gl_render ui_gtk_gl
steps_vala_options=--vapidir=vapi

hide_sources=$(wildcard src/plugins/hide/*.vala)
hide_packages=$(gee) diva gl
hide_internal_packages=ui_widgets lego lego_objects maths expressions utils gl_render ui_gtk_gl
hide_vala_options=--vapidir=vapi

animation_sources=$(wildcard src/plugins/animation/*.vala)
animation_packages=diva $(gee)
animation_internal_packages=lego lego_objects maths expressions utils ui_widgets gl_render ui_gtk_gl
animation_vala_options=--vapidir=vapi

peeron_sources=$(wildcard src/plugins/peeron/*.vala)
peeron_packages=$(gee) diva
peeron_private_packages=$(soup) $(xml) $(gtk) $(json)
peeron_internal_packages=lego_objects ui_widgets part_group options

povray_sources=$(wildcard src/plugins/povray/*.vala)
povray_private_packages=$(gio)
povray_internal_packages=lego
povray_private_internal_packages=export ui_widgets

move_origin_sources=$(wildcard src/refactoring/move_origin/*.vala)
move_origin_packages=$(gee) diva
move_origin_internal_packages=ui_widgets lego lego_objects maths expressions utils

switch_all_sources=$(wildcard src/refactoring/switch_all/*.vala)
switch_all_packages=$(gee) diva
switch_all_internal_packages=ui_widgets lego lego_objects maths expressions utils lego_colours

extract_inline_sources=$(wildcard src/refactoring/inline_submodel/*.vala)
extract_inline_packages=$(gee) diva
extract_inline_internal_packages=ui_widgets lego lego_objects

clipboard_sources=$(wildcard src/plugins/clipboard/*.vala)
clipboard_packages=$(gee) diva
clipboard_internal_packages=ui_widgets lego lego_objects 

movement_sources=$(wildcard src/plugins/movement_edits/*.vala) build/resources/movement_resources.c
movement_packages=$(gee) diva
movement_internal_packages=ui_widgets lego lego_objects ui_gtk_gl
movement_vala_options=--vapidir=vapi

# End of module build specs

INTERNAL_LIBS=utils expressions maths options lego lego_objects lego_colours part_group \
	application export drag_and_drop gl_render ui_widgets ui_dialogs ui_gtk_gl

PLUGINS=animation steps povray peeron move_origin clipboard extract_inline hide movement switch_all
# extract_inline

VALA_PACKAGES = $(gtk) $(gee) $(json) $(soup) $(xml) gl $(gio) $(gmodule) diva

VALA_PKG_ARGS = $(foreach pkg, $(VALA_PACKAGES), --pkg $(pkg))

VALA_OPTS= --vapidir=build/vapi --vapidir=vapi $(VALA_PKG_ARGS) -X -w -X -Ibuild/vapi -X -msse -X -lm -X -O2
VALA_DEBUG_OPTS= --vapidir=build/vapi $(VALA_PKG_ARGS) -X -w -X -Ivapi -X -msse -X -lm -g

EXECUTABLE_NAME = ldraw

include $(foreach lib, $(INTERNAL_LIBS), build/make/$(lib)_resources.d) $(foreach lib, $(PLUGINS), build/make/$(lib)_resources.d)

all: build/$(EXECUTABLE_NAME) build/test/expressions.test build/test/maths.test $(foreach plugin, $(PLUGINS), build/plugins/$(plugin).so)
#~ 	./build/test/expressions.test
#~ 	./build/test/maths.test

# compilation for the final executable
build/$(EXECUTABLE_NAME): $(SOURCES) $(foreach lib, $(INTERNAL_LIBS), build/lib/$(lib).so build/h/$(lib).h build/vapi/$(lib).vapi) | build
	$(VALACC) $(VALA_OPTS) $(SOURCES) -o build/$(EXECUTABLE_NAME) \
	$(foreach lib, $(INTERNAL_LIBS), --pkg $(lib) -X build/lib/$(lib).so) \
	-X -Ibuild/h -X -ldiva

all_packages = $(foreach pkg, $($(1)_internal_packages), $(pkg) $($(pkg)_packages) $(call all_packages,$(pkg)))

# Compilation for the component modules
build/lib/%.so build/h/%.h build/vapi/%.vapi: $$($$*_sources) $$(foreach lib, $$($$*_internal_packages) $$($$*_private_internal_packages), build/h/$$(lib).h build/vapi/$$(lib).vapi) | build/lib build/h build/vapi
	$(VALACC) $($*_sources) \
		$(foreach pkg, $(sort \
					$($*_packages) \
					$($*_private_packages) \
					$(call all_packages,$*) \
					$($*_private_internal_packages)\
				),--pkg $(pkg)) \
		$(if $($*_internal_packages) $($*_private_internal_packages), -X -Ibuild/h --vapidir=build/vapi) \
		--library=$* -H build/h/$*.h --vapi build/vapi/$*.vapi -o build/lib/$*.so \
		-X -fpic -X -shared -g -X -w $($*_vala_options)
	touch build/h/$*.h
	touch build/vapi/$*.vapi
	
build/resources/%.c: assets/%.xml | build/resources
	glib-compile-resources --target=$@ --generate-source --sourcedir=assets $<
	
build/make/%.d: assets/%.xml | build/make
	glib-compile-resources --dependency-file=$@ --generate-dependencies --sourcedir=assets $<
	sed -i 's/assets\/$*.xml/build\/resources\/$*.c/g' $@
	
build/make/%.d: | build/make
	truncate -s 0 $@

# Compilation for modules as plugins.
build/plugins/%.so: $$($$*_sources) $$(foreach lib, $$($$*_internal_packages) $$($$*_private_internal_packages), build/h/$$(lib).h build/vapi/$$(lib).vapi) | build/plugins
	$(VALACC) $($*_sources) \
		$(foreach pkg, $(sort \
					$($*_packages) \
					$($*_private_packages) \
					$(call all_packages,$*) \
					$($*_private_internal_packages) \
					$(gmodule) \
				),--pkg $(pkg)) \
		$(if $($*_internal_packages) $($*_private_internal_packages), -X -Ibuild/h --vapidir=build/vapi) \
		--library=$* --vapi build/vapi/$*.vapi -o build/plugins/$*.so \
		-X -fpic -X -shared -g -X -w $($*_vala_options)
	touch build/h/$*.h
	touch build/vapi/$*.vapi

# (Optional) compilation of per-module tests.
build/test/%.test: $$($$*_test_sources) build/lib/%.so build/h/%.h build/vapi/%.vapi | build/test
ifeq ($$($$*_test_sources),)
	$(warning No tests for $*.)
else
	$(VALACC) $($*_test_sources) \
		-X -Ibuild/h --vapidir=build/vapi \
		$(foreach pkg, $($*_packages) $($*_internal_packages), --pkg $(pkg)) \
		--pkg $* \
		--pkg $(gee) -X -lm \
		-o build/test/$*.test \
		-g -X -w \
		 $(foreach lib, $($*_internal_packages) $*, -X build/lib/$(lib).so)
	./build/test/$*.test
endif

# clean all files created during normal compilation
clean:
	rm -f build/$(EXECUTABLE_NAME) $(TEST_EXECUTABLE_NAME) build/$(EXECUTABLE_NAME)_debug
	rm -f build/h/*.h build/lib/*.so build/plugins/*.so $(foreach lib, $(INTERNAL_LIBS) $(PLUGINS), build/vapi/$(lib).vapi)

# clean temporary files that vala leaves during abnormal compilation
tempclean:
	rm -f $(patsubst %.vala,%.vala.c,$(SOURCES) $(TEST_SOURCES))
	rm -f $(patsubst %.vala,%.c,$(SOURCES) $(TEST_SOURCES))
	
build:
	mkdir -p build
	
build/h: | build
	mkdir -p build/h
	
build/lib: | build
	mkdir -p build/lib
	
build/make: | build
	mkdir -p build/make
	
build/plugins: | build
	mkdir -p build/plugins
	
build/resources: | build
	mkdir -p build/resources
	
build/test: | build
	mkdir -p build/test
	
build/vapi: | build
	mkdir -p build/vapi
