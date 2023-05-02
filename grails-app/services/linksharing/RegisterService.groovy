package linksharing

import grails.gorm.transactions.Transactional

@Transactional
class RegisterService {

    def serviceMethod() {

    }

    def registerUser(def params){

        Userdetail user = new Userdetail();
        user.email = params.email
        user.username = params.username
        user.firstName = params.firstname
        user.lastName = params.lastname
        user.password = params.password

        // make validator for checking password == confirm password

        if(!(user.validate())){

            return "Validation Error"

        }
        else{
            user.save(flush: true, failOnError: true)
            return "User saved successfully"
        }


    }
}
