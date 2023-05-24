package linksharing

import Enum.VisibilityEnum
import grails.converters.JSON

class DashboardController {

    def CreateTopicService
    def CreateLinkResourceService
    def CreateDocumentResourceService
    def FindUserSubscriptionAndTopicsService
    def SubscriptionListService
    def TrendingTopicsService
    def AdminService
    def UpdatedashboardService

    def index() {

        Long userID = session.LOGGED_IN_USER_ID
        Userdetail user = AdminService.getUser(userID)


        def subsAndTopicCountMap = FindUserSubscriptionAndTopicsService.findUserSubscriptionAndTopics(user)
        List subscribedTopicList = SubscriptionListService.subscriptionList(user)
        List trendingTopicList = TrendingTopicsService.trendingTopicsList(user)
        List inboxResourceList = CreateLinkResourceService.loadInboxList(userID)

        Map userInfo = ["user":user, "subsMap":subsAndTopicCountMap]
        List userInfoList = []
        userInfoList.add(userInfo)

        Map loadMap = ["user": user,"subsInfoList": userInfoList, "subscribedTopicList": subscribedTopicList, "trendingTopicList": trendingTopicList, "inboxResourceList":inboxResourceList]

        render(view:"dashboard", model: loadMap)

    }

    def createTopic(){

        boolean isTopicCreated = CreateTopicService.createTopic(params, session.LOGGED_IN_USER_ID)
        if(isTopicCreated)
            redirect(url:"/dashboard")
        else
            render "Topic Validation Error"

    }

    def createLinkResource(){

        try{
            CreateLinkResourceService.createLinkResource(params,session.LOGGED_IN_USER_ID)
            flash.successMessage = "Link Resource Added"
            redirect(controller: "dashboard", model: [msg:flash.successsMessage])

        }
        catch(Exception e){
            flash.failMessage = "Error in adding resource"
            redirect(controller: "dashboard", model: [msg:flash.failMessage])
        }
    }

    def createDocumentResource(){
        try{
            CreateDocumentResourceService.createDocumentResource(params,session.LOGGED_IN_USER_ID)
            flash.successMessage = "Document Resource Added"
            redirect(controller: "dashboard", model: [msg:flash.successsMessage])

        }
        catch(Exception e){
            flash.failMessage = "Error in adding resource"
            redirect(controller: "dashboard", model: [msg:flash.failMessage])
        }

    }

    def sendInvitation(){
        Long userID = session.LOGGED_IN_USER_ID
        Userdetail user = AdminService.getUser(userID)

        String subject = "${user.firstName} invited you to join a topic."
        String link = "http://localhost:9090/dashboard/invited?topicId=${params.invitationTopic}"
        String message = "Here's the topic link\n ${link} "
        String email = params.inviteEmail

        boolean result = UpdatedashboardService.sendInviteMail(subject, message, email)

        if(result){
            flash.successMessage = "Invitation Sent"
            redirect(controller: "dashboard",model: [msg:flash.successMessage])
        }
        else{
            flash.failMessage = "Error in sending Invitation"
            redirect(controller: "dashboard",model: [msg:flash.failMessage])
        }

    }

    def sendSubInvitation(){
        render params
    }

    def loadSubscribedTopics(){

        // do below in a service.

        Long userID = session.LOGGED_IN_USER_ID
        Userdetail user = AdminService.getUser(userID)

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

    def invited(){

        Long userID = session.LOGGED_IN_USER_ID
        Userdetail user = AdminService.getUser(userID)

        boolean result = UpdatedashboardService.subscribeInvitedTopic(user, Long.parseLong(params.topicId))

        if(result){
            flash.successMessage = "You have been subscribed to topic"
            redirect(controller: "dashboard",model: [msg:flash.successMessage])
        }
        else{
            flash.failMessage = "Couldn't subscribe to topic"
            redirect(controller: "dashboard",model: [msg:flash.failMessage])
        }


    }





}


