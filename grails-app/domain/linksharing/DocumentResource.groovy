package linksharing

class DocumentResource {

    Resourcedetail resource;
    String filePath;

    static constraints = {
        filePath nullable: false, blank: false
    }
}
