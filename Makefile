
OPENGL_SOURCES=		$(wildcard openGl/*.vala)
POVRAY_SOURCES=		$(wildcard povray/*.vala)
MATHS_SOURCES=		$(wildcard maths/*.vala)
LEGO_PARTS_SOURCES=	$(wildcard lego/partsLib/*.vala)
LEGO_SOURCES=		$(wildcard lego/*.vala) $(LEGO_PARTS_SOURCES)
WIDGETS_SOURCES=	$(wildcard gtk/widgets/*.vala)
GTK_SOURCES=		$(wildcard gtk/*.vala) $(WIDGETS_SOURCES)

SOURCES=$(wildcard *.vala) $(POVRAY_SOURCES) \
 $(LEGO_SOURCES) $(MATHS_SOURCES) $(OPENGL_SOURCES) \
 $(GTK_SOURCES)

VALA_PACKAGES = --pkg gtk+-2.0 --pkg gee-1.0 --pkg gl --pkg gtkglext-1.0 --pkg gdkglext-1.0
VALA_OPTS= -g --vapidir=vapi $(VALA_PACKAGES)
EXECUTABLE_NAME = ldraw

all:
	valac $(VALA_OPTS) $(SOURCES) -o $(EXECUTABLE_NAME)

gir/gtkglext.gir:
	g-ir-scanner -l gtkglext-x11-1.0 --pkg=gtkglext-1.0 --accept-unprefixed -n Gtk \
	/usr/include/gtkglext-1.0/gtk/gtkgl*.h /usr/include/gtkglext-1.0/gtk/gtkgl*.h \
	-o gir/gtkglext.gir
