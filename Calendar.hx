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
			day = getDay();
		if (month != null)
			month = getMonth();
	}

	public function getDay()
	{
		return getDateName(['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'], Date.now().getDay());
	}

	public function getMonth()
	{
		return getDateName(['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'], 
			Date.now().getMonth());
	}

	function getDateName(names:Array<String> = null, index:Int = 0)
	{
		return shortName ? names[index].substring(0, 3) : names[index];
	}
}