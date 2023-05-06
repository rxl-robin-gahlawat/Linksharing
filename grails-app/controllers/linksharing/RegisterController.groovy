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

        /* this is for trying to send messages to frontend
        Userdetail user = new Userdetail();
        user.email = params.email
        user.username = params.username
        user.firstName = params.firstname
        user.lastName = params.lastname
        user.password = params.password
        //user.validate()
        if(user.hasErrors()){
            def command;
            user.errors.allErrors.each{
                println it
                command.errors = + command.error + it
            }

        }
        else{
            println "everything good"
        }
        render command.errors

         */


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
