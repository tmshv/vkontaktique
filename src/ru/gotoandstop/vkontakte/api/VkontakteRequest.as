package ru.gotoandstop.vkontakte.api{
	import flash.errors.IllegalOperationError;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	
	import ru.gotoandstop.vkontakte.api.events.VkontakteEvent;
	
	[Event(name="requestComplete", type="ru.gotoandstop.vkontakte.api.events.VkontakteEvent")]
	[Event(name="requestError", type="ru.gotoandstop.vkontakte.api.events.VkontakteErrorEvent")]
	
	/**
	* lol with md5
	* Creation date: Apr 20, 2011 (9:54:44 PM)
	* @author Roman Timashev (roman@tmshv.ru)
	* @version 2
	* @playerversion 10
	*/
	public class VkontakteRequest extends URLLoader{
		api_internal static var queue:VkontakteQueue;
		
		public static var apiURL:String;
		public static var secret:String;
		public static var sid:String;
		public static var viewerID:uint;
		public static var apiID:uint;
		public static var callbackError:Function;
		private static var useTestMode:Boolean;
		private static var format:String;
		private static var version:String;
		private static var _useStaticTestMode:Boolean;
		
		public static function init(viewerID:uint,
			apiID:uint,
			secret:String,
			sid:String,
			format:String,
			version:String,
			useTestMode:Boolean,
			apiURL:String,
			callbackError:Function
		):void{
			VkontakteRequest.apiID = apiID;
			VkontakteRequest.apiURL = apiURL;
			VkontakteRequest.callbackError = callbackError;
			VkontakteRequest.secret = secret;
			VkontakteRequest.sid = sid;
			VkontakteRequest.useTestMode = useTestMode;
			VkontakteRequest.format = format;
			VkontakteRequest.version = version;
			VkontakteRequest.viewerID = viewerID;
			VkontakteRequest._useStaticTestMode = true;
		}
		
		private var _callbackError:Function;
		public function get callbackError():Function{
			return this._callbackError;
		}
		public function set callbackError(value:Function):void{
			this._callbackError = value;
		}
		
		private var _autoReload:Boolean;
		public function get autoReload():Boolean{
			return this._autoReload;
		}
		public function set autoReload(value:Boolean):void{
			this._autoReload = value;
		}
		
		private var _apiURL:String;
		public function get apiURL():String{
			return this._apiURL;
		}
		
		private var _viewerID:uint;
		public function get viewerID():uint{
			return this._viewerID;
		}
		
		private var _apiID:uint;
		public function get apiID():uint{
			return this._apiID;
		}
		
		private var _secret:String;
		public function get secret():String{
			return this._secret;
		}
		
		private var _sid:String;
		public function get sid():String{
			return this._sid;
		}
		
		private var _priority:uint;
		public function get prioriy():uint{
			return this._priority;
		}
		
		private var _method:String;
		public function get method():String{
			return this._method;
		}
		
		private var _version:String;
		public function get version():String{
			return this._version;
		}
		
		private var _httpFormat:String;
		public function get httpFormat():String{
			return this._httpFormat;
		}
		
		private var __request:URLRequest;
		
		public function VkontakteRequest(
			priority:uint=0,
			autoReload:Boolean=false,
			callbackError:Function=null,
			method:String='post'
		){
			super();
			
			//check queue
			if(!VkontakteRequest.api_internal::queue) VkontakteRequest.api_internal::queue = new VkontakteQueue();
			
			this.init(
				VkontakteRequest.viewerID,
				VkontakteRequest.apiID,
				VkontakteRequest.secret,
				VkontakteRequest.sid,
				VkontakteRequest.format,
				VkontakteRequest.version,
				VkontakteRequest.apiURL
			);
			
			this._priority = priority;
			this._autoReload = autoReload;
			this._method = method;
			this._callbackError = (callbackError == null) ? VkontakteRequest.callbackError : callbackError;
			
			super.dataFormat = URLLoaderDataFormat.TEXT;			
			super.addEventListener(Event.COMPLETE, this.handlerComplete);
		}
		
		public function init(
			viewerID:uint,
			apiID:uint,
			secret:String,
			sid:String,
			format:String,
			version:String,
			apiURL:String
		):void{
			this._viewerID = viewerID;
			this._apiID = apiID;
			this._secret = secret;
			this._sid = sid;
			this._httpFormat = format;
			this._version = version;
			this._apiURL = apiURL;
		}
		
		public override function load(request:URLRequest):void{
			throw new IllegalOperationError('');
		}
		
		internal function doLoad():void{
			super.load(this.__request);
		}
		
		public function reload():void{
			if(this.__request){
				try{
					super.close();
				}finally{
					this.send(this.__request);
				}
			}else throw new Error('');
		}
		
		private function send(request:URLRequest):void{
			this.__request = request;			
			VkontakteRequest.api_internal::queue.add(this);
		}
		
		public function request(method:String, params:Object=null, testMode:Boolean=false):void{
			var use_test_mode:Boolean = VkontakteRequest._useStaticTestMode ? VkontakteRequest.useTestMode : testMode;
			
			if(!params) params = new Object();
			params['api_id'] = this._apiID;
			params['method'] = method;
			params['v'] = this._version;
			params['format'] = this._httpFormat;
			if(use_test_mode) params['test_mode'] = 1;
			var sig:String = this.generateSignature(params);
			var request_data:URLVariables = new URLVariables();
			for(var p:String in params) request_data[p] = params[p];
			request_data.sig = sig;
			request_data.sid = this.sid;
			
			var request:URLRequest = new URLRequest(this._apiURL);
			request.method = this._method;
			request.data = request_data;
			this.send(request);
		}
		
		private function handlerComplete(event:Event):void{
			var response:XML = new XML(super.data);
			const name:String = response.name();
			switch(name){
				case 'response':{
					super.dispatchEvent(new VkontakteEvent(VkontakteEvent.REQUEST_COMPLETE, false, false, response));
					break;
				}
				case 'error':{
					super.dispatchEvent(new VkontakteEvent(VkontakteEvent.REQUEST_ERROR, false, false, response));
					if(this._autoReload) this.reload();					
					break;
				}
				default: break;
			}
		}
		
		private function generateSignature(parameters:Object):String{
			var list:Array = new Array();
			for(var param:String in parameters){
				list.push(param +'='+ parameters[param]);
			}
			list.sort();
			
			var hash_string:String = this._viewerID + list.join('') + this._secret;
			var md5:String = MD5_.hash(hash_string);
			
			return md5;
		}
	}
}

