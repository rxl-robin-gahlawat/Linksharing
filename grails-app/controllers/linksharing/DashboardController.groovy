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

        boolean isSuccessful =  CreateLinkResourceService.createLinkResource(params,session.LOGGED_IN_USER_ID)
        if(isSuccessful)
            redirect(url:"/dashboard")
        else
            render "couldn't add link resource"

    }

    def createDocumentResource(){
        boolean isSuccessful = CreateDocumentResourceService.createDocumentResource(params,session.LOGGED_IN_USER_ID)
        if(isSuccessful)
            redirect(url:"/dashboard")
        else
            render "couldn't add document resource"
    }

    def loadSubscribedTopics(){

        // there is an issue here, this also select topics which are private, to solve
        // this, need to change below query(but should subscribed privated topics be allowed
        // to add new resources by anyone other than creator of topic?

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


