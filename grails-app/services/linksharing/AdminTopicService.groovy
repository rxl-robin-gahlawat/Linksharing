package linksharing

import grails.gorm.transactions.Transactional

@Transactional
class AdminTopicService {

    def serviceMethod() {

    }

    List allTopics(){

        List topicList = Topic.createCriteria().list {}
        return topicList

    }

}
