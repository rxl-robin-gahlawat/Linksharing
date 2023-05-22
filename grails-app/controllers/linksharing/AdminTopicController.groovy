package linksharing

class AdminTopicController {


    def AdminService
    def AdminTopicService
    def UpdatedashboardService

    def index() {


        Long userID = session.LOGGED_IN_USER_ID
        Userdetail user = AdminService.getUser(userID)

        List topicList = AdminTopicService.allTopics()


        Map loadMap = ["user": user, "topicList":topicList]
        render(view:"admin_topic", model: loadMap)

    }

    def deleteTopic(){
        boolean result = UpdatedashboardService.deleteTopic(params)

        if(result){
            println "true"
            flash.successMessage = "Topic Deleted Successfully"
            redirect(controller: "adminTopic", model: [msg:flash.successMessage])
        }
        else{
            println "false"
            flash.failMessage = "Error in deleting topic"
            redirect(controller: "adminTopic", model: [msg:flash.failMessage])
        }

    }




}
