package linksharing

import grails.gorm.transactions.Transactional

@Transactional
class FindUserSubscriptionAndTopicsService {

    def serviceMethod() {

    }

    Map findUserSubscriptionAndTopics(Userdetail user){

        try{

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
        catch (Exception e){

            Map result = [:]
            result.put("subsCount", 0)
            result.put("topicsCount", 0)

            return result

        }



    }

}
