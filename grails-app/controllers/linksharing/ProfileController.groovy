package linksharing

class ProfileController {

    def ProfileService
    def FindUserSubscriptionAndTopicsService
    def AdminService

    def TopicService

    def index() {
        render "this is profile controller"
    }


    def edit(){

        Userdetail user = ProfileService.getUser(session.LOGGED_IN_USER_ID)

        def subsAndTopicCountMap = FindUserSubscriptionAndTopicsService.findUserSubscriptionAndTopics(user)
        List topicList = ProfileService.userTopicList(user)

        Map loadMap = ["user": user,"subsMap":subsAndTopicCountMap, "topicList": topicList]
        render (view: "edit_profile",model: loadMap)
    }

    def user(){

        Long userID = session.LOGGED_IN_USER_ID
        Userdetail user = AdminService.getUser(userID)

        def subsAndTopicCountMap = FindUserSubscriptionAndTopicsService.findUserSubscriptionAndTopics(user)
        def userPostList = ProfileService.userPostList(user)

        Map userInfo = ["user":user, "subsMap":subsAndTopicCountMap]
        List userInfoList = []
        userInfoList.add(userInfo)

        List userTopicList = ProfileService.userTopicList(user)
        List userSubscriptionList = ProfileService.userSubscriptionList(user)




        Map loadMap = ["user": user,"subsInfoList": userInfoList, "postList": userPostList, "trendingTopicList":userTopicList,"subscribedTopicList":userSubscriptionList]
        render (view: "user_profile",model: loadMap)

    }


    def updatePassword(){
        if(params.password != params.confirmpassword){
            flash.failMessage = "Password and Confirm Password mismatch"
            redirect(controller: "profile",action:"edit" ,model: [msg:flash.failMessage])
        }
        else if(params.password.trim().length() > 30){
            flash.failMessage = "Password length should be less than 30"
            redirect(controller: "profile",action:"edit" ,model: [msg:flash.failMessage])
        }
         else if(params.password.trim()==""){
            flash.failMessage = "Blank Password not allowed"
            redirect(controller: "profile",action:"edit" ,model: [msg:flash.failMessage])
        }
        else{
            boolean result = ProfileService.updatePassword(session.LOGGED_IN_USER_ID, params.password)
            if(result){
                flash.successMessage = "Password Updated"
                redirect(controller: "profile",action:"edit" ,model: [msg:flash.successMessage])
            }
            else{
                flash.failMessage = "Couldn't update password"
                redirect(controller: "profile",action:"edit" ,model: [msg:flash.failMessage])
            }
        }
    }

    int checkUniqueUsername(String username){
        return Userdetail.countByUsername(username)
    }


    def updateUserDetails(){

        int countUsername = checkUniqueUsername(params.username.trim())

        if(countUsername == 0){
            boolean result = ProfileService.updateUserDetails(session.LOGGED_IN_USER_ID, params)
            if(result){
                flash.successMessage = "User Details Updated"
                redirect(controller: "profile",action:"edit" ,model: [msg:flash.successMessage])
            }
            else{

            }
        }
        else{
            flash.failMessage = "Username already exists"
            redirect(controller: "profile",action:"edit" ,model: [msg:flash.failMessage])
        }

    }





}
