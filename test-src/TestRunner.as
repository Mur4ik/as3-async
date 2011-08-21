package {
	import org.osflash.async.TestWhen;
	import org.flexunit.internals.TraceListener;
	import org.flexunit.listeners.CIListener;
	import org.flexunit.runner.FlexUnitCore;

	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	
	public class TestRunner extends Sprite 
	{
		public static var STAGE : Stage;
		
		private var core : FlexUnitCore;

		public function TestRunner() 
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}

		private function onAddedToStage(event : Event) : void
		{
			STAGE = stage;

			core = new FlexUnitCore();
			core.addListener(new TraceListener());
			core.addListener(new CIListener());
			
			core.run([
				TestWhen
			]);			
		}
	}
}
