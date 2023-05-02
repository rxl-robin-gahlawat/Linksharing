package linksharing

class LoginController {

    //static defaultAction = "loginUser"

    def LoginService

    def index() {

        if(session.LOGGED_IN_USER_ID) {
            redirect(url: "/dashboard")
            return
        }
        render(view: "/register/index")

    }

    def loginUser(){

        String userInput = params.email
        Userdetail user = LoginService.checkUserExistence(userInput)

        if(!user){
            render "user doesn't exist"
        }
        else{
            //render user.firstName
            //String st = user + "  ->  " + session
            session.LOGGED_IN_USER_ID = user.id
            render session
            redirect(url:"/dashboard")
        }

    }

}
