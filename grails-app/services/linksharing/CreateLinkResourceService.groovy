package linksharing

import grails.gorm.transactions.Transactional

@Transactional
class CreateLinkResourceService {

    def serviceMethod() {

    }

    List loadInboxList(Long userID){
        Userdetail user = Userdetail.findById(userID)

        List res = ReadingItem.createCriteria().list{
            eq("user", user)
            order("dateCreated", "desc")
        }
        return res

    }

    // sort them
    List loadTopicSubscribers(Topic topic){
        List topicSubscribers = Subscription.createCriteria().listDistinct{
            projections{
                property("user")
            }
            eq("topic", topic)
        }
        return topicSubscribers
    }

    boolean createReadingFlagForSubscribers(Topic topic, Resourcedetail resource){
        try{
            List topicSubscribers = loadTopicSubscribers(topic)
            topicSubscribers.each { it->
                ReadingItem readingItem = new ReadingItem();
                readingItem.user = it
                readingItem.resource = resource
                readingItem.isRead = false
                readingItem.save(flush:true, failOnError: true)
            }
        }
        catch (Exception err){
            println err
            return false
        }
        return true
    }

    boolean createLinkResource(Map params, Long userID){

        Userdetail user = Userdetail.findById(userID)

        LinkResource linkResource = new LinkResource()
        linkResource.topic = Topic.findById(Integer.parseInt(params.availableTopic))
        linkResource.createdBy = user
        linkResource.description = params.resourceDescription
        linkResource.url = params.resourceLink

        if (linkResource.validate()){
            try{
                linkResource.save(flush:true, failOnError: true)
                createReadingFlagForSubscribers(linkResource.topic, linkResource)
            }
            catch (Exception err){
                return false;
            }

            return true;
        }
        return false;

    }


}
