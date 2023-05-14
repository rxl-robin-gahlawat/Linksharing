package linksharing

import grails.gorm.transactions.Transactional

@Transactional
class ProfileService {

    def serviceMethod() {

    }

    int generateRandomNumber(){
        return Math.round(Math.random() * 1e6)
    }

    Userdetail getUser(Long userId){
        Userdetail user;
        try{
            user = Userdetail.findById(userId)
        }
        catch (Exception err){
            //return "Error in fetching user"
        }
        return user
    }

    boolean updatePassword(Long userId, String password){
        try{
            Userdetail usr = Userdetail.get(userId)
            usr.password = password
            return true
        }
        catch (Exception err){
            return false
        }
    }

    boolean updateUserDetails(Long userId, Map params){
        try{
            Userdetail usr = Userdetail.get(userId)
            if(params.firstname.trim())
                usr.firstName = params.firstname
            if(params.lastname.trim())
                usr.lastName = params.lastname
            if(params.username.trim())
                usr.username = params.username

            try{
                if(params.photo){
                    def multipartFile = params.photo
                    def photoExtension = multipartFile.getOriginalFilename().tokenize('.')[-1]
                    def bytes = multipartFile.getBytes()
                    int num = generateRandomNumber()
                    def url = "grails-app/assets/images/profilePicture/${num}.${photoExtension}"
                    def newFile = new File("${url}")
                    newFile.createNewFile()
                    newFile.append(bytes)


                    usr.photo = url
                }

            }
            catch (Exception e){
            }

            return true
        }
        catch (Exception err){
            return false
        }
    }



}
