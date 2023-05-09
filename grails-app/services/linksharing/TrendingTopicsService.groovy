package linksharing

import grails.gorm.transactions.Transactional

@Transactional
class TrendingTopicsService {

    def serviceMethod() {

    }

    List trendingTopicsList(){

        List subscriptionList = Subscription.createCriteria().list{
            eq("user",user)
            maxResults 5
        }

    }

}
