package ru.gotoandstop.vkontakte.params{
	public class ViewerType{
		/**
		 * Пользователь является администратором группы.
		 */
		public static const ADMIN:uint = 3;
		
		/**
		 * Пользователь является руководителем группы.
		 */
		public static const MODERATOR:uint = 2;
		
		/**
		 * Пользователь является участником группы. 
		 */
		public static const USER:uint = 1;
		
		/**
		 * Пользователь является владельцем страницы.
		 */
		public static const OWNER:uint = 2;
		
		/**
		 * Пользователь является другом владельца страницы.
		 */
		public static const FRIEND:uint = 1;
				
		/**
		 * Пользователь не состоит в группе.
		 * Пользователь не состоит в друзьях владельца страницы.
		 */
		public static const NONE:uint = 0;
	}
}