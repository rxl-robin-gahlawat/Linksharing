package linksharing

import grails.converters.JSON
import oracle.jdbc.proxy.annotation.Post

class PostController {

    def AdminService
    def PostService
    def TrendingTopicsService


    def index() {

        Long userID = session.LOGGED_IN_USER_ID
        Userdetail user = AdminService.getUser(userID)

        Resourcedetail resource = PostService.getResource(Long.parseLong(params.postId))
        String resourceRating = PostService.getResourceRating(user,resource)
        List trendingTopicList = TrendingTopicsService.trendingTopicsList(user)
        Long postRatingCount = PostService.getPostRaters(resource)
        def avgPostRating = PostService.getAvgPostRating(resource)
        boolean isSubscribed = PostService.isSubscribedToTopic(user, resource.topic)


        Map loadMap = ["user": user, "resource":resource, "resourceRating": resourceRating, "trendingTopicList": trendingTopicList, "postRatingCount": postRatingCount, "avgPostRating": avgPostRating, "isSubscribed":isSubscribed]
        render(view:"post", model: loadMap)

    }

    def rating(){

        Long userID = session.LOGGED_IN_USER_ID
        Userdetail user = AdminService.getUser(userID)
        Resourcedetail resource = PostService.getResource(Long.parseLong(params.postId))

        def res = PostService.rating(user, resource, Integer.parseInt(params.rating))

        Long postRatingCount = PostService.getPostRaters(resource)
        def avgPostRating = PostService.getAvgPostRating(resource)
        List rating = [postRatingCount, avgPostRating]

        render rating as JSON
    }

    def deletePost(){

        def result = PostService.deletePost(params)

        if(result){
            flash.successMessage = "Post Deleted Successfully"
            redirect(controller: "dashboard",model: [msg:flash.successMessage])
        }
        else {
            flash.failMessage = "Error in deleting post"
            redirect(controller: "dashboard" ,model: [msg:flash.failMessage])
        }

    }

    def editLinkResource(){

        println params

        if(params.resourceLink.trim() == '' && params.resourceDescription.trim() == ''){
            flash.failMessage = "Please enter valid data"
            redirect(controller: "post", params:[postId:params.postId] ,model: [msg:flash.failMessage])
        }
        else{
            String result = PostService.editLinkResource(params)

            if(result == "SUCCESS"){
                flash.successMessage = "Post Edited Successfully"
                redirect(controller: "post", params:[postId:params.postId] ,model: [msg:flash.successMessage])
            }
            else {
                flash.failMessage = result
                redirect(controller: "post", params:[postId:params.postId] ,model: [msg:flash.failMessage])
            }
        }

    }

    def editDocumentResource(){

        println params

        if(params.resourceDoc.isEmpty() == true && params.resourceDescription.trim() == ''){
            flash.failMessage = "Please enter valid data"
            redirect(controller: "post", params:[postId:params.postId] ,model: [msg:flash.failMessage])
        }

        else{
            String result = PostService.editDocumentResource(params)

            if(result == "SUCCESS"){
                flash.successMessage = "Post Edited Successfully"
                redirect(controller: "post", params:[postId:params.postId] ,model: [msg:flash.successMessage])
            }
            else {
                flash.failMessage = result
                redirect(controller: "post", params:[postId:params.postId] ,model: [msg:flash.failMessage])
            }
        }



    }





}
