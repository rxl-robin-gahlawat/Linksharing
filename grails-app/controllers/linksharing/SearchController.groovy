package linksharing

class SearchController {

    def TrendingTopicsService
    def AdminService
    def SearchService

    def index() {

        Long userID = session.LOGGED_IN_USER_ID
        Userdetail user = AdminService.getUser(userID)

        List trendingTopicList = TrendingTopicsService.trendingTopicsList(user)

        List topPosts = SearchService.topPostList()
        List searchOutput = SearchService.searchFunction(params)

//        println searchOutput

        Map loadMap = ["user": user,"params":params, "trendingTopicList": trendingTopicList, "topPosts": topPosts, "postList":searchOutput]

        render(view:"search", model: loadMap)



    }
}
