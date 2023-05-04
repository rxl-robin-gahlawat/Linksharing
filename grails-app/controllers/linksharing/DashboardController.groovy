package linksharing

import Enum.VisibilityEnum




class DashboardController {

    def CreateTopicService

    def index() {

        //Userdetail user = Userdetail.findById(session.LOGGED_IN_USER_ID)

        render(view:"dashboard")

    }

    def createTopic(){

        boolean isTopicCreated = CreateTopicService.createTopic(params, session.LOGGED_IN_USER_ID)
        if(isTopicCreated)
            redirect(url:"/dashboard")
        else
            render "Topic Validation Error"

    // To do : add data in subscription table.

    }



}