internal class MD5_{
	public static function hash(data: String): String {
		var x:Array;
		var k: Number, AA: Number,
		BB: Number,	CC: Number,
		DD: Number, a: Number, 
		b: Number, c: Number,d: Number;
		var S11: Number=7, S12: Number=12, S13: Number=17, S14: Number=22;
		var S21: Number=5, S22: Number=9 , S23: Number=14, S24: Number=20;
		var S31: Number=4, S32: Number=11, S33: Number=16, S34: Number=23;
		var S41: Number=6, S42: Number=10, S43: Number=15, S44: Number=21;
		
		data = Utf8Encode(data);
		
		x = ConvertToWordArray(data);
		
		a = 0x67452301; b = 0xEFCDAB89; c = 0x98BADCFE; d = 0x10325476;
		
		for (k=0;k<x.length;k+=16) {
			AA=a; BB=b; CC=c; DD=d;
			a=FF(a,b,c,d,x[k+0], S11,0xD76AA478);
			d=FF(d,a,b,c,x[k+1], S12,0xE8C7B756);
			c=FF(c,d,a,b,x[k+2], S13,0x242070DB);
			b=FF(b,c,d,a,x[k+3], S14,0xC1BDCEEE);
			a=FF(a,b,c,d,x[k+4], S11,0xF57C0FAF);
			d=FF(d,a,b,c,x[k+5], S12,0x4787C62A);
			c=FF(c,d,a,b,x[k+6], S13,0xA8304613);
			b=FF(b,c,d,a,x[k+7], S14,0xFD469501);
			a=FF(a,b,c,d,x[k+8], S11,0x698098D8);
			d=FF(d,a,b,c,x[k+9], S12,0x8B44F7AF);
			c=FF(c,d,a,b,x[k+10],S13,0xFFFF5BB1);
			b=FF(b,c,d,a,x[k+11],S14,0x895CD7BE);
			a=FF(a,b,c,d,x[k+12],S11,0x6B901122);
			d=FF(d,a,b,c,x[k+13],S12,0xFD987193);
			c=FF(c,d,a,b,x[k+14],S13,0xA679438E);
			b=FF(b,c,d,a,x[k+15],S14,0x49B40821);
			a=GG(a,b,c,d,x[k+1], S21,0xF61E2562);
			d=GG(d,a,b,c,x[k+6], S22,0xC040B340);
			c=GG(c,d,a,b,x[k+11],S23,0x265E5A51);
			b=GG(b,c,d,a,x[k+0], S24,0xE9B6C7AA);
			a=GG(a,b,c,d,x[k+5], S21,0xD62F105D);
			d=GG(d,a,b,c,x[k+10],S22,0x2441453);
			c=GG(c,d,a,b,x[k+15],S23,0xD8A1E681);
			b=GG(b,c,d,a,x[k+4], S24,0xE7D3FBC8);
			a=GG(a,b,c,d,x[k+9], S21,0x21E1CDE6);
			d=GG(d,a,b,c,x[k+14],S22,0xC33707D6);
			c=GG(c,d,a,b,x[k+3], S23,0xF4D50D87);
			b=GG(b,c,d,a,x[k+8], S24,0x455A14ED);
			a=GG(a,b,c,d,x[k+13],S21,0xA9E3E905);
			d=GG(d,a,b,c,x[k+2], S22,0xFCEFA3F8);
			c=GG(c,d,a,b,x[k+7], S23,0x676F02D9);
			b=GG(b,c,d,a,x[k+12],S24,0x8D2A4C8A);
			a=HH(a,b,c,d,x[k+5], S31,0xFFFA3942);
			d=HH(d,a,b,c,x[k+8], S32,0x8771F681);
			c=HH(c,d,a,b,x[k+11],S33,0x6D9D6122);
			b=HH(b,c,d,a,x[k+14],S34,0xFDE5380C);
			a=HH(a,b,c,d,x[k+1], S31,0xA4BEEA44);
			d=HH(d,a,b,c,x[k+4], S32,0x4BDECFA9);
			c=HH(c,d,a,b,x[k+7], S33,0xF6BB4B60);
			b=HH(b,c,d,a,x[k+10],S34,0xBEBFBC70);
			a=HH(a,b,c,d,x[k+13],S31,0x289B7EC6);
			d=HH(d,a,b,c,x[k+0], S32,0xEAA127FA);
			c=HH(c,d,a,b,x[k+3], S33,0xD4EF3085);
			b=HH(b,c,d,a,x[k+6], S34,0x4881D05);
			a=HH(a,b,c,d,x[k+9], S31,0xD9D4D039);
			d=HH(d,a,b,c,x[k+12],S32,0xE6DB99E5);
			c=HH(c,d,a,b,x[k+15],S33,0x1FA27CF8);
			b=HH(b,c,d,a,x[k+2], S34,0xC4AC5665);
			a=II(a,b,c,d,x[k+0], S41,0xF4292244);
			d=II(d,a,b,c,x[k+7], S42,0x432AFF97);
			c=II(c,d,a,b,x[k+14],S43,0xAB9423A7);
			b=II(b,c,d,a,x[k+5], S44,0xFC93A039);
			a=II(a,b,c,d,x[k+12],S41,0x655B59C3);
			d=II(d,a,b,c,x[k+3], S42,0x8F0CCC92);
			c=II(c,d,a,b,x[k+10],S43,0xFFEFF47D);
			b=II(b,c,d,a,x[k+1], S44,0x85845DD1);
			a=II(a,b,c,d,x[k+8], S41,0x6FA87E4F);
			d=II(d,a,b,c,x[k+15],S42,0xFE2CE6E0);
			c=II(c,d,a,b,x[k+6], S43,0xA3014314);
			b=II(b,c,d,a,x[k+13],S44,0x4E0811A1);
			a=II(a,b,c,d,x[k+4], S41,0xF7537E82);
			d=II(d,a,b,c,x[k+11],S42,0xBD3AF235);
			c=II(c,d,a,b,x[k+2], S43,0x2AD7D2BB);
			b=II(b,c,d,a,x[k+9], S44,0xEB86D391);
			a=AddUnsigned(a,AA);
			b=AddUnsigned(b,BB);
			c=AddUnsigned(c,CC);
			d=AddUnsigned(d,DD);
		}
		
		var temp:String = WordToHex(a)+WordToHex(b)+WordToHex(c)+WordToHex(d);
		
		return temp.toLowerCase();
	}
	
