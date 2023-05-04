package linksharing

class LinkResource {

    Resourcedetail resource;
    String url;

    static constraints = {
        url nullable: false, blank: false
    }
}
