namespace Timetracker {
    public Timetracker.Window window;
}

public class Timetracker.Application : Granite.Application {

    public const string PROGRAM_NAME = N_("Timetracker");

    construct {
        application_id = "com.github.elwis.timetracker";
        program_name = PROGRAM_NAME;
    }
    public override void activate() {
        window = new Timetracker.Window(this);


  
    window.show_app();
    }
}
