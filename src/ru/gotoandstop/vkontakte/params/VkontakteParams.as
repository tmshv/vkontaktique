package ru.gotoandstop.vkontakte.params{
	/**
	 * Класс для работы с переданными при закрузке параметрами.
	 * Есть статичная и нестатичная версия
	 * Недокументированные параметры:
	 * 	string domain - домен
	 * 	int scale - масштаб
	 * 	string width - ширина окна
	 * 	string height - высота окна
	 * 	string swf_url - адрес файла для враппера
	 * 	boolean debug - 
	 * 	int stageScale  - (1)
	 * @author Timashev Roman
	 */
	public class VkontakteParams{
		private static var _apiURL:String;
		/**
		 * Адрес сервиса API, по которому необходимо осуществлять запросы.
		 * @return 
		 */
		public static function get apiURL():String{
			return VkontakteParams._apiURL;
		}
		
		private static var _apiID:uint;
		/**
		 * id запущенного приложения. 
		 * @return 
		 */
		public static function get apiID():uint{
			return VkontakteParams._apiID;
		}
		
		private static var _userID:uint;
		/**
		 * id пользователя, со страницы которого было запущено приложение. Если приложение запущено не со страницы пользователя, то значение равно 0.
		 * @return 
		 */
		public static function get userID():uint{
			return VkontakteParams._userID;
		}
		
		private static var _groupID:uint;
		/**
		 * id группы, со страницы которой было запущено приложение. Если приложение запущено не со страницы группы, то значение равно 0.
		 * @return 
		 */
		public static function get groupID():uint{
			return VkontakteParams._groupID;
		}
		
		private static var _viewerID:uint;
		/**
		 * id пользователя, который просматривает приложение. 
		 * @return 
		 */
		public static function get viewerID():uint{
			return VkontakteParams._viewerID;
		}
		
		private static var _isAppUser:Boolean;
		/**
		 * Установил ли пользователь приложение к себе на страницу.
		 * @return 
		 */
		public static function isAppUser():Boolean{
			return VkontakteParams._isAppUser;
		}
		
		private static var _viewerType:uint;
		/**
		 * Тип пользователя, который просматривает приложение. 
		 * @return 
		 */
		public static function viewerType():uint{
			return VkontakteParams._viewerType;
		}
		
		private static var _authKey:String;
		/**
		 * Ключ, необходимый для авторизации пользователя на стороннем сервере. 
		 * @return 
		 */
		public static function get authKey():String{
			return VkontakteParams._authKey;
		}
		
		private static var _language:uint;
		/**
		 * id языка пользователя, просматривающего приложение. 
		 * @return 
		 */
		public static function get language():uint{
			return VkontakteParams._language;
		}
		
		private static var _apiResult:String;
		/**
		 * Результат первого API-запроса, который выполняется при загрузке приложения. 
		 * @return 
		 */
		public static function get apiResult():String{
			return VkontakteParams._apiResult;
		}
		
		private static var _apiSettings:uint;
		/**
		 * Битовая маска настроек текущего пользователя в данном приложении. 
		 * @return 
		 */
		public static function apiSettings():uint{
			return VkontakteParams._apiSettings;
		}
		
		private static var _referrer:String;
		/**
		 * Содержит строку с информацией о том, откуда было запущено приложение.
		 * @return 
		 */
		public static function get referrer():String{
			return VkontakteParams._referrer;
		}
		
		private static var _posterID:uint;
		/**
		 * id пользователя, разместившего запись на стене.
		 * @return 
		 */
		public static function get posterID():uint{
			return VkontakteParams._posterID;
		}
		
		private static var _postID:String;
		/**
		 * id сохраненной на стене записи. 
		 * @return 
		 */
		public static function get postID():String{
			return VkontakteParams._postID;
		}
		
		public static function parse(parameters:Object):void{
			if(!parameters) throw new ArgumentError('Error #1507: Argument parameters cannot be null.', 1507);
			VkontakteParams._apiURL = parameters.api_url;
			VkontakteParams._apiID = parseInt(parameters.api_id, 10);
			VkontakteParams._userID = parseInt(parameters.user_id, 10);
			VkontakteParams._groupID = parseInt(parameters.group_id, 10);
			VkontakteParams._viewerID = parseInt(parameters.viewer_id, 10);
			VkontakteParams._isAppUser = Boolean(parseInt(parameters.is_app_user, 10));
			VkontakteParams._viewerType = parseInt(parameters.viewer_type, 10);
			VkontakteParams._authKey = parameters.auth_key;
			VkontakteParams._language = parseInt(parameters.language, 10);
			VkontakteParams._apiResult = parameters.api_result;
			VkontakteParams._apiSettings = parseInt(parameters.api_settings, 10);
			VkontakteParams._referrer = parameters.referrer;
			var is_wall_view:Boolean = VkontakteParams._referrer==ReferrerType.WALL_VIEW || VkontakteParams._referrer==ReferrerType.WALL_VIEW_INLINE;
			VkontakteParams._posterID = is_wall_view ? parameters.poster_id : 0;
			VkontakteParams._postID = is_wall_view ? parameters.post_id : '';
		}
		
		public function VkontakteParams(parameters:Object){
			try{
				this.parse(parameters);
			}catch(error:Error){
				throw error;
			}
		}
		
		public function parse(parameters:Object):void{
			if(!parameters) throw new ArgumentError('Error #1507: Argument parameters cannot be null.', 1507);
			this._apiURL = parameters.api_url;
			this._apiID = parseInt(parameters.api_id, 10);
			this._userID = parseInt(parameters.user_id, 10);
			this._groupID = parseInt(parameters.group_id, 10);
			this._viewerID = parseInt(parameters.viewer_id, 10);
			this._isAppUser = Boolean(parseInt(parameters.is_app_user, 10));
			this._viewerType = parseInt(parameters.viewer_type, 10);
			this._authKey = parameters.auth_key;
			this._language = parseInt(parameters.language, 10);
			this._apiResult = parameters.api_result;
			this._apiSettings = parseInt(parameters.api_settings, 10);
			this._referrer = parameters.referrer;
			var is_wall_view:Boolean = this._referrer==ReferrerType.WALL_VIEW || this._referrer==ReferrerType.WALL_VIEW_INLINE;
			this._posterID = is_wall_view ? parameters.poster_id : 0;
			this._postID = is_wall_view ? parameters.post_id : '';
		}
		
		private var _params:Object;
		/**
		 * Необработанный объект params
		 * @return 
		 */
		public function get params():Object{
			return this._params;
		}
		
		private var _apiURL:String;
		/**
		 * Адрес сервиса API, по которому необходимо осуществлять запросы.
		 * @return 
		 */
		public function get apiURL():String{
			return this._apiURL;
		}
		
		private var _apiID:uint;
		/**
		 * id запущенного приложения. 
		 * @return 
		 */
		public function get apiID():uint{
			return this._apiID;
		}
		
		private var _userID:uint;
		/**
		 * id пользователя, со страницы которого было запущено приложение. Если приложение запущено не со страницы пользователя, то значение равно 0.
		 * @return 
		 */
		public function get userID():uint{
			return this._userID;
		}
		
		private var _groupID:uint;
		/**
		 * id группы, со страницы которой было запущено приложение. Если приложение запущено не со страницы группы, то значение равно 0.
		 * @return 
		 */
		public function get groupID():uint{
			return this._groupID;
		}
		
		private var _viewerID:uint;
		/**
		 * id пользователя, который просматривает приложение. 
		 * @return 
		 */
		public function get viewerID():uint{
			return this._viewerID;
		}
		
		private var _isAppUser:Boolean;
		/**
		 * Установил ли пользователь приложение к себе на страницу.
		 * @return 
		 */
		public function isAppUser():Boolean{
			return this._isAppUser;
		}
		
		private var _viewerType:uint;
		/**
		 * Тип пользователя, который просматривает приложение. 
		 * @return 
		 */
		public function viewerType():uint{
			return this._viewerType;
		}
		
		private var _authKey:String;
		/**
		 * Ключ, необходимый для авторизации пользователя на стороннем сервере. 
		 * @return 
		 */
		public function get authKey():String{
			return this._authKey;
		}
		
		private var _language:uint;
		/**
		 * id языка пользователя, просматривающего приложение. 
		 * @return 
		 */
		public function get language():uint{
			return this._language;
		}
		
		private var _apiResult:String;
		/**
		 * Результат первого API-запроса, который выполняется при загрузке приложения. 
		 * @return 
		 */
		public function get apiResult():String{
			return this._apiResult;
		}
		
		private var _apiSettings:uint;
		/**
		 * Битовая маска настроек текущего пользователя в данном приложении. 
		 * @return 
		 */
		public function apiSettings():uint{
			return this._apiSettings;
		}
		
		private var _referrer:String;
		/**
		 * Содержит строку с информацией о том, откуда было запущено приложение.
		 * @return 
		 */
		public function get referrer():String{
			return this._referrer;
		}
		
		private var _posterID:uint;
		/**
		 * id пользователя, разместившего запись на стене.
		 * @return 
		 */
		public function get posterID():uint{
			return this._posterID;
		}
		
		private var _postID:String;
		/**
		 * id сохраненной на стене записи. 
		 * @return 
		 */
		public function get postID():String{
			return this._postID;
		}
	}
}