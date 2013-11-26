/* vector.c generated by valac 0.18.1, the Vala compiler
 * generated from vector.vala, do not modify */


#include <glib.h>
#include <glib-object.h>
#include <float.h>
#include <math.h>
#include <string.h>
#include <stdlib.h>

#define LDRAW_MATHS_TYPE_VECTOR (ldraw_maths_vector_get_type ())
typedef struct _LdrawMathsVector LdrawMathsVector;
#define _g_free0(var) (var = (g_free (var), NULL))
#define _ldraw_maths_vector_free0(var) ((var == NULL) ? NULL : (var = (ldraw_maths_vector_free (var), NULL)))

typedef float v4sf __attribute__ ((vector_size(16), aligned(16)));

struct _LdrawMathsVector {
	v4sf values;
} __attribute__((aligned(16)));


extern LdrawMathsVector* ldraw_maths_vector_s_NullVector;
LdrawMathsVector* ldraw_maths_vector_s_NullVector = NULL;

GType ldraw_maths_vector_get_type (void) G_GNUC_CONST;
LdrawMathsVector* ldraw_maths_vector_dup (const LdrawMathsVector* self);
void ldraw_maths_vector_free (LdrawMathsVector* self);
void ldraw_maths_vector_init (LdrawMathsVector *self, gfloat x, gfloat y, gfloat z);
void ldraw_maths_vector_init_Min (LdrawMathsVector *self, LdrawMathsVector* a, LdrawMathsVector* b);
gfloat ldraw_maths_vector_get_X (LdrawMathsVector* self);
gfloat ldraw_maths_vector_get_Y (LdrawMathsVector* self);
gfloat ldraw_maths_vector_get_Z (LdrawMathsVector* self);
void ldraw_maths_vector_init_Max (LdrawMathsVector *self, LdrawMathsVector* a, LdrawMathsVector* b);
void ldraw_maths_vector_Add (LdrawMathsVector *self, LdrawMathsVector* v, LdrawMathsVector* result);
void ldraw_maths_vector_Subtract (LdrawMathsVector *self, LdrawMathsVector* v, LdrawMathsVector* result);
void ldraw_maths_vector_Cross (LdrawMathsVector *self, LdrawMathsVector* v, LdrawMathsVector* result);
gfloat ldraw_maths_vector_Dot (LdrawMathsVector *self, LdrawMathsVector* v);
void ldraw_maths_vector_Normalized (LdrawMathsVector *self, LdrawMathsVector* result);
void ldraw_maths_vector_Scale (LdrawMathsVector *self, gfloat scale, LdrawMathsVector* result);
gfloat ldraw_maths_vector_get_Magnitude (LdrawMathsVector* self);
gchar* ldraw_maths_vector_to_string (LdrawMathsVector *self);
void ldraw_maths_vector_get_NullVector (LdrawMathsVector* result);
gfloat *ldraw_maths_vector_value_vector(LdrawMathsVector* self);


void ldraw_maths_vector_init (LdrawMathsVector *self, gfloat x, gfloat y, gfloat z) {
	v4sf temp = {x, y, z, 0.0f};
	self->values = temp;
}


void ldraw_maths_vector_init_Min (LdrawMathsVector *self, LdrawMathsVector* a, LdrawMathsVector* b) {
	self->values = __builtin_ia32_minps(a->values, b->values);
}


void ldraw_maths_vector_init_Max (LdrawMathsVector *self, LdrawMathsVector* a, LdrawMathsVector* b) {
	self->values = __builtin_ia32_maxps(a->values, b->values);
}


void ldraw_maths_vector_Add (LdrawMathsVector *self, LdrawMathsVector* v, LdrawMathsVector* result) {
	v4sf self_vals = self->values;
	v4sf v_vals = v->values;
	result->values = __builtin_ia32_addps(self_vals, v_vals);
	return;
}


