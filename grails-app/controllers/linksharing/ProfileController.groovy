package linksharing

class ProfileController {

    def ProfileService
    def FindUserSubscriptionAndTopicsService

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
        render "this is user profile"
    }




    def updatePassword(){
        if(params.password != params.confirmpassword){
            flash.failMessage = "Password and Confirm Password mismatch"
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
