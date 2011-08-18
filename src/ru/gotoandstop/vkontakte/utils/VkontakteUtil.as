package ru.gotoandstop.vkontakte.utils{
	public class VkontakteUtil{
		/**
		 * 
		 * @param balance
		 * @return 
		 * 
		 */
		public static function convertBalanceToInteger(balance:uint):uint{
			return balance / 100;
		}
		
		//some shit
		public static function getUIDs(list:XMLList, start:uint=0, length:uint=0):Array{
			const result:Array = new Array();
			const list_length:uint = list.length();
			length = length>list_length ? list_length : length;
			length = length ? length : list_length;
			for(var i:uint=start; i<length; i++){
				var uid:XML = list[i] as XML;
				result.push(Number(uid.toString()));
			}
			return result;
		}
	}
}