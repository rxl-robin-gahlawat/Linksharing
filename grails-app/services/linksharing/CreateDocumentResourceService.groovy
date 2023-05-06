package linksharing

import grails.gorm.transactions.Transactional

@Transactional
class CreateDocumentResourceService {

    def serviceMethod() {

    }

    int generateRandomNumber(){
        return Math.round(Math.random() * 1e6)
    }

    def createDocumentResource(Map params, Long userID){

//        Userdetail user = Userdetail.findById(userID)
//
//        LinkResource linkResource = new LinkResource()
//        linkResource.topic = Topic.findById(Integer.parseInt(params.availableTopic))
//        linkResource.createdBy = user
//        linkResource.description = params.resourceDescription
//        linkResource.url = params.resourceLink
//        if (linkResource.validate()){
//            linkResource.save(flush:true, failOnError: true)
//            return true;
//        }
//        return false;


//        if(params.photo){
//            def multipartFile = params.photo
//            def photoExtension = multipartFile.getOriginalFilename().tokenize('.')[-1]
//            def bytes = multipartFile.getBytes()
//            def url = "grails-app/assets/images/profilePicture/${params.username}.${photoExtension}"
//            def newFile = new File("${url}")
//            newFile.createNewFile()
//            newFile.append(bytes)
//            params.photo = url
//            user.photo = params.photo
//        }

        Userdetail user = Userdetail.findById(userID)
        DocumentResource docResource = new DocumentResource()
        docResource.topic = Topic.findById(Integer.parseInt(params.availableTopicDoc))
        docResource.createdBy = user
        docResource.description = params.resourceDescription

        if(params.resourceDocument){
            def multipartFile = params.resourceDocument
            def docExtension = multipartFile.getOriginalFilename().tokenize('.')[-1]
            def bytes = multipartFile.getBytes()
            int num = generateRandomNumber()
            def url = "grails-app/assets/images/docResource/${num}.${docExtension}"
            def newFile = new File("${url}")
            newFile.createNewFile()
            newFile.append(bytes)
            docResource.filePath = url
        }

        if (docResource.validate()){
            docResource.save(flush:true, failOnError: true)
            return true;
        }
        return false;


    }

}
