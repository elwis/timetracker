namespace Timetracker {
    public Timetracker.Window window;
}

public class Timetracker.Application : Granite.Application {

    public override void activate() {
        window = new Timetracker.Window(this);


  
    window.show_app();
    }
}