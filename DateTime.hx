package;

import openfl.text.TextField;
import openfl.text.TextFormat;

class DateTime extends TextField
{
	public var twentyFourHoursMode:Bool = false;

	public var minutes(default, null):String;
	public var hours(default, null):String;

	public override function new(x:Float = 0, y:Float = 0, color:Int = 0xFFFFFF)
	{
		super();
		this.x = x;
		this.y = y;
		mouseEnabled = false;
		selectable = false;
		defaultTextFormat = new TextFormat("_sans", 12, Std.parseInt(Std.string(color)));
		width = 200;
	}

	private override function __update(transformOnly:Bool, updateChildren:Bool)
	{
		super.__update(transformOnly, updateChildren);

		var curDate:Date = Date.now();
		minutes = '0' + Std.string(curDate.getMinutes());
		if (curDate.getMinutes() >= 10)
		{
			minutes = Std.string(curDate.getMinutes());
		}
		hours = '0' + Std.string(curDate.getHours());
		if (curDate.getHours() >= 10)
		{
			if (curDate.getHours() >= 13 && !twentyFourHoursMode)
				hours = Std.string(curDate.getHours() - 12);
			else
				hours = Std.string(curDate.getHours());
		}
		var time:String = curDate.getHours() <= 11 ? 'AM' : 'PM';
		var calendar:Calendar = Calendar.instance;
		if (visible)
		{
			text = Std.string('Time: ' + hours + ':' + minutes + ' ' + time + '\nDate: ' + calendar.getMonth() + ' ' + curDate.getDate() + ', ' 
				+ curDate.getFullYear() + '\nDay: ' + calendar.getDay());
		}
	}
}