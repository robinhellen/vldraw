/* bounds.c generated by valac 0.18.1, the Vala compiler
 * generated from bounds.vala, do not modify */


#include <glib.h>
#include <glib-object.h>
#include <float.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>
#include <gobject/gvaluecollector.h>


#define LDRAW_MATHS_TYPE_BOUNDS (ldraw_maths_bounds_get_type ())
#define LDRAW_MATHS_BOUNDS(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), LDRAW_MATHS_TYPE_BOUNDS, LdrawMathsBounds))
#define LDRAW_MATHS_BOUNDS_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), LDRAW_MATHS_TYPE_BOUNDS, LdrawMathsBoundsClass))
#define LDRAW_MATHS_IS_BOUNDS(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), LDRAW_MATHS_TYPE_BOUNDS))
#define LDRAW_MATHS_IS_BOUNDS_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), LDRAW_MATHS_TYPE_BOUNDS))
#define LDRAW_MATHS_BOUNDS_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), LDRAW_MATHS_TYPE_BOUNDS, LdrawMathsBoundsClass))

typedef struct _LdrawMathsBounds LdrawMathsBounds;
typedef struct _LdrawMathsBoundsClass LdrawMathsBoundsClass;
typedef struct _LdrawMathsBoundsPrivate LdrawMathsBoundsPrivate;

#define LDRAW_MATHS_TYPE_VECTOR (ldraw_maths_vector_get_type ())
typedef struct _LdrawMathsVector LdrawMathsVector;

#define LDRAW_MATHS_TYPE_MATRIX (ldraw_maths_matrix_get_type ())
typedef struct _LdrawMathsMatrix LdrawMathsMatrix;
#define _ldraw_maths_bounds_unref0(var) ((var == NULL) ? NULL : (var = (ldraw_maths_bounds_unref (var), NULL)))
#define _g_free0(var) (var = (g_free (var), NULL))
typedef struct _LdrawMathsParamSpecBounds LdrawMathsParamSpecBounds;

struct _LdrawMathsVector {
	gfloat m_Values[3];
};

struct _LdrawMathsBounds {
	GTypeInstance parent_instance;
	volatile int ref_count;
	LdrawMathsBoundsPrivate * priv;
	LdrawMathsVector m_Min;
	LdrawMathsVector m_Max;
	gboolean m_Initialized;
};

struct _LdrawMathsBoundsClass {
	GTypeClass parent_class;
	void (*finalize) (LdrawMathsBounds *self);
};

struct _LdrawMathsMatrix {
	gfloat* m_Values;
	gint m_Values_length1;
	gint m_Values_length2;
};

struct _LdrawMathsParamSpecBounds {
	GParamSpec parent_instance;
};


static gpointer ldraw_maths_bounds_parent_class = NULL;

