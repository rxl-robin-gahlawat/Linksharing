package linksharing

class RegisterController {

    //static defaultAction = "register"

    def RegisterService


    def index() {
        if(session.LOGGED_IN_USER_ID) {
            redirect(url: "/dashboard")
            return
        }
        render (view : "index")
    }

    def registerUser(){



        boolean isRegistered = RegisterService.registerUser(params)
        if(isRegistered){
            redirect(url: "/login")
            // show message and after clicking ok on msg redirect.
        }
        else{
            render "validation error"
            // show error message
        }


    }

}
