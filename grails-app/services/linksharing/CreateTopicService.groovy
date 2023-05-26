package linksharing

import Enum.SeriousnessEnum
import Enum.VisibilityEnum
import grails.gorm.transactions.Transactional

@Transactional
class CreateTopicService {

    def serviceMethod() {

    }

    boolean topicValidator(Topic topic, Userdetail user){

        if(!topic.validate()){
            return false
        }

        // change below def to List<String>
        List allTopicNamesByUser = Topic.createCriteria().list{
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

    void subscribeTopicCreator(Topic topic, Userdetail user){

        try{
            Subscription sub = new Subscription();
            sub.user = user;
            sub.topic = topic;
            sub.seriousness = SeriousnessEnum.VERY_SERIOUS
            sub.save(flush: true, failOnError:true)

        }
        catch (Exception e){
            println e
        }

    }

    boolean createTopic(Map params, Long USER_ID){

        try{

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
                subscribeTopicCreator(topic,user)
                return true
            }
            return false

        }
        catch (Exception e){
            return false
        }




    }


}
