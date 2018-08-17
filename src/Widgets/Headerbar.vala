public class Timetracker.Headerbar : Gtk.HeaderBar {
    private static Headerbar? instance = null;
    private Timetracker.FavoriteButton favorite_button;
    private Gtk.MenuButton menu_button;
    private Gtk.Menu menu;
    private Gtk.MenuItem item_new;
    private Gtk.MenuItem item_export;
     

    public static Headerbar get_instance() {
        if(instance == null) {
            instance = new Headerbar();
        }
    return instance;    
    }
    private Headerbar() {
        create_ui();
    }

    private void create_ui() {
        create_menu();
        favorite_button = FavoriteButton.get_instance();
        set_title(null, null);
        set_show_close_button(true);
        pack_end(menu_button);
        pack_end(favorite_button);

        this.show_all();
    }

    private void create_menu () {
        menu = new Gtk.Menu ();
        item_new   = new Gtk.MenuItem.with_label (_("New Project"));
        item_export = new Gtk.MenuItem.with_label (_("Export to file"));
        menu.add (item_new);
        menu.add (item_export);

        var separator = new Gtk.SeparatorMenuItem ();
        menu.add (separator);

        menu_button = new Gtk.MenuButton ();
        menu_button.set_popup (menu);
        menu_button.set_image (new Gtk.Image.from_icon_name ("open-menu", Gtk.IconSize.LARGE_TOOLBAR));
        menu.show_all ();
    }
    
    public new void set_title(string? the_date, string? project_name) {
    
     this.title = "20180815 - Mein project";
    }

}
