package linksharing

class LoginController {

    //static defaultAction = "loginUser"

    def LoginService

    def index() {

        //render "your are logged in"
        render(view: "/register/index")

      //  redirect(url:"/dashboard")
    }

    def loginUser(){

        String userInput = params.email
        Userdetail user = LoginService.checkUserExistence(userInput)
        if(!user){
            render "user doesn't exist"
        }
        else{
            //render user.firstName
            redirect(url:"/dashboard")
        }

    }

}
