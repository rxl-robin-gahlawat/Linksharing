package linksharing

import Enum.SeriousnessEnum
import Enum.VisibilityEnum
import grails.gorm.transactions.Transactional

// imports for mail sender
import org.springframework.mail.MailSender
import org.springframework.mail.SimpleMailMessage
import org.springframework.mail.javamail.MimeMessageHelper

import javax.mail.internet.MimeMessage
import java.security.SecureRandom
import java.util.Random

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

    String randomPasswordGenerator(){

        String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789@!#%^&*"
        int PASSWORD_LENGTH = 10

        Random random = new SecureRandom();
        StringBuilder password = new StringBuilder();

        for (int i = 0; i < PASSWORD_LENGTH; i++) {
            int randomIndex = random.nextInt(CHARACTERS.length());
            char randomChar = CHARACTERS.charAt(randomIndex);
            password.append(randomChar);
        }

        return password.toString();

    }

    String sendForgotPasswordEmail(String email){


        Userdetail usr = Userdetail.findByEmail(email)
        if(!usr){
            return "User doesn't exist in database."
        }

        try{
            String subject = "Default password for your Linksharing account"
            String defaultPassword = randomPasswordGenerator()
            String mailText = "Your default Login password is : ${defaultPassword}. Please update your password as soon as you login."

            def msg = new SimpleMailMessage();
            msg.setFrom("ankitmishra0402@outlook.com")
            msg.setTo(email)
            msg.setSubject(subject)
            msg.setText(mailText)
            mailSender.send(msg)

            Userdetail user = Userdetail.findByEmail(email)
            user.password = defaultPassword
            user.save(flush:true, failOnError:true)
            return "SUCCESS"
        }
        catch (Exception  e){
            return "Error in sending mail. Please enter your email id carefully."
        }


    }

    def sendInviteMail(String subject, String message, String email){

        try{
            def msg = new SimpleMailMessage();
            msg.setFrom("ankitmishra0402@outlook.com")
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

    List allTopicsAlphabeticalOrder(){


        List reqList = Subscription.createCriteria().listDistinct{
            topic{
                order("name")
            }
        }


        List topicList = []
        int i = 0;
        reqList.each{it->
            Map result = [:]
            int subsCount = Subscription.countByTopic(it.topic)
            int postCount = Resourcedetail.countByTopic(it.topic)
            result.put("subID", it.id)
            result.put("user",it.user)
            result.put("topic",it.topic)
            result.put("seriousness",it.seriousness)
            result.put("subsCount",subsCount)
            result.put("postCount",postCount)
            topicList.add(result)
        }

        return topicList;


    }

}
