package linksharing

import grails.gorm.transactions.Transactional

@Transactional
class LoginService {

    def serviceMethod() {

    }

    def checkUserExistence(String userInput){
        
        if(userInput.contains("@")){
            Userdetail userByEmail = Userdetail.findByEmail(userInput)
            return userByEmail
        }

        Userdetail userByUsername = Userdetail.findByUsername(userInput)
        return userByUsername

    }
}
