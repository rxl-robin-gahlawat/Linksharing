package linksharing

class AdminPostController {

    def AdminService
    def AdminPostService
    def PostService

    def index() {

        Long userID = session.LOGGED_IN_USER_ID
        Userdetail user = AdminService.getUser(userID)

        List postList = AdminPostService.allPosts()

        Map loadMap = ["user": user, "postList":postList]
        render(view:"admin_post", model: loadMap)

    }

    def deletePost(){

        def result = PostService.deletePost(params)

        if(result){
            flash.successMessage = "Post Deleted Successfully"
            redirect(controller: "adminPost",model: [msg:flash.successMessage])
        }
        else {
            flash.failMessage = "Error in deleting post"
            redirect(controller: "adminPost" ,model: [msg:flash.failMessage])
        }

    }



}
