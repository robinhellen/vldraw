
TEST_EXPR_SOURCES=		$(wildcard tests/expressions/*.vala)
TEST_MATHS_SOURCES=		$(wildcard tests/vector/*.vala)
TEST_FRAMEWORK_SOURCES= $(wildcard tests/*.vala)

TEST_SOURCES= $(TEST_FRAMEWORK_SOURCES) $(TEST_MATHS_SOURCES) $(TEST_EXPR_SOURCES)

EXPORT_SOURCES=		$(wildcard export/*.vala)
EXPRESSIONS_SOURCES=$(wildcard expressions/*.vala)
UTILS_SOURCES=		$(wildcard utils/*.vala)
OPENGL_SOURCES=		$(wildcard openGl/*.vala)
POVRAY_SOURCES=		$(wildcard povray/*.vala)
MATHS_SOURCES=		$(wildcard maths/*.c)
LEGO_PARTS_SOURCES=	$(wildcard lego/partsLib/*.vala)
LEGO_NODES_SOURCES=	$(wildcard lego/nodes/*.vala)
LEGO_SOURCES=		$(wildcard lego/*.vala) $(LEGO_PARTS_SOURCES) $(LEGO_NODES_SOURCES)
OPTIONS_SOURCES=	$(wildcard options/*.vala)
PEERON_SOURCES=		$(wildcard peeron/*.vala)
WIDGETS_SOURCES=	$(wildcard gtk/widgets/*.vala)
UNDO_SOURCES=		$(wildcard gtk/undo/*.vala)
GTK_SOURCES=		$(wildcard gtk/*.vala) $(WIDGETS_SOURCES) $(UNDO_SOURCES)

ENGINE_SOURCES=$(POVRAY_SOURCES) $(LEGO_SOURCES) $(OPTIONS_SOURCES) $(UTILS_SOURCES) $(EXPRESSIONS_SOURCES) $(PEERON_SOURCES)

ENGINE_C_SOURCES=$(MATHS_SOURCES)

SOURCES=$(wildcard *.vala) $(ENGINE_SOURCES) $(OPENGL_SOURCES) $(GTK_SOURCES) $(EXPORT_SOURCES)

TEST_EXECUTABLE_SOURCES= $(TEST_SOURCES) $(ENGINE_SOURCES) i_report_progress.vala

VALA_PACKAGES = gtk+-2.0 gee-0.8 gl gtkglext-1.0 gdkglext-1.0 gio-2.0 geometry libsoup-2.4 libxml-2.0

VALA_PKG_ARGS = $(foreach pkg, $(VALA_PACKAGES), --pkg $(pkg))

VALA_OPTS= --vapidir=vapi $(VALA_PKG_ARGS) -X -w -X -Ivapi -X -msse -X -lm -X -O2
#VALA_OPTS= --vapidir=vapi $(VALA_PKG_ARGS) -X -w -X -Ivapi -X -msse -X -lm -g

EXECUTABLE_NAME = ldraw
TEST_EXECUTABLE_NAME = $(EXECUTABLE_NAME)_tests

all: $(TEST_EXECUTABLE_NAME) $(EXECUTABLE_NAME)
	./$(TEST_EXECUTABLE_NAME)

$(EXECUTABLE_NAME): $(SOURCES) $(ENGINE_C_SOURCES)
	valac-0.22 $(VALA_OPTS) $(SOURCES) $(ENGINE_C_SOURCES) -o $(EXECUTABLE_NAME)

$(TEST_EXECUTABLE_NAME): $(TEST_EXECUTABLE_SOURCES)
	valac-0.22 $(VALA_OPTS) $(TEST_EXECUTABLE_SOURCES) $(ENGINE_C_SOURCES) -o $(TEST_EXECUTABLE_NAME)

clean:
	rm $(EXECUTABLE_NAME) $(TEST_EXECUTABLE_NAME)

tempclean:
	rm -f $(patsubst %.vala,%.vala.c,$(SOURCES) $(TEST_SOURCES))
	rm -f $(patsubst %.vala,%.c,$(SOURCES) $(TEST_SOURCES))
