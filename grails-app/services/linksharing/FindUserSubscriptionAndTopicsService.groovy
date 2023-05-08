package linksharing

import grails.gorm.transactions.Transactional

@Transactional
class FindUserSubscriptionAndTopicsService {

    def serviceMethod() {

    }

    def findUserSubscriptionAndTopics(Userdetail user){

        Integer subsCount = Subscription.createCriteria().count{
            eq("user", user)
        }
        Integer topicsCount = Topic.createCriteria().count{
            eq("createdBy", user)
        }
        Map result = [:]
        result.put("subsCount", subsCount)
        result.put("topicsCount", topicsCount)

        return result

    }

}
