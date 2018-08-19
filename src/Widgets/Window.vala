public class Timetracker.Window : Gtk.ApplicationWindow {

    private Timetracker.Headerbar headerbar;
    private Timetracker.ProjectList project_list;

    private Gtk.Paned pane1;
    private Gtk.Paned pane2;
    public Window(Application app) {
        Object(application: app);
        create_ui();
    }

    private void create_ui(){
    set_title(_("Timetracker"));
    headerbar = Timetracker.Headerbar.get_instance();
    set_titlebar (headerbar);
    pane1 = new Gtk.Paned(Gtk.Orientation.HORIZONTAL);
    pane2 = new Gtk.Paned(Gtk.Orientation.HORIZONTAL);    
    project_list = Timetracker.ProjectList.get_instance();

    pane1.pack1(project_list, false, false);
    pane1.pack2(pane2, true, false);
    pane2.pack1(new Gtk.Label("pane2 pack1"), false, false);
    pane1.position = (50);
    this.add(pane1);


    this.set_default_size(600,300);
    this.show_all();
    
    }

    public void show_app() {
        show();
        present();    
    } 
}
