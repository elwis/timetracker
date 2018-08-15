public class Timetracker.Window : Gtk.ApplicationWindow {

    public Window(Application app) {
        Object(application: app);
        create_ui();
    }

    private void create_ui(){
    set_title(_("Timetracker"));
    this.show_all();
    
    }

    public void show_app() {
        show();
        present();    
    } 
}
