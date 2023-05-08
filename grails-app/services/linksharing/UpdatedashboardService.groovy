package linksharing

import Enum.SeriousnessEnum
import Enum.VisibilityEnum
import grails.gorm.transactions.Transactional

@Transactional
class UpdatedashboardService {

    def serviceMethod() {

    }

    boolean updateSeriousness(Map params){

        try{
            Subscription sub = Subscription.get(params.subid)
            if(params.seriousness == 'CASUAL')
                sub.seriousness = SeriousnessEnum.CASUAL
            else if(params.seriousness == 'SERIOUS')
                sub.seriousness = SeriousnessEnum.SERIOUS
            else
                sub.seriousness = SeriousnessEnum.VERY_SERIOUS

            return true
        }
        catch(Exception e){
            return false
        }
    }


    boolean updateVisibility(Map params){

        try{
            Topic topic = Topic.get(params.topicid)
            if(params.visibility == 'PRIVATE')
                topic.visibility = VisibilityEnum.PRIVATE
            else
                topic.visibility = VisibilityEnum.PUBLIC

            return true
        }
        catch(Exception e){
            return false
        }
    }

    boolean updateTopicName(Map params){
        try{
            Topic topic = Topic.get(params.topicid)
            topic.name = params.topicname
            return true
        }
        catch(Exception e){
            return false
        }

    }

    boolean deleteTopic(Map params){
        try{
            Topic topic = Topic.findById(params.topicid)
            topic.delete()
            return true
        }
        catch(Exception e){
            return false
        }

    }

}
