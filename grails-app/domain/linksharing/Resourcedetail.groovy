package linksharing

class Resourcedetail {


    Topic topic
    Userdetail createdBy
    String description
    Date dateCreated
    Date lastUpdated

    static belongsTo = [createdBy: Userdetail, topic: Topic]

    static hasMany = [readingItems: ReadingItem, resourceRatings: ResourceRating]

    static mapping = {
        tablePerHierarchy false
    }


    static constraints = {
        description nullable: false, blank: false
    }
}
