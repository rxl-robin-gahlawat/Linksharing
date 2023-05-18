package linksharing

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

        Map loadMap = ["user": user, "resource":resource, "resourceRating": resourceRating, "trendingTopicList": trendingTopicList, "postRatingCount": postRatingCount]
        render(view:"post", model: loadMap)

    }

    def rating(){

        Long userID = session.LOGGED_IN_USER_ID
        Userdetail user = AdminService.getUser(userID)
        Resourcedetail resource = PostService.getResource(Long.parseLong(params.postId))

        def res = PostService.rating(user, resource, Integer.parseInt(params.rating))

        render params
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

}
