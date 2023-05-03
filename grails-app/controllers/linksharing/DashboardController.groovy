package linksharing

import Enum.VisibilityEnum

//import Enum.VisibilityEnum

class DashboardController {

    def index() {

        //Userdetail user = Userdetail.findById(session.LOGGED_IN_USER_ID)

        render(view:"dashboard")

    }

    def createTopic(){

        Topic topic = new Topic();
        topic.name = params.topicName;
        topic.createdBy = Userdetail.findById(session.LOGGED_IN_USER_ID)
        //topic.visibility = VisibilityEnum.PUBLIC
      //  topic.visibility = VisibilityEnum.PRIVATE

        if(params.visibility == "public")
            topic.visibility = VisibilityEnum.PUBLIC
        else
            topic.visibility = VisibilityEnum.PRIVATE

        redirect(url:"/dashboard")

        //render topic.validate()
    }



}


