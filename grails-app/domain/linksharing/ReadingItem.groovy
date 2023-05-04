package linksharing

class ReadingItem {

    Userdetail user;
    Resourcedetail resource;
    Boolean isRead;

    static  belongsTo = [user: Userdetail, resource: Resourcedetail]


    static constraints = {
        isRead nullable: false, blank: false
    }
}
