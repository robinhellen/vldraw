namespace Ldraw.Utils
{
	public abstract class Generator<G>
	{
		private bool consumed;
		private G value;
		private SourceFunc callback;

		protected async void helper ()
		{
			yield generate ();
			consumed = true;
		}

		protected abstract async void generate ();

		protected async void feed (G value)
		{
			this.value = value;
			this.callback = feed.callback;
			yield;
		}

		public bool next ()
		{
			return !consumed;
		}

		public G get ()
		{
			var result = value;
			callback ();
			return result;
		}

		public Generator<G> iterator ()
		{
			return this;
		}
	}
}