void ldraw_maths_vector_Subtract (LdrawMathsVector *self, LdrawMathsVector* v, LdrawMathsVector* result) {
	result->values = __builtin_ia32_subps(self->values, v->values);
	return;
}


void ldraw_maths_vector_Cross (LdrawMathsVector *self, LdrawMathsVector* v, LdrawMathsVector* result) {
	gfloat _tmp0_;
	LdrawMathsVector _tmp1_;
	gfloat _tmp2_;
	gfloat _tmp3_;
	LdrawMathsVector _tmp4_;
	gfloat _tmp5_;
	gfloat _tmp6_;
	LdrawMathsVector _tmp7_;
	gfloat _tmp8_;
	gfloat _tmp9_;
	LdrawMathsVector _tmp10_;
	gfloat _tmp11_;
	gfloat _tmp12_;
	LdrawMathsVector _tmp13_;
	gfloat _tmp14_;
	gfloat _tmp15_;
	LdrawMathsVector _tmp16_;
	gfloat _tmp17_;
	LdrawMathsVector _tmp18_ = {0};
	g_return_if_fail (v != NULL);
	_tmp0_ = (*self).values[1];
	_tmp1_ = *v;
	_tmp2_ = _tmp1_.values[2];
	_tmp3_ = (*self).values[2];
	_tmp4_ = *v;
	_tmp5_ = _tmp4_.values[1];
	_tmp6_ = (*self).values[2];
	_tmp7_ = *v;
	_tmp8_ = _tmp7_.values[0];
	_tmp9_ = (*self).values[0];
	_tmp10_ = *v;
	_tmp11_ = _tmp10_.values[2];
	_tmp12_ = (*self).values[0];
	_tmp13_ = *v;
	_tmp14_ = _tmp13_.values[1];
	_tmp15_ = (*self).values[1];
	_tmp16_ = *v;
	_tmp17_ = _tmp16_.values[0];
	ldraw_maths_vector_init (&_tmp18_, (_tmp0_ * _tmp2_) - (_tmp3_ * _tmp5_), (_tmp6_ * _tmp8_) - (_tmp9_ * _tmp11_), (_tmp12_ * _tmp14_) - (_tmp15_ * _tmp17_));
	*result = _tmp18_;
	return;
}


gfloat ldraw_maths_vector_Dot (LdrawMathsVector *self, LdrawMathsVector* v) {
	v4sf parts = __builtin_ia32_mulps(self->values, v->values);
	return parts[0] + parts[1] + parts[2];
}


void ldraw_maths_vector_Normalized (LdrawMathsVector *self, LdrawMathsVector* result) {
	gfloat _tmp0_;
	gfloat _tmp1_;
	LdrawMathsVector _tmp2_ = {0};
	_tmp0_ = ldraw_maths_vector_get_Magnitude (&(*self));
	_tmp1_ = _tmp0_;
	ldraw_maths_vector_Scale (&(*self), 1.0f / _tmp1_, &_tmp2_);
	*result = _tmp2_;
	return;
}


void ldraw_maths_vector_Scale (LdrawMathsVector *self, gfloat scale, LdrawMathsVector* result) {
	v4sf scale_vector = {scale, scale, scale, scale};
	result->values = __builtin_ia32_mulps(self->values, scale_vector);
	return;
}


