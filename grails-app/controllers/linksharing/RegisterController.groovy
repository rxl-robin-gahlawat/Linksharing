package linksharing

class RegisterController {


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

    def checkUniqueEmail(){
        boolean result = RegisterService.checkUniqueEmail(params)
        render result
    }


    def checkUniqueUsername(){
        boolean result = RegisterService.checkUniqueUsername(params)
        render result
    }



}