gpointer ldraw_maths_bounds_ref (gpointer instance);
void ldraw_maths_bounds_unref (gpointer instance);
GParamSpec* ldraw_maths_param_spec_bounds (const gchar* name, const gchar* nick, const gchar* blurb, GType object_type, GParamFlags flags);
void ldraw_maths_value_set_bounds (GValue* value, gpointer v_object);
void ldraw_maths_value_take_bounds (GValue* value, gpointer v_object);
gpointer ldraw_maths_value_get_bounds (const GValue* value);
GType ldraw_maths_bounds_get_type (void) G_GNUC_CONST;
GType ldraw_maths_vector_get_type (void) G_GNUC_CONST;
LdrawMathsVector* ldraw_maths_vector_dup (const LdrawMathsVector* self);
void ldraw_maths_vector_free (LdrawMathsVector* self);
enum  {
	LDRAW_MATHS_BOUNDS_DUMMY_PROPERTY
};
LdrawMathsBounds* ldraw_maths_bounds_new (void);
LdrawMathsBounds* ldraw_maths_bounds_construct (GType object_type);
void ldraw_maths_vector_get_NullVector (LdrawMathsVector* result);
LdrawMathsBounds* ldraw_maths_bounds_new_Clone (LdrawMathsBounds* b);
LdrawMathsBounds* ldraw_maths_bounds_construct_Clone (GType object_type, LdrawMathsBounds* b);
void ldraw_maths_bounds_Union (LdrawMathsBounds* self, LdrawMathsVector* v);
void ldraw_maths_vector_init_Min (LdrawMathsVector *self, LdrawMathsVector* a, LdrawMathsVector* b);
void ldraw_maths_vector_init_Max (LdrawMathsVector *self, LdrawMathsVector* a, LdrawMathsVector* b);
GType ldraw_maths_matrix_get_type (void) G_GNUC_CONST;
LdrawMathsMatrix* ldraw_maths_matrix_dup (const LdrawMathsMatrix* self);
void ldraw_maths_matrix_free (LdrawMathsMatrix* self);
void ldraw_maths_matrix_copy (const LdrawMathsMatrix* self, LdrawMathsMatrix* dest);
void ldraw_maths_matrix_destroy (LdrawMathsMatrix* self);
void ldraw_maths_bounds_IncludeBounds (LdrawMathsBounds* self, LdrawMathsBounds* b, LdrawMathsMatrix* transform, LdrawMathsVector* center);
void ldraw_maths_matrix_TransformVector (LdrawMathsMatrix *self, LdrawMathsVector* v, LdrawMathsVector* result);
void ldraw_maths_vector_Add (LdrawMathsVector *self, LdrawMathsVector* v, LdrawMathsVector* result);
void ldraw_maths_bounds_Center (LdrawMathsBounds* self, LdrawMathsVector* result);
void ldraw_maths_vector_Scale (LdrawMathsVector *self, gfloat scale, LdrawMathsVector* result);
LdrawMathsBounds* ldraw_maths_bounds_Scale (LdrawMathsBounds* self, gfloat scale);
void ldraw_maths_vector_Subtract (LdrawMathsVector *self, LdrawMathsVector* v, LdrawMathsVector* result);
LdrawMathsBounds* ldraw_maths_bounds_Transform (LdrawMathsBounds* self, LdrawMathsMatrix* m, LdrawMathsVector* pos);
gchar* ldraw_maths_bounds_to_string (LdrawMathsBounds* self);
gchar* ldraw_maths_vector_to_string (LdrawMathsVector *self);
gfloat ldraw_maths_bounds_get_MaxX (LdrawMathsBounds* self);
gfloat ldraw_maths_vector_get_X (LdrawMathsVector* self);
gfloat ldraw_maths_bounds_get_MaxY (LdrawMathsBounds* self);
gfloat ldraw_maths_vector_get_Y (LdrawMathsVector* self);
gfloat ldraw_maths_bounds_get_MaxZ (LdrawMathsBounds* self);
gfloat ldraw_maths_vector_get_Z (LdrawMathsVector* self);
gfloat ldraw_maths_bounds_get_MinX (LdrawMathsBounds* self);
gfloat ldraw_maths_bounds_get_MinY (LdrawMathsBounds* self);
gfloat ldraw_maths_bounds_get_MinZ (LdrawMathsBounds* self);
gfloat ldraw_maths_bounds_get_Radius (LdrawMathsBounds* self);
gfloat ldraw_maths_vector_get_Magnitude (LdrawMathsVector* self);
static void ldraw_maths_bounds_finalize (LdrawMathsBounds* obj);


LdrawMathsBounds* ldraw_maths_bounds_construct (GType object_type) {
	LdrawMathsBounds* self = NULL;
	LdrawMathsVector _tmp0_;
	LdrawMathsVector _tmp1_;
	LdrawMathsVector _tmp2_;
	LdrawMathsVector _tmp3_;
	self = (LdrawMathsBounds*) g_type_create_instance (object_type);
	ldraw_maths_vector_get_NullVector (&_tmp0_);
	_tmp1_ = _tmp0_;
	self->m_Min = _tmp1_;
	ldraw_maths_vector_get_NullVector (&_tmp2_);
	_tmp3_ = _tmp2_;
	self->m_Max = _tmp3_;
	return self;
}


LdrawMathsBounds* ldraw_maths_bounds_new (void) {
	return ldraw_maths_bounds_construct (LDRAW_MATHS_TYPE_BOUNDS);
}


