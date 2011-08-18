package ru.gotoandstop.vkontakte.api{
	
	/**
	 * Падеж для склонения имени и фамилии пользователя.
	 * Возможные значения:
	 *  именительный – nom,
	 *  родительный – gen,
	 *  дательный – dat,
	 *  винительный – acc,
	 *  творительный – ins,
	 *  предложный – abl.
	 * По умолчанию: nom.
	 * @author Roman Timashev
	 */
	public class NameCase{
		public static const NOM:String = 'nom';
		public static const GEN:String = 'gen';
		public static const DAT:String = 'dat';
		public static const ACC:String = 'acc';
		public static const INS:String = 'ins';
		public static const ABL:String = 'abl';
	}
}