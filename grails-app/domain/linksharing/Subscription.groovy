package linksharing

import Enum.SeriousnessEnum

class Subscription {


    Userdetail user
    Topic topic
    SeriousnessEnum seriousness
    Date dateCreated
    Date lastUpdated

    static belongsTo = [user: Userdetail, topic: Topic]

    static constraints = {
        seriousness nullable: false, blank:false
    }
}
