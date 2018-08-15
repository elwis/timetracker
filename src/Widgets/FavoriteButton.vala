
public class Timetracker.FavoriteButton : Gtk.Button {
    private static FavoriteButton? instance = null;

    private Gtk.Image pic;

    public static FavoriteButton get_instance () {
        if (instance == null) {
            instance = new FavoriteButton ();
        }

        return instance;
    }

    private FavoriteButton () {
        pic = new Gtk.Image.from_icon_name ("non-starred",  Gtk.IconSize.LARGE_TOOLBAR);

        this.image = pic;

        expand = false;
        can_focus = false;
        has_tooltip = true;
        tooltip_text = (_("Favorite project"));

        
    }

}
