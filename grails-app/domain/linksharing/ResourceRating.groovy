package linksharing

class ResourceRating {

    Resourcedetail resource
    Userdetail user
    Integer score
    Date dateCreated
    Date lastUpdated

    static belongsTo = [user: Userdetail, resource: Resourcedetail]

    static constraints = {
        score min: 1, max:5
    }

}
