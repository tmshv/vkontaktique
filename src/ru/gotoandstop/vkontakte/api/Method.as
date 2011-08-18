package ru.gotoandstop.vkontakte.api{
	public class Method{
		//Пользователи
		/**
		 * Возвращает, установил пользователь данное приложение или нет.
		 */
		public static const IS_APP_USER:String = 'isAppUser';
		
		/**
		 * Ввозвращает расширенную информацию о пользователях. 
		 */
		public static const GET_PROFILES:String = 'getProfiles';
		
		/**
		 * Возвращает список id друзей текущего пользователя. 
		 */
		public static const GET_FRIENDS:String = 'getFriends';
		
		/**
		 * Возвращает список id друзей текущего пользователя, которые установили данное приложение. 
		 */
		public static const GET_APP_FRIENDS:String = 'getAppFriends';
		
		/**
		 * Возвращает баланс текущего пользователя в данном приложении. 
		 */
		public static const GET_USER_BALANCE:String = 'getUserBalance';
		
		/**
		 * Возвращает настройки приложения текущего пользователя. 
		 */
		public static const GET_USER_SETTINGS:String = 'getUserSettings';
		
		/**
		 * Возвращает список id групп, в которых состоит текущий пользователь. 
		 */
		public static const GET_GROUPS:String = 'getGroups';
		
		/**
		 * Возвращает базовую информацию о группах, в которых состоит текущий пользователь. 
		 */
		public static const GET_GROUPS_FULL:String = 'getGroupsFull';
		
//		Фотографии
//		photos.getAlbums – Возвращает список альбомов пользователя.
//		photos.get – Возвращает список фотографий в альбоме.
//		photos.getById – Возвращает информацию о фотографиях.
//		photos.createAlbum – Создает пустой альбом для фотографий.
//		photos.editAlbum – Обновляет данные альбома для фотографий.
//		photos.getUploadServer – Возвращает адрес сервера для загрузки фотографий.
//		photos.save – Сохраняет фотографии после успешной загрузки.
//		photos.getProfileUploadServer – Возвращает адрес сервера для загрузки фотографии на страницу пользователя.
//		photos.saveProfilePhoto – Сохраняет фотографию страницы пользователя после успешной загрузки.
//		photos.move - Переносит фотографию из одного альбома в другой.
//		photos.makeCover - Делает фотографию обложкой альбома.
//		photos.reorderAlbums - Меняет порядок альбома в списке альбомов пользователя.
//		photos.reorderPhotos - Меняет порядок фотографий в списке фотографий альбома.
		
		//Стена
		/**
		 * Возвращает адрес сервера для загрузки фотографии на стену. 
		 */
		public static const WALL_GET_PHOTO_UPLOAD_SERVER:String = 'wall.getPhotoUploadServer';
		
		/**
		 * Сохраняет запись на стене пользователя. 
		 */
		public static const WALL_SAVE_POST:String = 'wall.savePost';
		
//		Аудиозаписи
//		audio.get – Возвращает список аудиозаписей пользователя или группы.
//		audio.getById – Возвращает информацию об аудиозаписях по их идентификаторам.
//		audio.getLyrics - Возвращает текст аудиозаписи.
//		audio.getUploadServer – Возвращает адрес сервера для загрузки аудиозаписей.
//		audio.save – Сохраняет аудиозаписи после успешной загрузки.
//		audio.search – Осуществляет поиск по аудиозаписям.
//		audio.add – Копирует существующую аудиозапись на страницу пользователя или группы.
//		audio.delete – Удаляет аудиозапись со страницы пользователя или группы.
//		audio.edit – Редактирует аудиозапись пользователя или группы.
//		audio.restore – Восстанавливает удаленную аудиозапись пользователя или группы.
//		audio.reorder – Изменяет порядок аудиозаписи в списке аудиозаписей пользователя.
		
		//Видеозаписи
		/**
		 * Возвращает информацию о видеозаписях. 
		 */
		public static const VIDEO_GET:String = 'video.get';
		
		//Географические объекты
		/**
		 * Возвращает информацию о городах по их id. 
		 */
		public static const GET_CITIES:String = 'getCities';
		
		/**
		 * Возвращает информацию о странах по их id. 
		 */
		public static const GET_COUNTRIES:String = 'getCountries';
		
		//Методы, требующие наличия стороннего сервера
		//secure.sendNotification – Отправляет уведомление пользователю.
		//secure.saveAppStatus – Сохраняет строку статуса приложения для последующего вывода в общем списке приложений на странице пользоваетеля.
		//secure.getAppStatus – Возвращает строку статуса приложения, сохранённую при помощи secure.saveAppStatus.
		//secure.getAppBalance – Возвращает платежный баланс приложения.
		//secure.getBalance – Возвращает баланс пользователя на счету приложения.
		//secure.addVotes – Переводит голоса со счета приложения на счет пользователя.
		//secure.withdrawVotes – Списывает голоса со счета пользователя на счет приложения.
		//secure.transferVotes – Переводит голоса со счета одного пользователя на счет другого в рамках приложения.
		//secure.getTransactionsHistory – Возвращает историю транзакций внутри приложения.
		//secure.addRating – Поднимает пользователю рейтинг от имени приложения.
		//secure.setCounter – Устанавливает счетчик, который выводится пользователю жирным шрифтом в левом меню, если он добавил приложение в левое меню.
		
		//Методы для отправки и приема SMS
		//secure.getSMSHistory – Возвращает список SMS-уведомлений, отосланных приложением.
		//secure.sendSMSNotification – Отправляет SMS-уведомление на телефон пользователя.
		//secure.getSMS - Возвращает тексты SMS, полученные от пользователей приложения.
		/**
		 * Устанавливает префикс для приема SMS. 
		 */
		public static const SET_SMS_PREFIX:String = 'setSMSPrefix';
		
		/**
		 * Возвращает префикс для приема SMS. 
		 */
		public static const GET_SMS_PREFIX:String = 'getSMSPrefix';
		
		//Методы для локализации приложений
		/**
		 * Возвращает список переведенных на указанный язык фраз. 
		 */
		public static const LANGUAGE_GET_VALUES:String = 'language.getValues';
		//secure.setLanguageValue – Создает языковую фразу для перевода на другие языки.
		//secure.deleteLanguageValue – Удаляет языковую фразу.
		
		//Другие методы
		/**
		 * Позволяет исполнять алгоритмы в API.
		 */
		public static const EXECUTE:String = 'execute';
		
		/**
		 * Возвращает значение хранимой переменной.
		 */
		public static const GET_VARIABLE:String = 'getVariable';
		
		/**
		 * Возвращает значения нескольких переменных.
		 */
		public static const GET_VARIABLES:String = 'getVariables';
		
		/**
		 * Записывает значение переменной.
		 */
		public static const PUT_VARIABLE:String = 'putVariable';
	
		/**
		 * Возвращает таблицу рекордов.
		 */
		public static const GET_HIGHT_SCORES:String = 'getHighScores';
			
		/**
		 * Записывает результат текущего пользователя в таблицу рекордов.
		 */
		public static const SET_USER_SCORE:String = 'setUserScore';
	
		/**
		 * Возвращает список очереди сообщений.
		 */
		public static const GET_MESSAGE:String = 'getMessages';
		
		/**
		 * Ставит сообщение в очередь.
		 */
		public static const SEND_MESSAGE:String = 'sendMessage';
		
		/**
		 * Возвращает текущее время.
		 */
		public static const GET_SERVER_TIME:String = 'getServerTime';
	
		/**
		 * Возвращает рекламные объявления для показа пользователям.
		 */
		public static const GET_ADS:String = 'getAds';
		
		/**
		 * Устанавливает короткое название приложения в левом меню, если пользователь добавил туда приложение.
		 */
		public static const SET_NAME_IN_MENU:String = 'setNameInMenu';
		
//		Методы сервиса предложений
//		offers.edit – Сохраняет информацию о предложении пользователя.
//		offers.open – Открывает предложение пользователя для общего доступа.
//		offers.close – Закрывает предложение пользователя.
//		offers.get – Возвращает информацию о предложении пользователя.
//		offers.search – Возвращает информацию о случайном предложении в соответствии с выбранными фильтрами.
//		offers.getInboundResponses – Возвращает информацию об ответах на предложение пользователя.
//		offers.getOutboundResponses – Возвращает информацию об ответах пользователя на другие предложения.
//		offers.accept – Принимает предложение.
//		offers.refuse – Отклоняет предложение.
//		offers.setResponseViewed – Отмечает ответы на предложение пользователя как просмотренные.
//		offers.deleteResponses – Удаляет ответы на предложение пользователя.
		
//		Методы сервиса вопросов
//		questions.get – Возвращает список вопросов пользователя.
//		questions.edit – Редактирует информацию о вопросе.
//		questions.add – Создает новый вопрос.
//		questions.delete – Удаляет вопрос.
//		questions.search – Возвращает список найденных вопросов.
//		questions.getTypes – Возвращает список всех возможных типов вопросов.
//		questions.getOutbound – Возвращает список вопросов, на которые ответил пользователь.
//		questions.getAnswers – Возвращает ответы на вопрос.
//		questions.addAnswer – Добавляет ответ на вопрос.
//		questions.deleteAnswer – Удаляет ответ на вопрос.
//		questions.joinAnswer – Этим вызовом пользователь присоединяется к ответу.
//		questions.getAnswerVotes – Возвращает список пользователей, присоединившихся к ответу.
//		questions.markAsViewed – Отмечает список ответов на вопросы пользователя как просмотренные.
		
		//Методы работы с вики-страницами
		/**
		 * Возвращает вики-страницу.
		 */
		public static const PAGES_GET:String = 'pages.get';
		
		/**
		 * Сохраняет текст вики-страницы.
		 */
		public static const PAGES_SAVE:String = 'pages.save';
		
		/**
		 * Сохраняет настройки доступа вики-страницы.
		 */
		public static const PAGES_SAVE_ACCESS:String = 'pages.saveAccess';
		
		/**
		 * Возвращает старую версию вики-страницы.
		 */
		public static const PAGES_GET_VERSION:String = 'pages.getVersion';
		
		/**
		 * Возвращает список всех старых версий вики-страницы.
		 */
		public static const PAGES_GET_HISTORY:String = 'pages.getHistory';
		
		/**
		 * Возвращает список вики-страниц в группе.
		 */
		public static const PAGES_GET_TITLES:String = 'pages.getTitles';
		
		/**
		 * Возвращает html-представление wiki-разметки.
		 */
		public static const PARSE_WIKINEW:String = 'parseWikinew';
		
		//Устаревшие методы
		/**
		 * Возвращает краткую информацию о текущем пользователе.
		 */
		public static const GET_USER_INFO:String = 'getUserInfo';

		/**
		 * Возвращает расширенную информацию о текущем пользователе.
		 */
		public static const GET_USER_INFO_EX:String = 'getUserInfoEx';
	}
}