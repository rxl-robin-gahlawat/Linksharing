package linksharing

import grails.gorm.transactions.Transactional

@Transactional
class RegisterService {

    def serviceMethod() {

    }

    def registerUser(Map params){

        Userdetail user = new Userdetail();
        user.email = params.email
        user.username = params.username
        user.firstName = params.firstname
        user.lastName = params.lastname
        user.password = params.password

        try{
            if(params.photo){
                def multipartFile = params.photo
                def photoExtension = multipartFile.getOriginalFilename().tokenize('.')[-1]
                def bytes = multipartFile.getBytes()
                def url = "grails-app/assets/images/profilePicture/${params.username}.${photoExtension}"
                def newFile = new File("${url}")
                newFile.createNewFile()
                newFile.append(bytes)
                user.photo = url
            }

        }
        catch (Exception e){
            def url = "grails-app/assets/images/profilePicture/default.png"
            user.photo = url

        }

        if(!user.validate()){
            return false;
        }
        else{
            user.save(flush: true, failOnError: true)
            return true
        }




    }
}
