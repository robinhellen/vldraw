
TEST_MATHS_SOURCES=		$(wildcard tests/vector/*.vala)
TEST_FRAMEWORK_SOURCES= $(wildcard tests/*.vala)

TEST_SOURCES= $(TEST_FRAMEWORK_SOURCES) $(TEST_MATHS_SOURCES)

UTILS_SOURCES=		$(wildcard utils/*.vala)
OPENGL_SOURCES=		$(wildcard openGl/*.vala)
POVRAY_SOURCES=		$(wildcard povray/*.vala)
MATHS_SOURCES=		$(wildcard maths/*.vala)
LEGO_PARTS_SOURCES=	$(wildcard lego/partsLib/*.vala)
LEGO_NODES_SOURCES=	$(wildcard lego/nodes/*.vala)
LEGO_SOURCES=		$(wildcard lego/*.vala) $(LEGO_PARTS_SOURCES) $(LEGO_NODES_SOURCES)
OPTIONS_SOURCES=	$(wildcard options/*.vala)
WIDGETS_SOURCES=	$(wildcard gtk/widgets/*.vala)
GTK_SOURCES=		$(wildcard gtk/*.vala) $(WIDGETS_SOURCES)

ENGINE_SOURCES=$(POVRAY_SOURCES) \
 $(LEGO_SOURCES) $(MATHS_SOURCES) $(OPTIONS_SOURCES) $(UTILS_SOURCES)

SOURCES=$(wildcard *.vala) $(ENGINE_SOURCES) $(OPENGL_SOURCES) \
 $(GTK_SOURCES)

TEST_EXECUTABLE_SOURCES= $(TEST_SOURCES) $(ENGINE_SOURCES)

VALA_PACKAGES = --pkg gtk+-2.0 --pkg gee-0.8 --pkg gl --pkg gtkglext-1.0 --pkg gdkglext-1.0 --pkg gio-2.0
VALA_OPTS= -g --vapidir=vapi $(VALA_PACKAGES)
EXECUTABLE_NAME = ldraw
TEST_EXECUTABLE_NAME = $(EXECUTABLE_NAME)_tests

all: $(TEST_EXECUTABLE_NAME) $(EXECUTABLE_NAME)
	./$(TEST_EXECUTABLE_NAME)

$(EXECUTABLE_NAME): $(SOURCES)
	valac-0.18 $(VALA_OPTS) $(SOURCES) -o $(EXECUTABLE_NAME)

$(TEST_EXECUTABLE_NAME): $(TEST_EXECUTABLE_SOURCES)
	valac-0.18 $(VALA_OPTS) $(TEST_EXECUTABLE_SOURCES) -o $(TEST_EXECUTABLE_NAME)

clean:
	rm $(EXECUTABLE_NAME)

tempclean:
	rm -f $(patsubst %.vala,%.c,$(SOURCES) $(TEST_SOURCES)) $(patsubst %.vala,%.vala.c,$(SOURCES) $(TEST_SOURCES))
