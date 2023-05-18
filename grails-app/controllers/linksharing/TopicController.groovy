package linksharing

class TopicController {

    def AdminService
    def TopicService
    def SubscriptionListService


    def index() {

        Long userID = session.LOGGED_IN_USER_ID
        Userdetail user = AdminService.getUser(userID)

        def topic = TopicService.getTopic(Long.parseLong(params.topicId))
        def resultTopic = TopicService.getResultTopic(user, topic)
        def subsInfoList = TopicService.getTopicSubscribersList(topic)

        Map loadMap = ["user": user, "subscribedTopicList": resultTopic, "subsInfoList": subsInfoList]
        render(view:"topic", model: loadMap)


    }
}