LdrawMathsBounds* ldraw_maths_bounds_construct_Clone (GType object_type, LdrawMathsBounds* b) {
	LdrawMathsBounds* self = NULL;
	LdrawMathsBounds* _tmp0_;
	LdrawMathsVector _tmp1_;
	LdrawMathsBounds* _tmp2_;
	LdrawMathsVector _tmp3_;
	LdrawMathsBounds* _tmp4_;
	gboolean _tmp5_;
	g_return_val_if_fail (b != NULL, NULL);
	self = (LdrawMathsBounds*) g_type_create_instance (object_type);
	_tmp0_ = b;
	_tmp1_ = _tmp0_->m_Min;
	self->m_Min = _tmp1_;
	_tmp2_ = b;
	_tmp3_ = _tmp2_->m_Max;
	self->m_Max = _tmp3_;
	_tmp4_ = b;
	_tmp5_ = _tmp4_->m_Initialized;
	self->m_Initialized = _tmp5_;
	return self;
}


LdrawMathsBounds* ldraw_maths_bounds_new_Clone (LdrawMathsBounds* b) {
	return ldraw_maths_bounds_construct_Clone (LDRAW_MATHS_TYPE_BOUNDS, b);
}


void ldraw_maths_bounds_Union (LdrawMathsBounds* self, LdrawMathsVector* v) {
	gboolean _tmp0_;
	g_return_if_fail (self != NULL);
	g_return_if_fail (v != NULL);
	_tmp0_ = self->m_Initialized;
	if (!_tmp0_) {
		LdrawMathsVector _tmp1_;
		LdrawMathsVector _tmp2_;
		_tmp1_ = *v;
		self->m_Max = _tmp1_;
		_tmp2_ = self->m_Max;
		self->m_Min = _tmp2_;
		self->m_Initialized = TRUE;
	} else {
		LdrawMathsVector _tmp3_;
		LdrawMathsVector _tmp4_;
		LdrawMathsVector _tmp5_;
		LdrawMathsVector _tmp6_;
		_tmp3_ = self->m_Min;
		_tmp4_ = *v;
		ldraw_maths_vector_init_Min (&self->m_Min, &_tmp3_, &_tmp4_);
		_tmp5_ = self->m_Max;
		_tmp6_ = *v;
		ldraw_maths_vector_init_Max (&self->m_Max, &_tmp5_, &_tmp6_);
	}
}


void ldraw_maths_bounds_IncludeBounds (LdrawMathsBounds* self, LdrawMathsBounds* b, LdrawMathsMatrix* transform, LdrawMathsVector* center) {
	LdrawMathsBounds* _tmp0_;
	LdrawMathsVector _tmp1_;
	LdrawMathsVector _tmp2_ = {0};
	LdrawMathsVector _tmp3_;
	LdrawMathsVector _tmp4_ = {0};
	LdrawMathsBounds* _tmp5_;
	LdrawMathsVector _tmp6_;
	LdrawMathsVector _tmp7_ = {0};
	LdrawMathsVector _tmp8_;
	LdrawMathsVector _tmp9_ = {0};
	g_return_if_fail (self != NULL);
	g_return_if_fail (b != NULL);
	g_return_if_fail (transform != NULL);
	g_return_if_fail (center != NULL);
	_tmp0_ = b;
	_tmp1_ = _tmp0_->m_Min;
	ldraw_maths_matrix_TransformVector (transform, &_tmp1_, &_tmp2_);
	_tmp3_ = *center;
	ldraw_maths_vector_Add (&_tmp2_, &_tmp3_, &_tmp4_);
	ldraw_maths_bounds_Union (self, &_tmp4_);
	_tmp5_ = b;
	_tmp6_ = _tmp5_->m_Max;
	ldraw_maths_matrix_TransformVector (transform, &_tmp6_, &_tmp7_);
	_tmp8_ = *center;
	ldraw_maths_vector_Add (&_tmp7_, &_tmp8_, &_tmp9_);
	ldraw_maths_bounds_Union (self, &_tmp9_);
}


