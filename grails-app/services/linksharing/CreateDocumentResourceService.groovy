package linksharing

import grails.gorm.transactions.Transactional

@Transactional
class CreateDocumentResourceService {

    def CreateLinkResourceService

    def serviceMethod() {

    }

    int generateRandomNumber(){
        return Math.round(Math.random() * 1e6)
    }

    def createDocumentResource(Map params, Long userID){

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
            def url = "grails-app/assets/document/${num}.${docExtension}"
            def newFile = new File("${url}")
            newFile.createNewFile()
            newFile.append(bytes)
            docResource.filePath = "/assets/${num}.${docExtension}"
        }

        if (docResource.validate()){
            try{
                docResource.save(flush:true, failOnError: true)
                CreateLinkResourceService.createReadingFlagForSubscribers(docResource.topic, docResource)

            }
            catch (Exception err ){
                println "Error in Adding Document Resource ---------------->" + err
                return false;
            }
            return true;
        }
        return false;


    }

}
