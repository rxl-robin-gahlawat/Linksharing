package linksharing

import Enum.SeriousnessEnum

class Subscription {


    Userdetail user
    Topic topic
    SeriousnessEnum seriousnes
    Date dateCreated
    Date lastUpdated

    static belongsTo = [user: Userdetail, topic: Topic]

    static constraints = {
        seriousnes nullable: false, blank:false
    }
}
