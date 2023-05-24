package linksharing

import grails.gorm.transactions.Transactional
import org.apache.catalina.User

@Transactional
class AdminService {

    def serviceMethod() {

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

    List users(){
        List userList = Userdetail.createCriteria().list{
            eq("admin", false)
            order("username", "desc")
        }
        return userList
    }

    def userActivation(def userId){
        Userdetail usr = Userdetail.get(Integer.parseInt(userId))
        if(usr.active)
            usr.active = false
        else
            usr.active = true

    }

}