void ldraw_maths_bounds_Center (LdrawMathsBounds* self, LdrawMathsVector* result) {
	LdrawMathsVector _tmp0_;
	LdrawMathsVector _tmp1_ = {0};
	LdrawMathsVector _tmp2_ = {0};
	g_return_if_fail (self != NULL);
	_tmp0_ = self->m_Min;
	ldraw_maths_vector_Add (&self->m_Max, &_tmp0_, &_tmp1_);
	ldraw_maths_vector_Scale (&_tmp1_, 0.5f, &_tmp2_);
	*result = _tmp2_;
	return;
}


LdrawMathsBounds* ldraw_maths_bounds_Scale (LdrawMathsBounds* self, gfloat scale) {
	LdrawMathsBounds* result = NULL;
	LdrawMathsBounds* _tmp0_;
	LdrawMathsBounds* b;
	LdrawMathsVector _tmp1_ = {0};
	LdrawMathsVector center;
	LdrawMathsVector _tmp2_;
	LdrawMathsVector _tmp3_ = {0};
	LdrawMathsVector diagonal;
	gfloat _tmp4_;
	LdrawMathsVector _tmp5_ = {0};
	LdrawMathsVector scaledDiagonal;
	LdrawMathsVector _tmp6_;
	LdrawMathsVector _tmp7_ = {0};
	LdrawMathsVector _tmp8_;
	LdrawMathsVector _tmp9_ = {0};
	g_return_val_if_fail (self != NULL, NULL);
	_tmp0_ = ldraw_maths_bounds_new ();
	b = _tmp0_;
	ldraw_maths_bounds_Center (self, &_tmp1_);
	center = _tmp1_;
	_tmp2_ = center;
	ldraw_maths_vector_Subtract (&self->m_Min, &_tmp2_, &_tmp3_);
	diagonal = _tmp3_;
	_tmp4_ = scale;
	ldraw_maths_vector_Scale (&diagonal, _tmp4_, &_tmp5_);
	scaledDiagonal = _tmp5_;
	_tmp6_ = scaledDiagonal;
	ldraw_maths_vector_Add (&center, &_tmp6_, &_tmp7_);
	b->m_Min = _tmp7_;
	_tmp8_ = scaledDiagonal;
	ldraw_maths_vector_Subtract (&center, &_tmp8_, &_tmp9_);
	b->m_Max = _tmp9_;
	b->m_Initialized = TRUE;
	result = b;
	return result;
}


LdrawMathsBounds* ldraw_maths_bounds_Transform (LdrawMathsBounds* self, LdrawMathsMatrix* m, LdrawMathsVector* pos) {
	LdrawMathsBounds* result = NULL;
	LdrawMathsBounds* _tmp0_;
	LdrawMathsBounds* b;
	LdrawMathsVector _tmp1_;
	LdrawMathsVector _tmp2_ = {0};
	LdrawMathsVector _tmp3_;
	LdrawMathsVector _tmp4_ = {0};
	LdrawMathsVector _tmp5_;
	LdrawMathsVector _tmp6_ = {0};
	LdrawMathsVector _tmp7_;
	LdrawMathsVector _tmp8_ = {0};
	g_return_val_if_fail (self != NULL, NULL);
	g_return_val_if_fail (m != NULL, NULL);
	g_return_val_if_fail (pos != NULL, NULL);
	_tmp0_ = ldraw_maths_bounds_new ();
	b = _tmp0_;
	_tmp1_ = self->m_Min;
	ldraw_maths_matrix_TransformVector (m, &_tmp1_, &_tmp2_);
	_tmp3_ = *pos;
	ldraw_maths_vector_Add (&_tmp2_, &_tmp3_, &_tmp4_);
	b->m_Min = _tmp4_;
	_tmp5_ = self->m_Max;
	ldraw_maths_matrix_TransformVector (m, &_tmp5_, &_tmp6_);
	_tmp7_ = *pos;
	ldraw_maths_vector_Add (&_tmp6_, &_tmp7_, &_tmp8_);
	b->m_Max = _tmp8_;
	b->m_Initialized = TRUE;
	result = b;
	return result;
}


