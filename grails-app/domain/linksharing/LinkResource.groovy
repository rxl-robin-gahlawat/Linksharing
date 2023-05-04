package linksharing

class LinkResource extends Resourcedetail{

    String url;

    static constraints = {
        url nullable: false, blank: false
    }
}
