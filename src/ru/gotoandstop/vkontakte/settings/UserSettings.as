package ru.gotoandstop.vkontakte.settings{
	/**
	 * 
	 * @author Timashev Roman
	 * @version 1.1
	 */
	public class UserSettings{
		/**
		 * Доступ к уведомлениям.
		 */
		public static const NOTIFY:uint = 1;
		
		/**
		 * Доступ к друзьям.
		 */
		public static const FRIENDS:uint = 2;
		
		/**
		 * Доступ к фотографиям.
		 */
		public static const PHOTOS:uint = 4;
		
		/**
		 * Доступ к аудио.
		 */
		public static const AUDIO:uint = 8;
		
		/**
		 * Доступ к объявлениям.
		 */
		public static const OFFER:uint = 32;
		
		/**
		 * Доступ к вопросам.
		 */
		public static const QUESTIONS:uint = 64;
		
		/**
		 * Доступ к вики-страницам.
		 */
		public static const WIKI:uint = 128;
		
		/**
		 * Доступ к меню слева.
		 */
		public static const MENU:uint = 256;
		
		/**
		 * Доступ к стене.
		 */
		public static const WALL:uint = 512;
		
		/**
		 * Доступ к статусам.
		 */
		public static const ACTIVITY:uint = 1024;
		
		/**
		 * 
		 * @param settings
		 * @param mask
		 * @return
		 */
		public static function check(settings:uint, mask:uint):Boolean{
			const result:uint = settings & mask;
			return result == mask;
		}
	}
}