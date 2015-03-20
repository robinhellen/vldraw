
VALACC=valac-0.24

TEST_EXPR_SOURCES=		$(wildcard tests/expressions/*.vala)
TEST_MATHS_SOURCES=		$(wildcard tests/vector/*.vala)
TEST_FRAMEWORK_SOURCES= $(wildcard tests/*.vala)

TEST_SOURCES= $(TEST_FRAMEWORK_SOURCES) $(TEST_MATHS_SOURCES) $(TEST_EXPR_SOURCES)

EXPORT_SOURCES=		$(wildcard export/*.vala)
OPENGL_SOURCES=		$(wildcard openGl/*.vala)
MATHS_SOURCES=		$(wildcard maths/*.c)
REFACTORING_SOURCES=$(wildcard refactoring/*.vala)

ENGINE_SOURCE_FOLDERS= expressions utils/di utils povray \
		lego/files/parsing lego/files lego/library lego/objects/nodes lego/objects lego \
		options peeron
UI_SOURCE_FOLDERS= drag_and_drop widgets undo .

ENGINE_SOURCES= $(foreach folder, $(ENGINE_SOURCE_FOLDERS), $(wildcard $(folder)/*.vala))
GTK_SOURCES= $(foreach folder, $(UI_SOURCE_FOLDERS), $(wildcard gtk/$(folder)/*.vala))

ENGINE_C_SOURCES=$(MATHS_SOURCES)

SOURCES=$(wildcard *.vala) $(ENGINE_SOURCES) $(OPENGL_SOURCES) $(GTK_SOURCES) $(EXPORT_SOURCES) $(REFACTORING_SOURCES)

TEST_EXECUTABLE_SOURCES= $(TEST_SOURCES) $(ENGINE_SOURCES)

VALA_PACKAGES = gtk+-2.0 gee-0.8 gl gtkglext-1.0 gdkglext-1.0 gio-2.0 geometry libsoup-2.4 libxml-2.0 json-glib-1.0

VALA_PKG_ARGS = $(foreach pkg, $(VALA_PACKAGES), --pkg $(pkg))

VALA_OPTS= --vapidir=vapi $(VALA_PKG_ARGS) -X -w -X -Ivapi -X -msse -X -lm -X -O2
VALA_DEBUG_OPTS= --vapidir=vapi $(VALA_PKG_ARGS) -X -w -X -Ivapi -X -msse -X -lm -g

EXECUTABLE_NAME = ldraw
TEST_EXECUTABLE_NAME = $(EXECUTABLE_NAME)_tests

all: $(TEST_EXECUTABLE_NAME) $(EXECUTABLE_NAME)
	./$(TEST_EXECUTABLE_NAME)

debug: $(SOURCES) $(ENGINE_C_SOURCES)
	$(VALACC) $(VALA_DEBUG_OPTS) $(SOURCES) $(ENGINE_C_SOURCES) -o $(EXECUTABLE_NAME)_debug

$(EXECUTABLE_NAME): $(SOURCES) $(ENGINE_C_SOURCES)
	$(VALACC) $(VALA_OPTS) $(SOURCES) $(ENGINE_C_SOURCES) -o $(EXECUTABLE_NAME)

$(TEST_EXECUTABLE_NAME): $(TEST_EXECUTABLE_SOURCES)
	$(VALACC) $(VALA_OPTS) $(TEST_EXECUTABLE_SOURCES) $(ENGINE_C_SOURCES) -o $(TEST_EXECUTABLE_NAME)

clean:
	rm -f $(EXECUTABLE_NAME) $(TEST_EXECUTABLE_NAME) $(EXECUTABLE_NAME)_debug

tempclean:
	rm -f $(patsubst %.vala,%.vala.c,$(SOURCES) $(TEST_SOURCES))
	rm -f $(patsubst %.vala,%.c,$(SOURCES) $(TEST_SOURCES))
