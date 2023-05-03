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



        String isRegistered = RegisterService.registerUser(params);

        if(isRegistered){
            // show message and after clicking ok on msg redirect.
        }
        else{
            // show error message
        }

        redirect(url: "/login")



    }

}
