package linksharing

class LoginController {

    //static defaultAction = "loginUser"

    def index() {

        //render "your are logged in"
        render(view: "/register/index")

      //  redirect(url:"/dashboard")
    }

    def loginUser(){
        // find username/email in

        String userInput = params.email
        if(userInput.contains("@")){
            Userdetail userByEmail = Userdetail.findByEmail(userInput)


        }
        else{
            Userdetail userByUsername = Userdetail.findByUser(userInput)

        }






        //   Userdetail.find()


        render user.firstName
    }

}
