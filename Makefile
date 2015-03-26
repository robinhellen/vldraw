DEFAULT: all

.SECONDEXPANSION:

VALACC=valac-0.26
gee=gee-0.8
gtk=gtk+-2.0
json=json-glib-1.0
xml=libxml-2.0
soup=libsoup-2.4

TEST_EXPR_SOURCES=		$(wildcard tests/expressions/*.vala)
TEST_MATHS_SOURCES=		$(wildcard tests/vector/*.vala)
TEST_FRAMEWORK_SOURCES= $(wildcard tests/*.vala)

TEST_SOURCES= $(TEST_FRAMEWORK_SOURCES) $(TEST_MATHS_SOURCES) $(TEST_EXPR_SOURCES)

EXPORT_SOURCES=		$(wildcard export/*.vala)
OPENGL_SOURCES=		$(wildcard openGl/*.vala)
MATHS_SOURCES=		$(wildcard maths/*.c)
REFACTORING_SOURCES=$(wildcard refactoring/*.vala)

ENGINE_SOURCE_FOLDERS= lego
UI_SOURCE_FOLDERS= drag_and_drop widgets undo .

ENGINE_SOURCES= $(foreach folder, $(ENGINE_SOURCE_FOLDERS), $(wildcard $(folder)/*.vala))
GTK_SOURCES= $(foreach folder, $(UI_SOURCE_FOLDERS), $(wildcard gtk/$(folder)/*.vala))

ENGINE_C_SOURCES=$(MATHS_SOURCES)

SOURCES=$(wildcard *.vala) $(ENGINE_SOURCES) $(OPENGL_SOURCES) $(GTK_SOURCES) $(EXPORT_SOURCES) $(REFACTORING_SOURCES)
di_sources= $(wildcard utils/di/*.vala)
di_packages=$(gee)
utils_sources= $(wildcard utils/*.vala)
utils_packages=$(gee) $(gtk)
expressions_sources=$(wildcard expressions/*.vala)
expressions_packages=$(gee)
maths_sources=$(wildcard maths/*.vala)
options_sources=$(wildcard options/*.vala)
options_internal_packages= maths
lego_sources=$(foreach folder, objects objects/nodes files files/parsing library, $(wildcard lego/$(folder)/*.vala))
lego_packages=$(gee) $(gtk) $(json)
lego_internal_packages=maths expressions utils di
peeron_sources=$(wildcard peeron/*.vala)
peeron_packages=$(gee) $(gtk) $(json) $(soup) $(xml)
peeron_internal_packages=lego maths expressions utils di
povray_sources=$(wildcard povray/*.vala)
povray_packages=$(gee) $(gtk) $(json)
povray_internal_packages=lego maths expressions utils di

INTERNAL_LIBS=di utils expressions maths options lego peeron povray

TEST_EXECUTABLE_SOURCES= $(TEST_SOURCES) $(ENGINE_SOURCES)

VALA_PACKAGES = $(gtk) $(gee) $(json) $(soup) $(xml) gl gtkglext-1.0 gdkglext-1.0 gio-2.0

VALA_PKG_ARGS = $(foreach pkg, $(VALA_PACKAGES), --pkg $(pkg))

VALA_OPTS= --vapidir=vapi $(VALA_PKG_ARGS) -X -w -X -Ivapi -X -msse -X -lm -X -O2
VALA_DEBUG_OPTS= --vapidir=vapi $(VALA_PKG_ARGS) -X -w -X -Ivapi -X -msse -X -lm -g

EXECUTABLE_NAME = ldraw
TEST_EXECUTABLE_NAME = $(EXECUTABLE_NAME)_tests

all: $(TEST_EXECUTABLE_NAME) $(EXECUTABLE_NAME)
	./$(TEST_EXECUTABLE_NAME)

debug: $(SOURCES)
	$(VALACC) $(VALA_DEBUG_OPTS) $(SOURCES) -o $(EXECUTABLE_NAME)_debug

$(EXECUTABLE_NAME): $(SOURCES) $(foreach lib, $(INTERNAL_LIBS), lib/$(lib).so h/$(lib).h vapi/$(lib).vapi)
	$(VALACC) $(VALA_OPTS) $(SOURCES) -o $(EXECUTABLE_NAME) $(foreach lib, $(INTERNAL_LIBS), --pkg $(lib) -X lib/$(lib).so) -X -Ih

$(TEST_EXECUTABLE_NAME): $(TEST_EXECUTABLE_SOURCES) $(foreach lib, $(INTERNAL_LIBS), lib/$(lib).so h/$(lib).h vapi/$(lib).vapi)
	$(VALACC) $(VALA_OPTS) $(TEST_EXECUTABLE_SOURCES) -o $(TEST_EXECUTABLE_NAME) $(foreach lib, $(INTERNAL_LIBS), --pkg $(lib) -X lib/$(lib).so) -X -Ih
	
lib/%.so h/%.h vapi/%.vapi: $$($$*_sources) $$(foreach lib, $$($$*_internal_packages), h/$$(lib).h lib/$$(lib).so vapi/$$(lib).vapi)
	$(VALACC) $($*_sources) \
		$(foreach pkg, $($*_packages) $($*_internal_packages), --pkg $(pkg)) \
		$(if $($*_internal_packages), -X -Ih --vapidir=vapi) \
		--library=$* -H h/$*.h --vapi vapi/$*.vapi -o lib/$*.so \
		-X -fpic -X -shared -g -X -w


clean:
	rm -f $(EXECUTABLE_NAME) $(TEST_EXECUTABLE_NAME) $(EXECUTABLE_NAME)_debug
	rm -f h/*.h lib/*.so $(foreach lib, $(INTERNAL_LIBS), vapi/$(lib).vapi)

tempclean:
	rm -f $(patsubst %.vala,%.vala.c,$(SOURCES) $(TEST_SOURCES))
	rm -f $(patsubst %.vala,%.c,$(SOURCES) $(TEST_SOURCES))