	private static function RotateLeft(lValue: int, iShiftBits: int):Number {
		return (lValue<<iShiftBits) | (lValue>>>(32-iShiftBits));
	}
	
	private static function AddUnsigned(lX: int,lY: int):Number {
		var lX4: int,lY4: int,lX8: int,lY8: int,lResult: int;
		lX8 = (lX & 0x80000000);
		lY8 = (lY & 0x80000000);
		lX4 = (lX & 0x40000000);
		lY4 = (lY & 0x40000000);
		lResult = (lX & 0x3FFFFFFF)+(lY & 0x3FFFFFFF);
		if (lX4 & lY4) {
			return (lResult ^ 0x80000000 ^ lX8 ^ lY8);
		}
		if (lX4 | lY4) {
			if (lResult & 0x40000000) {
				return (lResult ^ 0xC0000000 ^ lX8 ^ lY8);
			} else {
				return (lResult ^ 0x40000000 ^ lX8 ^ lY8);
			}
		} else {
			return (lResult ^ lX8 ^ lY8);
		}
	}
	
	private static function F(x: int, y: int, z: int): int { return (x & y) | ((~x) & z); }
	private static function G(x: int, y: int, z: int): int { return (x & z) | (y & (~z)); }
	private static function H(x: int, y: int, z: int): int { return (x ^ y ^ z); }
	private static function I(x: int, y: int, z: int): int { return (y ^ (x | (~z))); }
	
