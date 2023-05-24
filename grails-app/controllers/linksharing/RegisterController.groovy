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
            flash.successMessage = "User Registered Successfully"
            redirect(controller: "login",model: [msg:flash.successMessage])
        }
        else{
            render "validation error"
            flash.message = "Couldn't Register User"
            redirect(controller: "login",model: [msg:flash.message])
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
