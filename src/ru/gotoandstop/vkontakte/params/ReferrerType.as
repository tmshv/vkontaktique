package ru.gotoandstop.vkontakte.params{
	public class ReferrerType{
		/**
		 * Приложение запущено в результате перехода через левое меню.
		 */
		public static const MENU:String = 'menu';
		
		/**
		 * Приложение запущено через меню публикации новой записи на стене.
		 */
		public static const WALL_POST_INLINE:String = 'wall_post_inline';
		
		/**
		 * Приложение запущено через меню публикации новой записи на стене и развернуто в новом окне. 
		 */
		public static const WALL_POST:String = 'wall_post';
		
		/**
		 * Приложение запущено со стены пользователя для просмотра ранее размещенной записи. 
		 */
		public static const WALL_VIEW_INLINE:String = 'wall_view_inline'; 
		
		/**
		 * Приложение запущено со стены пользователя для просмотра ранее размещенной записи и развернуто в новом окне. 
		 */
		public static const WALL_VIEW:String = 'wall_view';
	}
}