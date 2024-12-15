import Toybox.Graphics;
import Toybox.WatchUi;
using Toybox.System;
using Toybox.Time;
using Toybox.Time.Gregorian;
using Toybox.Lang;
import Toybox.Application.Properties;

class ViewHx extends WatchUi.View {

    private var _textTop;
    private var _currentWoPLabel;
    private var _countdownDaysLabel;
    private var _trimesterLabel;
    private var center_x;
    private var center_y;
    public var bodySyst;
    var calculator;
    var stats = new WoPstats();
    var drawer = new WoPDrawer();
    var dialog;

    function initialize(bodySystem) {
        bodySyst = bodySystem;
        System.println("InitViewHxbodySystem: "+bodySystem);
        View.initialize();

    }

     public function updateTrimester(newTrimester) {
        bodySyst = newTrimester;
        System.println("updateTrimester bodySyst: "+bodySyst);
        WatchUi.requestUpdate(); // Refresh the view with the new trimester
    }

    // Load your resources here
    function onLayout(dc) as Void {
    // set layout and
        setLayout(Rez.Layouts.MainLayout(dc));
        _textTop = findDrawableById("textTop");
        _currentWoPLabel = findDrawableById("week");
        _countdownDaysLabel = findDrawableById("countdown");
        _trimesterLabel = findDrawableById("trimester");
        center_x = dc.getWidth()/2;
        center_y = dc.getHeight()/2;
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
        System.println("onShow: "+bodySyst);
        // calculate countdown and set text
        _textTop.setText(WatchUi.loadResource(Rez.Strings.myHistory));

        //calculate week an set text
        _currentWoPLabel.setColor(Graphics.COLOR_BLUE);
        _currentWoPLabel.setText(WatchUi.loadResource(Rez.Strings.CVStitle) );
        _countdownDaysLabel.setText(WatchUi.loadResource(Rez.Strings.CVS1) );
        
        // bodySyst = 3;
        switch (bodySyst){
            case 0:
                _textTop.setText(WatchUi.loadResource(Rez.Strings.myHistory));
                _currentWoPLabel.setText(WatchUi.loadResource(Rez.Strings.Generaltitle) );
                _countdownDaysLabel.setText(WatchUi.loadResource(Rez.Strings.General1) );
                _trimesterLabel.setColor(Graphics.COLOR_BLUE);
                _trimesterLabel.setText(WatchUi.loadResource(Rez.Strings.General1) );
                _countdownDaysLabel.setText(WatchUi.loadResource(Rez.Strings.General2) );
                break;
            case 1:
                _textTop.setText(WatchUi.loadResource(Rez.Strings.myHistory));
                _currentWoPLabel.setText(WatchUi.loadResource(Rez.Strings.CVStitle) );
                _countdownDaysLabel.setText(WatchUi.loadResource(Rez.Strings.CVS1) );
                _trimesterLabel.setColor(Graphics.COLOR_BLUE);
                _trimesterLabel.setText(WatchUi.loadResource(Rez.Strings.CVS1) );
                _countdownDaysLabel.setText(WatchUi.loadResource(Rez.Strings.CVS2) );
                break;
            case 2:
                _textTop.setText(WatchUi.loadResource(Rez.Strings.myHistory));
                _currentWoPLabel.setText(WatchUi.loadResource(Rez.Strings.Resptitle) );
                _countdownDaysLabel.setText(WatchUi.loadResource(Rez.Strings.Resp1) );
                _trimesterLabel.setColor(Graphics.COLOR_BLUE);
                _trimesterLabel.setText(WatchUi.loadResource(Rez.Strings.Resp1) );
                _countdownDaysLabel.setText(WatchUi.loadResource(Rez.Strings.Resp2) );
                break;
            case 3:
                _textTop.setText(WatchUi.loadResource(Rez.Strings.myHistory));
                _currentWoPLabel.setText(WatchUi.loadResource(Rez.Strings.GItitle) );
                _countdownDaysLabel.setText(WatchUi.loadResource(Rez.Strings.GI1) );
                _trimesterLabel.setColor(Graphics.COLOR_BLUE);
                _trimesterLabel.setText(WatchUi.loadResource(Rez.Strings.GI1) );
                _countdownDaysLabel.setText(WatchUi.loadResource(Rez.Strings.GI2) );
                break;
            case 4:
                _textTop.setText(WatchUi.loadResource(Rez.Strings.myHistory));
                _currentWoPLabel.setText(WatchUi.loadResource(Rez.Strings.Neurotitle) );
                _countdownDaysLabel.setText(WatchUi.loadResource(Rez.Strings.Neuro1) );
                _trimesterLabel.setColor(Graphics.COLOR_BLUE);
                _trimesterLabel.setText(WatchUi.loadResource(Rez.Strings.Neuro1) );
                _countdownDaysLabel.setText(WatchUi.loadResource(Rez.Strings.Neuro2) );
                break;
            case 5:
                _textTop.setText(WatchUi.loadResource(Rez.Strings.myHistory));
                _currentWoPLabel.setText(WatchUi.loadResource(Rez.Strings.GUtitle) );
                _countdownDaysLabel.setText(WatchUi.loadResource(Rez.Strings.GU1) );
                _trimesterLabel.setColor(Graphics.COLOR_BLUE);
                _trimesterLabel.setText(WatchUi.loadResource(Rez.Strings.GU1) );
                _countdownDaysLabel.setText(WatchUi.loadResource(Rez.Strings.GU2) );
                break;
            case 6:
                _textTop.setText(WatchUi.loadResource(Rez.Strings.myHistory));
                _currentWoPLabel.setText(WatchUi.loadResource(Rez.Strings.Othertitle) );
                _countdownDaysLabel.setText(WatchUi.loadResource(Rez.Strings.Other1) );
                _trimesterLabel.setColor(Graphics.COLOR_BLUE);
                _trimesterLabel.setText(WatchUi.loadResource(Rez.Strings.Other1) );
                _countdownDaysLabel.setText(WatchUi.loadResource(Rez.Strings.Other2) );
                break;
            case 7:
                _textTop.setText(WatchUi.loadResource(Rez.Strings.myHistory));
                _currentWoPLabel.setText(WatchUi.loadResource(Rez.Strings.CVStitle) );
                _countdownDaysLabel.setText(WatchUi.loadResource(Rez.Strings.CVS1) );
                _trimesterLabel.setColor(Graphics.COLOR_BLUE);
                _trimesterLabel.setText(WatchUi.loadResource(Rez.Strings.CVS1) );
                _countdownDaysLabel.setText(WatchUi.loadResource(Rez.Strings.CVS2) );
                break;
            case 8:
                _trimesterLabel.setColor(Graphics.COLOR_GREEN);
                _trimesterLabel.setText(bodySyst + WatchUi.loadResource(Rez.Strings.third) + WatchUi.loadResource(Rez.Strings.trimester));
                break;
            case 9 :
                _trimesterLabel.setColor(Graphics.COLOR_WHITE);
                _textTop.setText("");
                _currentWoPLabel.setText(WatchUi.loadResource(Rez.Strings.text_wrong_date1));
                _trimesterLabel.setText(WatchUi.loadResource(Rez.Strings.text_wrong_date2));
                _countdownDaysLabel.setText(WatchUi.loadResource(Rez.Strings.text_wrong_date3));
                break;
        }
    }

