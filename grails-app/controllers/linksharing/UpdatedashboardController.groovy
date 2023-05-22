package linksharing

class UpdatedashboardController {

    def UpdatedashboardService
    def AdminService
    def PostService

    def index() {
        render "you can update dashboard from this API"
    }

    def updateSubscriptionsSeriousness(){
        boolean result = UpdatedashboardService.updateSeriousness(params)
        render result
    }

    def updateSubscriptionsVisibility(){
        boolean result = UpdatedashboardService.updateVisibility(params)
        render result
    }

    def updateSubscriptionsTopicName(){
        boolean result = UpdatedashboardService.updateTopicName(params)
        render result
    }

    def deleteTopic(){
        boolean result = UpdatedashboardService.deleteTopic(params)
        render result
    }

    def subscribeTopic(){
        boolean result = UpdatedashboardService.subscribeTopic(params, session.LOGGED_IN_USER_ID)
        if(result)
            redirect(url:"/dashboard")
        else
            render "Error in Subscribing topic"
    }

    def unsubscribeTopic(){
        boolean result = UpdatedashboardService.unsubscribeTopic(params, session.LOGGED_IN_USER_ID)
        if(result)
            redirect(url:"/dashboard")
        else
            render "Error in Subscribing topic"
    }

    def markAsRead(){
        Long userID = session.LOGGED_IN_USER_ID
        Userdetail user = AdminService.getUser(userID)
        Resourcedetail resource = PostService.getResource(Long.parseLong(params.resourceId))

        boolean result = UpdatedashboardService.markAsRead(user, resource)
        if(result){
            flash.successMessage = "Resource Read"
            redirect(controller: "dashboard",model: [msg:flash.successMessage])
        }
        else{
            flash.failMessage = "Error in marking resource as read"
            redirect(controller: "dashboard",model: [msg:flash.failMessage])
        }

        render params
    }


    def viewAll(){

        Long userID = session.LOGGED_IN_USER_ID
        Userdetail user = AdminService.getUser(userID)

        List topicList = UpdatedashboardService.allTopicsAlphabeticalOrder()

        Map loadMap = ["user": user, "trendingTopicList":topicList]
        render(view:"view_all", model: loadMap)

    }



}
