package linksharing

class UpdatedashboardController {

    def UpdatedashboardService

    def index() { }

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

}
