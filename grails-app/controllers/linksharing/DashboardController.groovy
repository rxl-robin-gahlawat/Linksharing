package linksharing

class DashboardController {

    def index() {

        //Userdetail user = Userdetail.findById(session.LOGGED_IN_USER_ID)
        render(view:"dashboard")

    }

}
