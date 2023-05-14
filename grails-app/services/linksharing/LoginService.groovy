package linksharing

import grails.gorm.transactions.Transactional

@Transactional
class LoginService {

    def serviceMethod() {

    }

    def userCredentialsValidation(String userInput, password){

        def res = Userdetail.createCriteria().get{
            or{
                eq("email", userInput)
                eq("username",userInput)
            }
            eq("password", password)
        }

        return res

    }
}
