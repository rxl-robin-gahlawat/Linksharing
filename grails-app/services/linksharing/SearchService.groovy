package linksharing

import Enum.VisibilityEnum
import grails.gorm.transactions.Transactional
import java.util.Calendar


@Transactional
class SearchService {


    def serviceMethod() {
    }
    

    List topPostList(String timeFrame){

        def calendar = Calendar.getInstance()
        def startDate

        switch (timeFrame) {
            case "Today":
                startDate = calendar.clearTime()
                break
            case "1 Week":
                calendar.add(Calendar.DAY_OF_MONTH, -7)
                startDate = calendar.clearTime()
                break
            case "1 Month":
                calendar.add(Calendar.MONTH, -1)
                startDate = calendar.clearTime()
                break
            case "1 Year":
                calendar.add(Calendar.YEAR, -1)
                startDate = calendar.clearTime()
                break
            default:
                startDate = calendar.clearTime()
        }


        List posts = ResourceRating.createCriteria().list{
            projections{
                groupProperty('resource')
                avg('score', 'avg_score')
            }
            resource{
                topic{
                    eq("visibility", VisibilityEnum.PUBLIC)
                }
                ge("dateCreated", startDate.time)
            }
            order('avg_score','desc')
            maxResults 5
        }

        List topPosts = []
        posts.each{item->
            topPosts.add(item[0])
        }
        return topPosts

    }

    List recentPostList(){

        List posts = Resourcedetail.createCriteria().list{
            topic{
                eq("visibility", VisibilityEnum.PUBLIC)
            }
            order('lastUpdated','desc')
            maxResults 5
        }
        return posts

    }


    def searchFunction(Map params){

        if(params.searchInput==''){
            return Resourcedetail.list()
        }
        else{
            return Resourcedetail.createCriteria().listDistinct{
                createAlias('topic', 't')
                or{
                    ilike('t.name', "%${params.searchInput}%")
                    ilike("description", "%${params.searchInput}%")
                }
            }
        }
    }








}