gchar* ldraw_maths_bounds_to_string (LdrawMathsBounds* self) {
	gchar* result = NULL;
	gchar* _tmp0_ = NULL;
	gchar* _tmp1_;
	gchar* _tmp2_ = NULL;
	gchar* _tmp3_;
	gchar* _tmp4_ = NULL;
	gchar* _tmp5_;
	g_return_val_if_fail (self != NULL, NULL);
	_tmp0_ = ldraw_maths_vector_to_string (&self->m_Min);
	_tmp1_ = _tmp0_;
	_tmp2_ = ldraw_maths_vector_to_string (&self->m_Max);
	_tmp3_ = _tmp2_;
	_tmp4_ = g_strconcat ("Bounding box: ", _tmp1_, ", ", _tmp3_, NULL);
	_tmp5_ = _tmp4_;
	_g_free0 (_tmp3_);
	_g_free0 (_tmp1_);
	result = _tmp5_;
	return result;
}


gfloat ldraw_maths_bounds_get_MaxX (LdrawMathsBounds* self) {
	gfloat result;
	LdrawMathsVector _tmp0_;
	gfloat _tmp1_;
	gfloat _tmp2_;
	g_return_val_if_fail (self != NULL, 0.0F);
	_tmp0_ = self->m_Max;
	_tmp1_ = ldraw_maths_vector_get_X (&_tmp0_);
	_tmp2_ = _tmp1_;
	result = _tmp2_;
	return result;
}


gfloat ldraw_maths_bounds_get_MaxY (LdrawMathsBounds* self) {
	gfloat result;
	LdrawMathsVector _tmp0_;
	gfloat _tmp1_;
	gfloat _tmp2_;
	g_return_val_if_fail (self != NULL, 0.0F);
	_tmp0_ = self->m_Max;
	_tmp1_ = ldraw_maths_vector_get_Y (&_tmp0_);
	_tmp2_ = _tmp1_;
	result = _tmp2_;
	return result;
}


gfloat ldraw_maths_bounds_get_MaxZ (LdrawMathsBounds* self) {
	gfloat result;
	LdrawMathsVector _tmp0_;
	gfloat _tmp1_;
	gfloat _tmp2_;
	g_return_val_if_fail (self != NULL, 0.0F);
	_tmp0_ = self->m_Max;
	_tmp1_ = ldraw_maths_vector_get_Z (&_tmp0_);
	_tmp2_ = _tmp1_;
	result = _tmp2_;
	return result;
}


gfloat ldraw_maths_bounds_get_MinX (LdrawMathsBounds* self) {
	gfloat result;
	LdrawMathsVector _tmp0_;
	gfloat _tmp1_;
	gfloat _tmp2_;
	g_return_val_if_fail (self != NULL, 0.0F);
	_tmp0_ = self->m_Min;
	_tmp1_ = ldraw_maths_vector_get_X (&_tmp0_);
	_tmp2_ = _tmp1_;
	result = _tmp2_;
	return result;
}


gfloat ldraw_maths_bounds_get_MinY (LdrawMathsBounds* self) {
	gfloat result;
	LdrawMathsVector _tmp0_;
	gfloat _tmp1_;
	gfloat _tmp2_;
	g_return_val_if_fail (self != NULL, 0.0F);
	_tmp0_ = self->m_Min;
	_tmp1_ = ldraw_maths_vector_get_Y (&_tmp0_);
	_tmp2_ = _tmp1_;
	result = _tmp2_;
	return result;
}


gfloat ldraw_maths_bounds_get_MinZ (LdrawMathsBounds* self) {
	gfloat result;
	LdrawMathsVector _tmp0_;
	gfloat _tmp1_;
	gfloat _tmp2_;
	g_return_val_if_fail (self != NULL, 0.0F);
	_tmp0_ = self->m_Min;
	_tmp1_ = ldraw_maths_vector_get_Z (&_tmp0_);
	_tmp2_ = _tmp1_;
	result = _tmp2_;
	return result;
}


gfloat ldraw_maths_bounds_get_Radius (LdrawMathsBounds* self) {
	gfloat result;
	LdrawMathsVector _tmp0_ = {0};
	LdrawMathsVector _tmp1_;
	LdrawMathsVector _tmp2_ = {0};
	gfloat _tmp3_;
	gfloat _tmp4_;
	g_return_val_if_fail (self != NULL, 0.0F);
	ldraw_maths_bounds_Center (self, &_tmp0_);
	_tmp1_ = self->m_Min;
	ldraw_maths_vector_Subtract (&_tmp0_, &_tmp1_, &_tmp2_);
	_tmp3_ = ldraw_maths_vector_get_Magnitude (&_tmp2_);
	_tmp4_ = _tmp3_;
	result = _tmp4_;
	return result;
}


