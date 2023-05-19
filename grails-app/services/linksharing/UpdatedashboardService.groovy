package linksharing

import Enum.SeriousnessEnum
import Enum.VisibilityEnum
import grails.gorm.transactions.Transactional

// imports for mail sender
import org.springframework.mail.MailSender
import org.springframework.mail.SimpleMailMessage

@Transactional
class UpdatedashboardService {

    MailSender mailSender

    def serviceMethod() {

    }


    boolean sendMail(){

            def msg = new SimpleMailMessage();
            msg.setFrom("robinlinksharing11@outlook.com")
            msg.setTo("gahlawatrobin30@gmail.com")
            msg.setSubject("Checking for mail service")
            msg.setText("hey, is this working???")
            mailSender.send(msg)
    }

    def sendInviteMail(String subject, String message, String email){

        try{
            def msg = new SimpleMailMessage();
            msg.setFrom("robinlinksharing11@outlook.com")
            msg.setTo(email)
            msg.setSubject(subject)
            msg.setText(message)
            mailSender.send(msg)
            return true
        }
        catch (Exception err){
            println err
            return false
        }

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

    boolean subscribeTopic(Map params, Long userID){
        try{

            Userdetail user = Userdetail.findById(userID)
            Topic topic = Topic.findById(params.topicID)
            Subscription sub = new Subscription();
            sub.user = user;
            sub.topic = topic;
            sub.seriousness = SeriousnessEnum.CASUAL
            sub.save(flush: true, failOnError:true)
            return true

        }
        catch (Exception e){
            return false
        }
    }


    boolean unsubscribeTopic(Map params, Long userID){
        try{

            Userdetail user = Userdetail.findById(userID)
            Topic topic = Topic.findById(params.topicID)
            def sub = Subscription.findByTopicAndUser(topic,user)
            sub.delete()
            return true

        }
        catch (Exception e){
            return false
        }
    }

    boolean markAsRead(Userdetail user, Resourcedetail resource){
        ReadingItem item = ReadingItem.createCriteria().get{
            eq("user", user)
            eq("resource", resource)
        }
        if(item){
            item.isRead = true
            return true
        }
        return false
    }

    boolean subscribeInvitedTopic(Userdetail user, Long topicId){

        Topic topic = Topic.findById(topicId)

        try{
            Subscription sub = new Subscription();
            sub.user = user;
            sub.topic = topic;
            sub.seriousness = SeriousnessEnum.CASUAL
            sub.save(flush: true, failOnError:true)
            return true
        }
        catch (Exception err){
            return false
        }
    }

}
