package linksharing

class ReadingItem {

    Userdetail user
    Resourcedetail resource
    Boolean isRead
    Date dateCreated
    Date lastUpdated

    static  belongsTo = [user: Userdetail, resource: Resourcedetail]


    static constraints = {
        isRead nullable: false, blank: false
    }
}