static void ldraw_maths_value_bounds_init (GValue* value) {
	value->data[0].v_pointer = NULL;
}


static void ldraw_maths_value_bounds_free_value (GValue* value) {
	if (value->data[0].v_pointer) {
		ldraw_maths_bounds_unref (value->data[0].v_pointer);
	}
}


static void ldraw_maths_value_bounds_copy_value (const GValue* src_value, GValue* dest_value) {
	if (src_value->data[0].v_pointer) {
		dest_value->data[0].v_pointer = ldraw_maths_bounds_ref (src_value->data[0].v_pointer);
	} else {
		dest_value->data[0].v_pointer = NULL;
	}
}


static gpointer ldraw_maths_value_bounds_peek_pointer (const GValue* value) {
	return value->data[0].v_pointer;
}


static gchar* ldraw_maths_value_bounds_collect_value (GValue* value, guint n_collect_values, GTypeCValue* collect_values, guint collect_flags) {
	if (collect_values[0].v_pointer) {
		LdrawMathsBounds* object;
		object = collect_values[0].v_pointer;
		if (object->parent_instance.g_class == NULL) {
			return g_strconcat ("invalid unclassed object pointer for value type `", G_VALUE_TYPE_NAME (value), "'", NULL);
		} else if (!g_value_type_compatible (G_TYPE_FROM_INSTANCE (object), G_VALUE_TYPE (value))) {
			return g_strconcat ("invalid object type `", g_type_name (G_TYPE_FROM_INSTANCE (object)), "' for value type `", G_VALUE_TYPE_NAME (value), "'", NULL);
		}
		value->data[0].v_pointer = ldraw_maths_bounds_ref (object);
	} else {
		value->data[0].v_pointer = NULL;
	}
	return NULL;
}


static gchar* ldraw_maths_value_bounds_lcopy_value (const GValue* value, guint n_collect_values, GTypeCValue* collect_values, guint collect_flags) {
	LdrawMathsBounds** object_p;
	object_p = collect_values[0].v_pointer;
	if (!object_p) {
		return g_strdup_printf ("value location for `%s' passed as NULL", G_VALUE_TYPE_NAME (value));
	}
	if (!value->data[0].v_pointer) {
		*object_p = NULL;
	} else if (collect_flags & G_VALUE_NOCOPY_CONTENTS) {
		*object_p = value->data[0].v_pointer;
	} else {
		*object_p = ldraw_maths_bounds_ref (value->data[0].v_pointer);
	}
	return NULL;
}


GParamSpec* ldraw_maths_param_spec_bounds (const gchar* name, const gchar* nick, const gchar* blurb, GType object_type, GParamFlags flags) {
	LdrawMathsParamSpecBounds* spec;
	g_return_val_if_fail (g_type_is_a (object_type, LDRAW_MATHS_TYPE_BOUNDS), NULL);
	spec = g_param_spec_internal (G_TYPE_PARAM_OBJECT, name, nick, blurb, flags);
	G_PARAM_SPEC (spec)->value_type = object_type;
	return G_PARAM_SPEC (spec);
}


gpointer ldraw_maths_value_get_bounds (const GValue* value) {
	g_return_val_if_fail (G_TYPE_CHECK_VALUE_TYPE (value, LDRAW_MATHS_TYPE_BOUNDS), NULL);
	return value->data[0].v_pointer;
}


void ldraw_maths_value_set_bounds (GValue* value, gpointer v_object) {
	LdrawMathsBounds* old;
	g_return_if_fail (G_TYPE_CHECK_VALUE_TYPE (value, LDRAW_MATHS_TYPE_BOUNDS));
	old = value->data[0].v_pointer;
	if (v_object) {
		g_return_if_fail (G_TYPE_CHECK_INSTANCE_TYPE (v_object, LDRAW_MATHS_TYPE_BOUNDS));
		g_return_if_fail (g_value_type_compatible (G_TYPE_FROM_INSTANCE (v_object), G_VALUE_TYPE (value)));
		value->data[0].v_pointer = v_object;
		ldraw_maths_bounds_ref (value->data[0].v_pointer);
	} else {
		value->data[0].v_pointer = NULL;
	}
	if (old) {
		ldraw_maths_bounds_unref (old);
	}
}


