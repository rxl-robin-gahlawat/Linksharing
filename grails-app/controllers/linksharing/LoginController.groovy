package linksharing

import org.springframework.jdbc.datasource.init.ResourceDatabasePopulator

class LoginController {


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
        Userdetail user = LoginService.userCredentialsValidation(userInput, params.password)

        if(!user){
            flash.message = "Either Username or Password is Incorrect. Please Try Again!"
            redirect(controller: "login" ,model: [msg:flash.message])
        }
        else{
            if(user.active==false){
                flash.message = "You Can't Login as Admin has Deactivated your profile."
                redirect(controller: "login" ,model: [msg:flash.message])
            }

            else{
                session.LOGGED_IN_USER_ID = user.id
                render session
                redirect(url:"/dashboard")
            }

        }

    }

}
