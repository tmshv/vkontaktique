package ru.gotoandstop.vkontakte.api.events{
	import flash.events.Event;
	
	/**
	 * 
	 * @author Roman Timashev (roman@tmshv.ru)
	 * 
	 */
	public class VkontakteEvent extends Event{
		public static const REQUEST_COMPLETE:String = 'requestComplete';
		public static const REQUEST_ERROR:String = 'requestError';
		
		private var _response:XML;
		public function get response():XML{
			return this._response;
		}
		
		public function VkontakteEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false, response:XML=null){
			super(type, bubbles, cancelable);
			this._response = response;
		}
		
		public override function clone():Event{
			return new VkontakteEvent(super.type, super.bubbles, super.cancelable, this._response);
		}
		
		public override function toString():String{
			return super.formatToString('VkontakteEvent', 'type', 'bubbles', 'cancelable', 'response');
		}
	}
}