package linksharing

import Enum.VisibilityEnum
import grails.gorm.transactions.Transactional

@Transactional
class CreateTopicService {

    def serviceMethod() {

    }

    def topicValidator(Topic topic, Userdetail user){

        if(!topic.validate()){
            return false
        }

        def allTopicNamesByUser = Topic.createCriteria().list{
            projections{
                property("name")
            }
            eq("createdBy", user)
        }

        if(allTopicNamesByUser.contains(topic.name)){
            return false;
        }
        return true;
    }

    def createTopic(def params, def USER_ID){

        Userdetail user = Userdetail.findById(USER_ID)

        Topic topic = new Topic();
        topic.name = params.topicName;
        topic.createdBy = user


        if(params.visibility == "public")
            topic.visibility = VisibilityEnum.PUBLIC
        else
            topic.visibility = VisibilityEnum.PRIVATE


        if(topicValidator(topic, user)){
            topic.save(flush:true, failOnError: true)
            return true
        }
        return false


    }


}
