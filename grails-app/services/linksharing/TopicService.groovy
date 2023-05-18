package linksharing

import grails.gorm.transactions.Transactional

import javax.annotation.Resource

@Transactional
class TopicService {

    def FindUserSubscriptionAndTopicsService

    def serviceMethod() {

    }

    def getTopic(Long topicId){
        try{
            return Topic.findById(topicId)
        }
        catch(Exception e){
            return new Topic()
        }
    }

    def getTopicSubscribersList(Topic topic){
        def topicSubscribers = Subscription.createCriteria().list{
            projections{
                property("user")
            }
            eq("topic", topic)
        }

        List subsInfoList = []
        topicSubscribers.each {user->
            Map userInfo = [:]
            Map subsAndTopicCountMap = FindUserSubscriptionAndTopicsService.findUserSubscriptionAndTopics(user)
            userInfo.put("user", user)
            userInfo.put("subsMap", subsAndTopicCountMap)
            subsInfoList.add(userInfo)
        }
        return subsInfoList
    }


    def getResultTopic(Userdetail user, Topic topic){

        def sub = Subscription.createCriteria().get {
            eq("user", user)
            eq("topic", topic)
        }

        if(sub){

            List subsList = []
            Map result = [:]
            int subsCount = Subscription.countByTopic(sub.topic)
            int postCount = Resourcedetail.countByTopic(sub.topic)
            result.put("subID", sub.id)
            result.put("user",topic.createdBy)
            result.put("topic",topic)
            result.put("seriousness",sub.seriousness)
            result.put("subsCount",subsCount)
            result.put("postCount",postCount)
            result.put("isSubscribed","Yes")


            subsList.add(result)
            return subsList
        }
        else{

            List subsList = []
            Map result = [:]
            int subsCount = Subscription.countByTopic(topic)
            int postCount = Resourcedetail.countByTopic(topic)
            result.put("subID", "No_need")
            result.put("user",topic.createdBy)
            result.put("topic",topic)
            result.put("seriousness","No_need")
            result.put("subsCount",subsCount)
            result.put("postCount",postCount)
            result.put("isSubscribed","No")

            subsList.add(result)
            return subsList

        }

    }


    List postList(Topic topic){

        List posts = Resourcedetail.createCriteria().list{
            eq("topic", topic)
        }
        return posts

//        posts.each{it->
//            println it.class
//            if(it.class as String == "class linksharing.LinkResource")
//                println it.url
//            println it.description
//
//
//        }

    }



}