	private static function FF(a:int,b:int,c:int,d:int,x:int,s:int,ac:int): int {
		a = AddUnsigned(a, AddUnsigned(AddUnsigned(F(b, c, d), x), ac));
		return AddUnsigned(RotateLeft(a, s), b);
	}
	
	private static function GG(a:int,b:int,c:int,d:int,x:int,s:int,ac:int): int {
		a = AddUnsigned(a, AddUnsigned(AddUnsigned(G(b, c, d), x), ac));
		return AddUnsigned(RotateLeft(a, s), b);
	}
	
	private static function HH(a:int,b:int,c:int,d:int,x:int,s:int,ac:int): int {
		a = AddUnsigned(a, AddUnsigned(AddUnsigned(H(b, c, d), x), ac));
		return AddUnsigned(RotateLeft(a, s), b);
	}
	
	private static function II(a:int,b:int,c:int,d:int,x:int,s:int,ac:int):Number {
		a = AddUnsigned(a, AddUnsigned(AddUnsigned(I(b, c, d), x), ac));
		return AddUnsigned(RotateLeft(a, s), b);
	}
	
	private static function ConvertToWordArray(string:String):Array {
		var lWordCount: Number;
		var lMessageLength: Number = string.length;
		var lNumberOfWords_temp1: Number=lMessageLength + 8;
		var lNumberOfWords_temp2: Number=(lNumberOfWords_temp1-(lNumberOfWords_temp1 % 64))/64;
		var lNumberOfWords: Number = (lNumberOfWords_temp2+1)*16;
		var lWordArray:Array = new Array(lNumberOfWords-1);
		var lBytePosition: Number = 0;
		var lByteCount: Number = 0;
		while ( lByteCount < lMessageLength ) {
			lWordCount = (lByteCount-(lByteCount % 4))/4;
			lBytePosition = (lByteCount % 4)*8;
			lWordArray[lWordCount] = (lWordArray[lWordCount] | (string.charCodeAt(lByteCount)<<lBytePosition));
			lByteCount++;
		}
		lWordCount = (lByteCount-(lByteCount % 4))/4;
		lBytePosition = (lByteCount % 4)*8;
		lWordArray[lWordCount] = lWordArray[lWordCount] | (0x80<<lBytePosition);
		lWordArray[lNumberOfWords-2] = lMessageLength<<3;
		lWordArray[lNumberOfWords-1] = lMessageLength>>>29;
		return lWordArray;
	}
	
	private static function WordToHex(lValue:Number):String {
		var WordToHexValue:String="",WordToHexValue_temp:String="",lByte:Number,lCount:Number;
		for (lCount = 0;lCount<=3;lCount++) {
			lByte = (lValue>>>(lCount*8)) & 255;
			WordToHexValue_temp = "0" + lByte.toString(16);
			WordToHexValue = WordToHexValue + WordToHexValue_temp.substr(WordToHexValue_temp.length-2,2);
		}
		return WordToHexValue;
	}
	
	private static function Utf8Encode(string: String): String {
		
		var utftext:String = "";
		
		for (var n:Number = 0; n < string.length; n++) {
			
			var c:Number = string.charCodeAt(n);
			
			if (c < 128) {
				utftext += String.fromCharCode(c);
			}
			else if((c > 127) && (c < 2048)) {
				utftext += String.fromCharCode((c >> 6) | 192);
				utftext += String.fromCharCode((c & 63) | 128);
			}
			else {
				utftext += String.fromCharCode((c >> 12) | 224);
				utftext += String.fromCharCode(((c >> 6) & 63) | 128);
				utftext += String.fromCharCode((c & 63) | 128);
			}
			
		}
		
		return utftext;
	}
}