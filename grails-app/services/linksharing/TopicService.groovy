package linksharing

import grails.gorm.transactions.Transactional

import javax.annotation.Resource

@Transactional
class TopicService {

    def FindUserSubscriptionAndTopicsService

    def serviceMethod() {

    }

    Topic getTopic(Long topicId){
        try{
            return Topic.findById(topicId)
        }
        catch(Exception e){
            return new Topic()
        }
    }

    List getTopicSubscribersList(Topic topic){

        try{

            List topicSubscribers = Subscription.createCriteria().list{
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
        catch (Exception e){

            return []

        }

    }


    List getResultTopic(Userdetail user, Topic topic){

        try{


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
        catch (Exception e){
            return []
        }

    }


    List postList(Topic topic){

        try{
            List posts = Resourcedetail.createCriteria().list{
                eq("topic", topic)
            }
            return posts
        }
        catch (Exception e){
            return []

        }

    }



}

