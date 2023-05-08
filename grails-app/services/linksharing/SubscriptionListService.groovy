package linksharing

import grails.gorm.transactions.Transactional

@Transactional
class SubscriptionListService {

    def serviceMethod() {
    }

    List subscriptionList(Userdetail user){

        List subscriptionList = Subscription.findAllByUser(user)
        List subsList = []
        int i = 0;
        subscriptionList.each{it->
            Map result = [:]
            int subsCount = Subscription.countByTopic(it.topic)
            int postCount = Resourcedetail.countByTopic(it.topic)
            result.put("subID", it.id)
            result.put("user",it.user)
            result.put("topic",it.topic)
            result.put("seriousness",it.seriousness)
            result.put("subsCount",subsCount)
            result.put("postCount",postCount)
            subsList.add(result)
        }
        return subsList

    }

}