gchar* ldraw_maths_vector_to_string (LdrawMathsVector *self) {
	gchar* result = NULL;
	gfloat _tmp0_;
	gchar* _tmp1_ = NULL;
	gchar* _tmp2_;
	gfloat _tmp3_;
	gchar* _tmp4_ = NULL;
	gchar* _tmp5_;
	gfloat _tmp6_;
	gchar* _tmp7_ = NULL;
	gchar* _tmp8_;
	gchar* _tmp9_ = NULL;
	gchar* _tmp10_;
	_tmp0_ = (*self).values[0];
	_tmp1_ = g_strdup_printf ("%g", _tmp0_);
	_tmp2_ = _tmp1_;
	_tmp3_ = (*self).values[1];
	_tmp4_ = g_strdup_printf ("%g", _tmp3_);
	_tmp5_ = _tmp4_;
	_tmp6_ = (*self).values[2];
	_tmp7_ = g_strdup_printf ("%g", _tmp6_);
	_tmp8_ = _tmp7_;
	_tmp9_ = g_strconcat ("( ", _tmp2_, ", ", _tmp5_, ", ", _tmp8_, " )", NULL);
	_tmp10_ = _tmp9_;
	_g_free0 (_tmp8_);
	_g_free0 (_tmp5_);
	_g_free0 (_tmp2_);
	result = _tmp10_;
	return result;
}


static gpointer _ldraw_maths_vector_dup0 (gpointer self) {
	return self ? ldraw_maths_vector_dup (self) : NULL;
}


void ldraw_maths_vector_get_NullVector (LdrawMathsVector* result) {
	LdrawMathsVector* _tmp0_;
	LdrawMathsVector* _tmp3_;
	if (ldraw_maths_vector_s_NullVector == NULL) {
		LdrawMathsVector _tmp1_ = {0};
		LdrawMathsVector* _tmp2_;
		ldraw_maths_vector_init (&_tmp1_, (gfloat) 0, (gfloat) 0, (gfloat) 0);
		_tmp2_ = _ldraw_maths_vector_dup0 (&_tmp1_);
		_ldraw_maths_vector_free0 (ldraw_maths_vector_s_NullVector);
		ldraw_maths_vector_s_NullVector = _tmp2_;
	}
	*result = *ldraw_maths_vector_s_NullVector;
	return;
}


gfloat ldraw_maths_vector_get_X (LdrawMathsVector* self) {
	g_return_val_if_fail (self != NULL, 0.0F);
	return self->values[0];
}


gfloat ldraw_maths_vector_get_Y (LdrawMathsVector* self) {
	g_return_val_if_fail (self != NULL, 0.0F);
	return self->values[1];
}


gfloat ldraw_maths_vector_get_Z (LdrawMathsVector* self) {
	g_return_val_if_fail (self != NULL, 0.0F);
	return self->values[2];
}


gfloat ldraw_maths_vector_get_Magnitude (LdrawMathsVector* self) {
	gfloat result;
	gfloat _tmp0_ = 0.0F;
	gfloat _tmp1_ = 0.0F;
	g_return_val_if_fail (self != NULL, 0.0F);
	_tmp0_ = ldraw_maths_vector_Dot (&(*self), &(*self));
	_tmp1_ = sqrtf (_tmp0_);
	result = _tmp1_;
	return result;
}


LdrawMathsVector* ldraw_maths_vector_dup (const LdrawMathsVector* self) {
	LdrawMathsVector* dup;
	dup = g_new0 (LdrawMathsVector, 1);
	memcpy (dup, self, sizeof (LdrawMathsVector));
	return dup;
}


void ldraw_maths_vector_free (LdrawMathsVector* self) {
	g_free (self);
}


GType ldraw_maths_vector_get_type (void) {
	static volatile gsize ldraw_maths_vector_type_id__volatile = 0;
	if (g_once_init_enter (&ldraw_maths_vector_type_id__volatile)) {
		GType ldraw_maths_vector_type_id;
		ldraw_maths_vector_type_id = g_boxed_type_register_static ("LdrawMathsVector", (GBoxedCopyFunc) ldraw_maths_vector_dup, (GBoxedFreeFunc) ldraw_maths_vector_free);
		g_once_init_leave (&ldraw_maths_vector_type_id__volatile, ldraw_maths_vector_type_id);
	}
	return ldraw_maths_vector_type_id__volatile;
}

gfloat *ldraw_maths_vector_value_vector(LdrawMathsVector* self)
{
	return &(self->values);
}

