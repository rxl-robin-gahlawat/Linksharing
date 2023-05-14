package linksharing

class AdminController {

    def AdminService

    def index() {
        render "hello world"
    }

    def users() {

        Userdetail user = AdminService.getUser(session.LOGGED_IN_USER_ID)
        List userList = AdminService.users()



        Map loadMap = ["user": user, "userList": userList]
        render (view: "users",model: loadMap)
    }

    def userActivation(){
        AdminService.userActivation(params.userId)
        render "done"
    }

}
