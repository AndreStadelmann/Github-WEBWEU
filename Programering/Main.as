package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TextEvent;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author EpicToaster
	 */
	public class Main extends Sprite 
	{
		private var hHP:int = 100;
		private var hSTR:int = 50; 
		private var hDEF:int = 5;
		private var hDMG:int;
		
		private var dHP:int = 100;
		private var dSTR:int = 50; 
		private var dDEF:int = 5;
		private var dDMG:int;
		private var t:TextField = new TextField;
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			t.width = 420;
			t.height = 0;
			t.border = true;
			t.borderColor = 0x000000;
			
			for (var i:int = 0; i < 8; i++) 
			{
				if (dHP > 0 && hHP > 0) 
				{
					t.height = t.height + 80;
					hDMG = hSTR * Math.random() - dDEF;
					dDMG = dSTR * Math.random() - hDEF;
					if (dDMG < 0) 
					{
						dDMG = 0;
					}
					if (hDMG < 0)
					{
						hDMG = 0;
					}
					dHP = dHP - hDMG;
					hHP = hHP - dDMG;
					if (dHP < 0) 
					{
						dHP = 0;
					}
					if (hHP < 0) 
					{
						hHP = 0;
					}
					t.appendText("Round " + String(i+1) +":"+ "\n" + "Hero strikes the dragon with a toothpick dealing " + String(hDMG) +" DMG and brings Dragon to "+ String(dHP) + " HP" + "\n" + "Dragon spit a fireball dealing " + String(dDMG) + " DMG and brings Hero to " + String(hHP) + " HP" + "\n" + "\n" + "\n");	
				}
			}
			
			if (hHP == 0 && dHP > 0) 
			{
				t.appendText("Hero fainted, Dragon won the battle!")
			}
			
			if (dHP == 0 && hHP > 0) 
			{
				t.appendText("Dragon Fainted, Hero won the battle!")
			}
			
			if (dHP == 0 && hHP == 0) 
			{
				t.appendText("Both fainted... Well.. Fuck...")
			}
			
			addChild(t)
		}
	}
}