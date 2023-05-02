package linksharing

class RegisterController {

    //static defaultAction = "register"


    def index() {
        render (view : "index")
    }

    def registerUser(){

        /* Validation Rules:
            Make sure username doesn't have @

         */

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
        redirect(url:"/login")

    }

}
