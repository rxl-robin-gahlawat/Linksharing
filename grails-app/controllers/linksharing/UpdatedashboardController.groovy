package linksharing

class UpdatedashboardController {

    def UpdatedashboardService

    def index() { }

    def updateSubscriptionsSeriousness(){
        boolean result = UpdatedashboardService.updateSeriousness(params)
        render result
    }
}
