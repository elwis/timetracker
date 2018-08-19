public class Timetracker.ProjectList : Granite.Widgets.SourceList.ExpandableItem {
    private Gtk.Menu menu;
    private Gtk.MenuItem new_project_item;

    public ProjectList (string name) {
        Object (name:name);    
    }

    construct {
        menu = new Gtk.Menu ();
        new_project_item = new Gtk.MenuItem.with_label (_("New Project"));
        menu.add( new_project_item);
        menu.show_all();

        //connect with dialog to create new Project
    }

    public override Gtk.Menu? get_context_menu() {
        return menu;
    }
}
