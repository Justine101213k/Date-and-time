package;

class Calendar
{
	public static var current(get, never):Calendar;
	public var shortName:Bool = false;

	inline static function get_current()
	{
		return new Calendar();
	}

	public function new(?day:String, ?month:String, ?shortName:Bool = false)
	{
		this.shortName = shortName;
		if (day != null)
			day = getDayName();
		if (month != null)
			month = getMonthName();
	}

	public function getDayName()
	{
		return getName(['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'], Date.now().getDay());
	}

	public function getMonthName()
	{
		return getName(['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'], 
			Date.now().getMonth());
	}

	function getName(names:Array<String> = null, index:Int = 0)
	{
		return shortName ? names[index].substring(0, 3) : names[index];
	}
}
