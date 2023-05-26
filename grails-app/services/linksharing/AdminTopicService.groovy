package linksharing

import grails.gorm.transactions.Transactional

import java.nio.channels.ScatteringByteChannel

@Transactional
class AdminTopicService {

    def serviceMethod() {

    }

    List allTopics(){

        try{
            List topicList = Topic.createCriteria().list {}
            return topicList
        }
        catch (Exception e){
            return []
        }

    }

}
