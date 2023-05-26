package linksharing

import grails.gorm.transactions.Transactional

@Transactional
class LoginService {

    def serviceMethod() {

    }

    Userdetail userCredentialsValidation(String userInput, password){

        try{
            def res = Userdetail.createCriteria().get{
                or{
                    eq("email", userInput)
                    eq("username",userInput)
                }
                eq("password", password)
            }

            return res
        }
        catch (Exception e){
            return new Userdetail()
        }



    }
}
