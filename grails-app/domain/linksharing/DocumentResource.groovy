package linksharing

class DocumentResource extends Resourcedetail{

    String filePath;

    static constraints = {
        filePath nullable: false, blank: false
    }
}
