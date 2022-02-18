package;

import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.utils.Assets;
import openfl.events.Event;

// Made by Gtnv (Cool Gamer) Me
class DateTime extends TextField
{
    private var days:String;
    private var month:String;
    private var seconds:String;

    public function new(x:Float = 10.0, y:Float = 10.0, colorString:String)
    {
        super();

        this.x = x;
        this.y = y;

        selectable = false;
        mouseEnabled = false;

        defaultTextFormat = new TextFormat("_sans", 12, Std.parseInt(colorString));

        addEventListener(Event.ENTER_FRAME, onDate);

        width = 150;
        height = 70;
    }

    private function onDate(none)
    {
        var ts:String;

        if (Date.now().getHours() < 10) hours = '0' + Std.string(Date.now().getHours()); else hours = Std.string(Date.now().getHours());
    
        if (Date.now().getMinutes() < 10) minutes = '0' + Std.string(Date.now().getMinutes()); else minutes = Std.string(Date.now().getMinutes());

        if (Date.now().getSeconds() <= 10) seconds = '0' + Std.string(Date.now().getMinutes()); else seconds = Std.string(Date.now().getSeconds());
    
        // copied from DateTools.hx lol
        if (Date.now().getHours() > 11) ts = 'PM'; else ts = 'AM';

        days = Calendar.DAYS_NAME[Date.now().getDay()];
        month = Calendar.MONTH_NAME[Date.now().getMonth()];

        visible = FlxG.save.data.dateTimeShowing;

        if (visible)
        {
            // Swag
            text = Std.string('\nTime: ' + hours + ':' + minutes + ':' + seconds + ' ' + ts + '\nDate: ' + month + ' ' + Date.now().getDate() + ', ' + Date.now().getFullYear() + '\nDay: ' + days);
        }
    }

    var hours:String;
    var minutes:String;
}

class Calendar
{
    public static var MONTH_SHORT_NAME = [
        'Jan', 'Feb', 'Mar', 'Apr', 'May',
        'Jun', 'Jul', 'Aug', 'Sep', 'Oct',
        'Nov', 'Dec'
    ];

    public static var MONTH_NAME = [
        'January', 'February', 'March', 'April', 'May',
        'June', 'July', 'August', 'September', 'October',
        'November', 'December'
    ];

    public static var DAYS_SHORT_NAME = [
        'Sun', 'Mon', 'Tue', 'Wed', 'Thu',
        'Fri', 'Sat'
    ];

    public static var DAYS_NAME = [
        'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday',
        'Friday', 'Saturday'
    ];
}
