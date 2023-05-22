package linksharing

import grails.gorm.transactions.Transactional

@Transactional
class AdminPostService {

    def serviceMethod() {

    }

    List allPosts(){

        List postList = Resourcedetail.createCriteria().list {}
        return postList

    }
}
