package linksharing

import grails.gorm.transactions.Transactional

@Transactional
class PostService {

    def serviceMethod() {

    }

    boolean isSubscribedToTopic(Userdetail user, Topic topic){

        try{

            int count = Subscription.createCriteria().count{
                eq("user", user)
                eq("topic", topic)
            }
            if(count == 0)
                return false
            return true
        }
        catch (Exception e){
            return false
        }

    }

    String editLinkResource(Map params){

        try{
            String postId = params.postId
            String resourceLink = params.resourceLink.trim()
            String resourceDescription = params.resourceDescription.trim()

            Resourcedetail resource = Resourcedetail.findById(postId)
            if(resource){
                println resource.url
                if(resourceLink != '')
                    println "r1 : " + resourceLink
                resource.url = resourceLink
                if(resourceDescription != '')
                    resource.description = resourceDescription
                resource.save(flush:true)
                return "SUCCESS"
            }
            else{
                return "Error in finding resource"
            }
        }
        catch (Exception e){
            return "Error in editing link resource"
        }

    }

    int generateRandomNumber(){
        return Math.round(Math.random() * 1e6)
    }

    String editDocumentResource(Map params){

        try{
            String postId = params.postId
            String resourceDescription = params.resourceDescription.trim()

            Resourcedetail resource = Resourcedetail.findById(postId)
            if(resource){
                if(resourceDescription != '')
                    resource.description = resourceDescription

                if(params.resourceDoc.isEmpty() == false){
                    def multipartFile = params.resourceDoc
                    def docExtension = multipartFile.getOriginalFilename().tokenize('.')[-1]
                    def bytes = multipartFile.getBytes()
                    int num = generateRandomNumber()
                    def url = "grails-app/assets/document/${num}.${docExtension}"
                    def newFile = new File("${url}")
                    newFile.createNewFile()
                    newFile.append(bytes)
                    resource.filePath = "/assets/${num}.${docExtension}"
                }

                resource.save(flush:true)
                return "SUCCESS"
            }
            else{
                return "Error in finding user"
            }
        }
        catch (Exception e){
            return "Error in editing link resource"
        }

    }





    Resourcedetail getResource(Long resourceId){
        try{
            return Resourcedetail.findById(resourceId)
        }
        catch (Exception e){
            return new Resourcedetail()
        }
    }

    Long getPostRaters(Resourcedetail resource){
        try{
            def res = ResourceRating.createCriteria().count{
                eq("resource", resource)
            }
            return res
        }
        catch (Exception e){
            return 0
        }

    }

    def getAvgPostRating(Resourcedetail resource){
        def res = ResourceRating.createCriteria().get{
            projections{
                avg("score")
            }
            eq("resource", resource)
        }
        return res?:0.0
    }

    String getResourceRating(Userdetail user, Resourcedetail resource){

        try{
            ResourceRating userRating = ResourceRating.createCriteria().get {
                eq("user", user)
                eq("resource", resource)
            }
            if(userRating){
                return userRating.score as String
            }
            else{
                return "0"
            }

        }
        catch (Exception e){
            return "0"

        }

    }

    def rating(Userdetail user, Resourcedetail resource, Integer score){

        ResourceRating userRating = ResourceRating.createCriteria().get {
            eq("user", user)
            eq("resource", resource)
        }
        if(userRating){
            userRating.score = score
        }
        else{
            ResourceRating newRating = new ResourceRating();
            newRating.user = user
            newRating.resource = resource
            newRating.score = score

            try{
                newRating.save(flush: true, failOnError: true)
            }
            catch (Exception err){
                println "Error in Registering user ----------> " + err
                return false
            }

        }
        return true

    }

    boolean deletePost(Map params){
        try{
            Resourcedetail resource = Resourcedetail.findById(Long.parseLong(params.postId))
            resource.delete()
            return true
        }
        catch(Exception e){
            return false
        }
    }

}
