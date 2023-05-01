package linksharing

class Userdetail {

    String email
    String username
    String firstName
    String lastName
    String password
    Byte photo; // Update it
    Boolean admin = false
    Boolean active = true
    Date dateCreated
    Date lastUpdated

    static constraints = {
        email unique: true
        username unique: true
        password blank: false
        lastName nullable: true
        photo nullable: true

    }

    static hasMany = [topics: Topic,subscriptions: Subscription, resources: Resourcedetail, resourceRatings: ResourceRating, readingItems: ReadingItem]



}
