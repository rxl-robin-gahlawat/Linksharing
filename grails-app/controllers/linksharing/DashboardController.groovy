package linksharing

import Enum.VisibilityEnum
import grails.converters.JSON


class DashboardController {

    def CreateTopicService
    def CreateLinkResourceService

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

    }

    def createLinkResource(){

        render CreateLinkResourceService.createLinkResource(params)

    }

    def loadSubscribedTopics(){

        // there is an issue here, this also select topics which are private

        Userdetail user = Userdetail.findById(session.LOGGED_IN_USER_ID)

        List result = Subscription.createCriteria().list{
            projections{
                topic{
                    property("name")
                }
            }
            eq("user",user)

        }

        Map m = [key:result]
        render m as JSON

    }



}


