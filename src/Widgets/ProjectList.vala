
public class Timetracker.ProjectList : Gtk.Box {
    private static ProjectList? instance = null;

    public Gtk.ListBox listbox;
    private Gtk.Frame toolbar;

    private Gtk.Separator separator;
    private Gtk.Button minus_button;
    private Gtk.Button plus_button;
    private Gtk.Label notebook_name;
    private Gtk.Label page_total;
    private Gtk.ListBoxRow row;

    public static ProjectList get_instance () {
        if (instance == null) {
            instance = new ProjectList ();
        }

        return instance;
    }

    private ProjectList () {

         build_ui ();
 
    }

    private void build_ui() {
        
        orientation = Gtk.Orientation.VERTICAL;

        var scroll_box = new Gtk.ScrolledWindow (null, null);
        listbox = new Gtk.ListBox ();
        listbox.vexpand = true;
        listbox.set_selection_mode (Gtk.SelectionMode.MULTIPLE);
        listbox.activate_on_single_click = false;
        listbox.set_size_request (200,250);
        // dummy data
        Gtk.ListBoxRow row= new Gtk.ListBoxRow();
        row.add(new Gtk.Label ("Baka bröd"));
        row.show_all();
        listbox.insert(row,0);
        // end dummy
        scroll_box.add(listbox);
        scroll_box.set_size_request (200,250);

        this.add(scroll_box);
 
    }


}
