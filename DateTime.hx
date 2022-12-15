package;

import openfl.text.TextField;
import openfl.text.TextFormat;

class DateTime extends TextField
{
	public var twentyFourHoursMode:Bool = false;

	public var minutes(default, null):String;
	public var hours(default, null):String;

	public var currentMode(default, null):Mode = Time;
	public var currentCase(default, null):TextCases = Both;

	public override function new(x:Float = 0, y:Float = 0, ?mode:Mode = Time, ?cases:TextCases = Both, color:Int = 0xFFFFFF)
	{
		super();
		this.x = x;
		this.y = y;
		currentMode = mode;
		currentCase = cases;
		mouseEnabled = false;
		selectable = false;
		defaultTextFormat = new TextFormat("_sans", 12, Std.parseInt(Std.string(color)));
		width = 200;
	}

	function getDateText()
	{
		var curDate:Date = Date.now();
		minutes = '0' + Std.string(curDate.getMinutes());
		if (curDate.getMinutes() >= 10)
		{
			minutes = Std.string(curDate.getMinutes());
		}
		hours = '0' + Std.string(curDate.getHours());
		if (curDate.getHours() >= 10)
		{
			var tfm:Bool = curDate.getHours() >= 13 && !twentyFourHoursMode;
			hours = Std.string(curDate.getHours() - (tfm ? 12 : 0));
		}
		var time:String = curDate.getHours() <= 11 ? 'AM' : 'PM';
		var calendar:Calendar = new Calendar();
		switch (currentMode)
		{
			case Dates(true):
				return doTextCase(Std.string('Date: ' + curDate.getDate() + '/' + curDate.getMonth() + '/' + curDate.getFullYear()));
			case Dates(false):
				return doTextCase(Std.string('Date: ' + calendar.getMonthName() + ' ' + curDate.getDate() + ', ' + curDate.getFullYear()));
			case Time:
				return doTextCase(Std.string('Time: ' + hours + ':' + minutes + ' ' + time));
			case Day:
				return doTextCase(Std.string('Day: ' + calendar.getDayName()));
			case All(true):
				return doTextCase(Std.string('Time: ' + hours + ':' + minutes + ' ' + time 
					+ '\nDate: ' + curDate.getDate() + '/' + curDate.getMonth() + '/' + curDate.getFullYear() 
					+ '\nDay: ' + calendar.getDayName()));
			case All(false):
				return doTextCase(Std.string('Time: ' + hours + ':' + minutes + ' ' + time 
					+ '\nDate: ' + calendar.getMonthName() + ' ' + curDate.getDate() + ', ' + curDate.getFullYear() 
					+ '\nDay: ' + calendar.getDayName()));
		}
		return null;
	}

	function doTextCase(text:String)
	{
		switch (currentCase)
		{
			case Upper:
				return text.toUpperCase();
			case Lower:
				return text.toLowerCase();
			case Both:
				return text;
		}
	}

	private override function __update(transformOnly:Bool, updateChildren:Bool)
	{
		super.__update(transformOnly, updateChildren);

		if (visible)
		{
			text = this.getDateText();
		}
	}
}