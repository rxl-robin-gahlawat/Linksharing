package linksharing

import grails.gorm.transactions.Transactional

@Transactional
class AdminPostService {

    def serviceMethod() {

    }

    List allPosts(){

        try{
            List postList = Resourcedetail.createCriteria().list {}
            return postList
        }
        catch (Exception e){
            return []
        }



    }
}
