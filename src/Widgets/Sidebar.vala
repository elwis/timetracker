public class Timetracker.Sidebar : Granite.Widgets.SourceList {

private static Sidebar? instance = null;

    private Granite.Widgets.SourceList.Item? previous_selection = null;
    private ProjectList projects = new ProjectList (_("Projects"));

    private Gee.HashMap<int, ProjectItem> added_projects;

    public static Sidebar get_instance () {
        if (instance == null) {
            instance = new Sidebar ();
        }

        return instance;
    }

    private Sidebar () {
        build_new_ui ();
        load_projects ();
        projects.collapse_all (true, true);
        root.expand_all (false, false);
    }
    
    public Sidebar.project_list (Timetracker.Project to_ignore) {
        build_new_ui ();
        projects.expand_all (true, false);
        load_projects (false, to_ignore);
    }

    private void build_new_ui () {
        root.add (projects);

        can_focus = false;
        this.width_request = 150;
    }

    public void load_projects (bool add_menus = true, Timetracker.Project? to_ignore = null) {
        this.projects.clear ();

        var project_list = DatabaseManager.get_instance ().get_projects ();
        added_projects = new Gee.HashMap<int, ProjectItem>();
        var to_add = new Gee.ArrayList<ProjectItem>();

        foreach (Timetracker.Project project in project_list) {       
            var item = new ProjectItem (project, add_menus);
            added_projects.set ((int) project.id, item);
            
            if (to_ignore != null && to_ignore.id == project.id) continue;

            if (project.parent_id == 0) {
                this.projects.add (item);
            } else {
                to_add.add (item);
            }
        }

        foreach (var item in to_add) {
            if (added_projects.has_key ((int) item.project.parent_id)) {
                added_projects.get ((int) item.project.parent_id).add (item);
            }
        }
    }

    
    public void select_project (int64 project_id) {
        if (added_projects.has_key ((int) project_id)) {
            selected = added_projects.get ((int) project_id);
        }
    }

    public void first_start () {
        if (projects.children.is_empty) {
            first_project ();
        }
    }

    private void first_project () {
        var project_id = Databasemanager.get_instance ().new_project (0, _("My First Project"), {1, 0, 0}, "", "");

        load_projects ();
        select_project (project_id);
    }

 
}
