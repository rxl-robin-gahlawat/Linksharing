package linksharing

import org.springframework.jdbc.datasource.init.ResourceDatabasePopulator

class LoginController {

    //static defaultAction = "loginUser"

    def LoginService

    def index() {

        if(session.LOGGED_IN_USER_ID) {
            redirect(url: "/dashboard")
            return
        }

        //  def resultMap = ["mylist": r]

//        Map  loggedInMap = ["isLoggedIn" : "No"]
//
//        if(session.LOGGED_IN_USER_ID){
//            loggedInMap = ["isLoggedIn" : "Yes"]
//        }
//
//        loggedInMap = ["isLoggedIn" : "Yes"]
//
//        render(view: "/register/index", model: loggedInMap)


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
