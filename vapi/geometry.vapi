/* geometry.vapi generated by valac-0.18 0.18.1, do not modify. */

using GLib;
using GLib.Math;

namespace Ldraw {
	namespace Maths {
		public class Bounds {
			public Vector m_Min;
			public Vector m_Max;
			public bool m_Initialized;
			public Bounds ();
			public Bounds.Clone (Bounds b);
			public void Union (Vector v);
			public void IncludeBounds (Bounds b, Matrix transform, Vector center);
			public Vector Center ();
			public Bounds Scale (float scale);
			public Bounds Transform (Matrix m, Vector pos);
			public string to_string ();
			public float MaxX { get; }
			public float MaxY { get; }
			public float MaxZ { get; }
			public float MinX { get; }
			public float MinY { get; }
			public float MinZ { get; }
			public float Radius { get; }
		}
		public struct Matrix {
			public float[,] m_Values;
			public static Matrix? s_NullMatrix;
			public static Matrix? s_Identity;
			public Matrix (float a, float b, float c, float d, float e, float f, float g, float h, float i);
			public Matrix.ForRotation (Vector axis, float angle);
			public Matrix TransformMatrix (Matrix m);
			public Matrix Add (Matrix m);
			public Matrix Scale (float scale);
			public Vector TransformVector (Vector v);
			public float @get (int row, int col);
			public string to_string ();
			public static Matrix NullMatrix { get; }
			public static Matrix Identity { get; }
			public float Determinant { get; }
		}
		public struct Vector {
			public float m_Values[3];
			public static Vector? s_NullVector;
			public Vector (float x, float y, float z);
			public Vector.Min (Vector a, Vector b);
			public Vector.Max (Vector a, Vector b);
			public Vector Add (Vector v);
			public Vector Subtract (Vector v);
			public Vector Cross (Vector v);
			public float Dot (Vector v);
			public Vector Normalized ();
			public Vector Scale (float scale);
			public string to_string ();
			public static Vector NullVector { get; }
			public float X { get; }
			public float Y { get; }
			public float Z { get; }
			public float Magnitude { get; }
		}
	}
}
