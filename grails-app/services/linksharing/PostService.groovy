package linksharing

import grails.gorm.transactions.Transactional

@Transactional
class PostService {

    def serviceMethod() {

    }

    Resourcedetail getResource(Long resourceId){
        return Resourcedetail.findById(resourceId)
    }

    String getResourceRating(Userdetail user, Resourcedetail resource){

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

    def rating(Userdetail user, Resourcedetail resource, Integer score){

        ResourceRating userRating = ResourceRating.createCriteria().get {
            eq("user", user)
            eq("resource", resource)
        }
        if(userRating){
            userRating.score = score
        }
        else{
            println "no rating exist"
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
