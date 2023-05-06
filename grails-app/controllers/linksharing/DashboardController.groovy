package linksharing

import Enum.VisibilityEnum
import grails.converters.JSON


class DashboardController {

    def CreateTopicService
    def CreateLinkResourceService

    def index() {

        Userdetail user = Userdetail.findById(session.LOGGED_IN_USER_ID)
        Map userMap = ["userProfilePicturePath": user.photo.substring(25), "username": user.username]
        render(view:"dashboard", model: userMap)

    }

    def createTopic(){

        boolean isTopicCreated = CreateTopicService.createTopic(params, session.LOGGED_IN_USER_ID)
        if(isTopicCreated)
            redirect(url:"/dashboard")
        else
            render "Topic Validation Error"

    }

    def createLinkResource(){

        boolean isSuccessfull =  CreateLinkResourceService.createLinkResource(params,session.LOGGED_IN_USER_ID)
        if(isSuccessfull){
            redirect(url:"/dashboard")
        }
        else{
            render "couldn't add link resource"
        }
    }

    def loadSubscribedTopics(){

        // there is an issue here, this also select topics which are private

        Userdetail user = Userdetail.findById(session.LOGGED_IN_USER_ID)
        def result = Subscription.createCriteria().list{
            projections{
                topic{
                    property("id")
                    property("name")
                }
            }
            eq("user",user)

        }

        Map subscribersMap = [key:result]
        render subscribersMap as JSON

    }



}


