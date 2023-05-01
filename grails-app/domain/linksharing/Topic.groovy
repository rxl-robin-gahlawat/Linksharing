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


    static constraints = {
    }
}