    // Update the view
    function onUpdate(dc) as Void {
        System.println("onUpdate: "+bodySyst);
        dc.setColor(Graphics.COLOR_BLACK,Graphics.COLOR_BLACK);
        dc.clear();
        dc.setColor(Graphics.COLOR_WHITE,Graphics.COLOR_TRANSPARENT);

         _textTop.setText(WatchUi.loadResource(Rez.Strings.myHistory));

        //calculate week an set text
        _currentWoPLabel.setColor(Graphics.COLOR_BLUE);
        _currentWoPLabel.setText(WatchUi.loadResource(Rez.Strings.CVStitle) );
        _countdownDaysLabel.setText(WatchUi.loadResource(Rez.Strings.CVS1) );
        
         // bodySyst = 3;
        switch (bodySyst){
            case 0:
                _textTop.setText(WatchUi.loadResource(Rez.Strings.myHistory));
                _currentWoPLabel.setText(WatchUi.loadResource(Rez.Strings.Generaltitle) );
                _countdownDaysLabel.setText(WatchUi.loadResource(Rez.Strings.General1) );
                _trimesterLabel.setColor(Graphics.COLOR_BLUE);
                _trimesterLabel.setText(WatchUi.loadResource(Rez.Strings.General1) );
                _countdownDaysLabel.setText(WatchUi.loadResource(Rez.Strings.General2) );
                break;
            case 1:
                _textTop.setText(WatchUi.loadResource(Rez.Strings.myHistory));
                _currentWoPLabel.setText(WatchUi.loadResource(Rez.Strings.CVStitle) );
                _countdownDaysLabel.setText(WatchUi.loadResource(Rez.Strings.CVS1) );
                _trimesterLabel.setColor(Graphics.COLOR_BLUE);
                _trimesterLabel.setText(WatchUi.loadResource(Rez.Strings.CVS1) );
                _countdownDaysLabel.setText(WatchUi.loadResource(Rez.Strings.CVS2) );
                break;
            case 2:
                _textTop.setText(WatchUi.loadResource(Rez.Strings.myHistory));
                _currentWoPLabel.setText(WatchUi.loadResource(Rez.Strings.Resptitle) );
                _countdownDaysLabel.setText(WatchUi.loadResource(Rez.Strings.Resp1) );
                _trimesterLabel.setColor(Graphics.COLOR_BLUE);
                _trimesterLabel.setText(WatchUi.loadResource(Rez.Strings.Resp1) );
                _countdownDaysLabel.setText(WatchUi.loadResource(Rez.Strings.Resp2) );
                break;
            case 3:
                _textTop.setText(WatchUi.loadResource(Rez.Strings.myHistory));
                _currentWoPLabel.setText(WatchUi.loadResource(Rez.Strings.GItitle) );
                _countdownDaysLabel.setText(WatchUi.loadResource(Rez.Strings.GI1) );
                _trimesterLabel.setColor(Graphics.COLOR_BLUE);
                _trimesterLabel.setText(WatchUi.loadResource(Rez.Strings.GI1) );
                _countdownDaysLabel.setText(WatchUi.loadResource(Rez.Strings.GI2) );
                break;
            case 4:
                _textTop.setText(WatchUi.loadResource(Rez.Strings.myHistory));
                _currentWoPLabel.setText(WatchUi.loadResource(Rez.Strings.Neurotitle) );
                _countdownDaysLabel.setText(WatchUi.loadResource(Rez.Strings.Neuro1) );
                _trimesterLabel.setColor(Graphics.COLOR_BLUE);
                _trimesterLabel.setText(WatchUi.loadResource(Rez.Strings.Neuro1) );
                _countdownDaysLabel.setText(WatchUi.loadResource(Rez.Strings.Neuro2) );
                break;
            case 5:
                _textTop.setText(WatchUi.loadResource(Rez.Strings.myHistory));
                _currentWoPLabel.setText(WatchUi.loadResource(Rez.Strings.GUtitle) );
                _countdownDaysLabel.setText(WatchUi.loadResource(Rez.Strings.GU1) );
                _trimesterLabel.setColor(Graphics.COLOR_BLUE);
                _trimesterLabel.setText(WatchUi.loadResource(Rez.Strings.GU1) );
                _countdownDaysLabel.setText(WatchUi.loadResource(Rez.Strings.GU2) );
                break;
            case 6:
                _textTop.setText(WatchUi.loadResource(Rez.Strings.myHistory));
                _currentWoPLabel.setText(WatchUi.loadResource(Rez.Strings.Othertitle) );
                _countdownDaysLabel.setText(WatchUi.loadResource(Rez.Strings.Other1) );
                _trimesterLabel.setColor(Graphics.COLOR_BLUE);
                _trimesterLabel.setText(WatchUi.loadResource(Rez.Strings.Other1) );
                _countdownDaysLabel.setText(WatchUi.loadResource(Rez.Strings.Other2) );
                break;
            case 7:
                _textTop.setText(WatchUi.loadResource(Rez.Strings.myHistory));
                _currentWoPLabel.setText(WatchUi.loadResource(Rez.Strings.CVStitle) );
                _countdownDaysLabel.setText(WatchUi.loadResource(Rez.Strings.CVS1) );
                _trimesterLabel.setColor(Graphics.COLOR_BLUE);
                _trimesterLabel.setText(WatchUi.loadResource(Rez.Strings.CVS1) );
                _countdownDaysLabel.setText(WatchUi.loadResource(Rez.Strings.CVS2) );
                break;
            case 8:
                _trimesterLabel.setColor(Graphics.COLOR_GREEN);
                _trimesterLabel.setText(bodySyst + WatchUi.loadResource(Rez.Strings.third) + WatchUi.loadResource(Rez.Strings.trimester));
                break;
            case 9 :
                _trimesterLabel.setColor(Graphics.COLOR_WHITE);
                _textTop.setText("");
                _currentWoPLabel.setText(WatchUi.loadResource(Rez.Strings.text_wrong_date1));
                _trimesterLabel.setText(WatchUi.loadResource(Rez.Strings.text_wrong_date2));
                _countdownDaysLabel.setText(WatchUi.loadResource(Rez.Strings.text_wrong_date3));
                break;
        }

         // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
        var myAngle = 90-(60 * bodySyst);
        drawer.drawStatusCircle(dc, center_x, center_y, bodySyst, myAngle);
    }


    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }
}
