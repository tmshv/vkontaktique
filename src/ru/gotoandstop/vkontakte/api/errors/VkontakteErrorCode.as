package ru.gotoandstop.vkontakte.api.errors{
	
	/*
	*
	* author Timashev Roman
	* version 0.10
	*/
	public class VkontakteErrorCode{
		/**
		 * Unknown error occured.
		 */
		public static const UNKNOWN_ERROR:uint = 1;
		
		/**
		 * Application is disabled. Enable your application or use test mode.
		 */
		public static const APPLICATION_DISABLED:uint = 2;
		
		/**
		 * Unknown method passed.
		 */
		public static const UNKNOWN_METHOD:uint = 3;
		
		/**
		 * Incorrect signature. 
		 */
		public static const INCORRECT_SIGNATURE:uint = 4;
		
		/**
		 * User authorization failed.
		 */
		public static const USER_AUTH_FAILED:uint = 5;
		
		/**
		 * Too many requests per second.
		 */
		public static const TOO_MANY_REQUESTS_PER_SECOND:uint = 6;
		
		/**
		 * Permission to perform this action is denied by user.
		 */
		public static const PERMISSION_DENIED_BY_USER:uint = 7;
		
		/**
		 * Compilation error.
		 */
		public static const COMPILATION_ERROR:uint = 12;
		
		/**
		 * Runtime error.
		 */
		public static const RUNTIME_ERROR:uint = 13;
		
		/**
		 * One of the parameters specified was missing or invalid.
		 */
		public static const INVALID_PARAMETERS:uint = 100;
		
		/**
		 * Invalid user ids.
		 */
		public static const INVALID_IDS:uint = 113;
		
		/**
		 * Permission denied. You must enable votes processing in application settings.
		 */
		public static const PERMISSION_DENIED:uint = 500;
	}
}