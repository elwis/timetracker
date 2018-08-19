
namespace Db {
    private string? filename = null;

    public void init() throws Error {
        assert (filename != null);
        DatabaseManager.init(filename);

    }

    public void terminate() {
        DatabaseManager.terminate();
    }
}

public abstract class DatabaseManager {

    protected static Sqlite.Database db;
    public string table_name = null;

    private static void prepare_db (string filename) {

    File file_db = File.new_for_path (filename);
    var existed = file_db.query_exists ();
    int res = Sqlite.Database.open_v2 (filename, out db, Sqlite.OPEN_READWRITE | Sqlite.OPEN_CREATE, null);

    assert (res == Sqlite.OK);

    try {
            Fileinfo info = file_db.query_info (FileAttribute.ACCESS_CAN_WRITE, FileQueryInfoFlags.NONE);
            assert (info.get_attribute_boolean (FileAttribute.ACCESS_CAN_WRITE));

            if(!existed) {
                    //get instances of our coooool tables
                }
        } catch (Error e) {
            error ("Error accesing database file: \n %s \n\n Error was: \n%s", filename, e.message);
        }
    } 
}
