package linksharing

class RegisterController {

    //static defaultAction = "register"

    def RegisterService


    def index() {
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


        /*
        Userdetail user = new Userdetail();
        user.email = params.email
        user.username = params.username
        user.firstName = params.firstname
        user.lastName = params.lastname
        user.password = params.password

        if(!(user.validate())){
            // write code for showing message on frontend

        }


        user.save(flush: true, failOnError: true)


         */

      //  redirect(url:"/login")


    }

}