void ldraw_maths_value_take_bounds (GValue* value, gpointer v_object) {
	LdrawMathsBounds* old;
	g_return_if_fail (G_TYPE_CHECK_VALUE_TYPE (value, LDRAW_MATHS_TYPE_BOUNDS));
	old = value->data[0].v_pointer;
	if (v_object) {
		g_return_if_fail (G_TYPE_CHECK_INSTANCE_TYPE (v_object, LDRAW_MATHS_TYPE_BOUNDS));
		g_return_if_fail (g_value_type_compatible (G_TYPE_FROM_INSTANCE (v_object), G_VALUE_TYPE (value)));
		value->data[0].v_pointer = v_object;
	} else {
		value->data[0].v_pointer = NULL;
	}
	if (old) {
		ldraw_maths_bounds_unref (old);
	}
}


static void ldraw_maths_bounds_class_init (LdrawMathsBoundsClass * klass) {
	ldraw_maths_bounds_parent_class = g_type_class_peek_parent (klass);
	LDRAW_MATHS_BOUNDS_CLASS (klass)->finalize = ldraw_maths_bounds_finalize;
}


static void ldraw_maths_bounds_instance_init (LdrawMathsBounds * self) {
	self->m_Initialized = FALSE;
	self->ref_count = 1;
}


static void ldraw_maths_bounds_finalize (LdrawMathsBounds* obj) {
	LdrawMathsBounds * self;
	self = G_TYPE_CHECK_INSTANCE_CAST (obj, LDRAW_MATHS_TYPE_BOUNDS, LdrawMathsBounds);
}


GType ldraw_maths_bounds_get_type (void) {
	static volatile gsize ldraw_maths_bounds_type_id__volatile = 0;
	if (g_once_init_enter (&ldraw_maths_bounds_type_id__volatile)) {
		static const GTypeValueTable g_define_type_value_table = { ldraw_maths_value_bounds_init, ldraw_maths_value_bounds_free_value, ldraw_maths_value_bounds_copy_value, ldraw_maths_value_bounds_peek_pointer, "p", ldraw_maths_value_bounds_collect_value, "p", ldraw_maths_value_bounds_lcopy_value };
		static const GTypeInfo g_define_type_info = { sizeof (LdrawMathsBoundsClass), (GBaseInitFunc) NULL, (GBaseFinalizeFunc) NULL, (GClassInitFunc) ldraw_maths_bounds_class_init, (GClassFinalizeFunc) NULL, NULL, sizeof (LdrawMathsBounds), 0, (GInstanceInitFunc) ldraw_maths_bounds_instance_init, &g_define_type_value_table };
		static const GTypeFundamentalInfo g_define_type_fundamental_info = { (G_TYPE_FLAG_CLASSED | G_TYPE_FLAG_INSTANTIATABLE | G_TYPE_FLAG_DERIVABLE | G_TYPE_FLAG_DEEP_DERIVABLE) };
		GType ldraw_maths_bounds_type_id;
		ldraw_maths_bounds_type_id = g_type_register_fundamental (g_type_fundamental_next (), "LdrawMathsBounds", &g_define_type_info, &g_define_type_fundamental_info, 0);
		g_once_init_leave (&ldraw_maths_bounds_type_id__volatile, ldraw_maths_bounds_type_id);
	}
	return ldraw_maths_bounds_type_id__volatile;
}


gpointer ldraw_maths_bounds_ref (gpointer instance) {
	LdrawMathsBounds* self;
	self = instance;
	g_atomic_int_inc (&self->ref_count);
	return instance;
}


void ldraw_maths_bounds_unref (gpointer instance) {
	LdrawMathsBounds* self;
	self = instance;
	if (g_atomic_int_dec_and_test (&self->ref_count)) {
		LDRAW_MATHS_BOUNDS_GET_CLASS (self)->finalize (self);
		g_type_free_instance ((GTypeInstance *) self);
	}
}


