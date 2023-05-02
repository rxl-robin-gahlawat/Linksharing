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

        /* Validation Rules:
            Make sure username doesn't have @
         */

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
