package linksharing

import grails.gorm.transactions.Transactional

@Transactional
class CreateLinkResourceService {

    def serviceMethod() {

    }

    boolean createLinkResource(Map params, Long userID){

        Userdetail user = Userdetail.findById(userID)

        LinkResource linkResource = new LinkResource()
        linkResource.topic = Topic.findById(Integer.parseInt(params.availableTopic))
        linkResource.createdBy = user
        linkResource.description = params.resourceDescription
        linkResource.url = params.resourceLink

        if (linkResource.validate()){
            linkResource.save(flush:true, failOnError: true)
            return true;
        }
        return false;

    }


}
