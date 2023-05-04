package linksharing

import Enum.VisibilityEnum

class Topic {

    String name
    Userdetail createdBy
    VisibilityEnum visibility
    Date dateCreated
    Date lastUpdated

    static belongsTo = [createdBy: Userdetail]

    static hasMany = [subscriptions : Subscription, resources : Resourcedetail]

// must write an constraint for name, it shouldn't be nullable.
    static constraints = {
        name nullable: false, blank: false
    }
}
