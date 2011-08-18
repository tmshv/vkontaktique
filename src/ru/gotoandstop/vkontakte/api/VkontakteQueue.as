package ru.gotoandstop.vkontakte.api{	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.utils.setTimeout;
	
	/**
	 * ...
	 * @author Timashev Roman
	 */
	internal class VkontakteQueue extends EventDispatcher{
		private var __queue:Array;
		private var __worked:Boolean;
		
		public function VkontakteQueue(){
			this.__queue = new Array();
		}
		
		private function handlerRequestComplete(event:Event):void{
			var request:VkontakteRequest = this.__queue.shift() as VkontakteRequest;
			request.removeEventListener(Event.COMPLETE, this.handlerRequestComplete);
			this.__worked = false;
			setTimeout(this.sendRequest, 400);
		}
		
		internal function add(request:VkontakteRequest):void{
			this.__queue.push(request);
			this.sendRequest();
		}
		
		internal function sendRequest():void{
			if(this.__worked) return;
			const request:VkontakteRequest = this.__queue[0] as VkontakteRequest;
			if(!request) return;
			this.__worked = true;
			
			request.addEventListener(Event.COMPLETE, this.handlerRequestComplete);
			request.doLoad();
		}
	}
}