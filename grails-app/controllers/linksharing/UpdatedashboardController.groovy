package linksharing

class UpdatedashboardController {

    def UpdatedashboardService

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



}
