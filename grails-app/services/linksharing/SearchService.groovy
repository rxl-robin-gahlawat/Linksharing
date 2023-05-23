package linksharing

import grails.gorm.transactions.Transactional

@Transactional
class SearchService {

    def serviceMethod() {
    }

    List topPostList(){

        List posts = ResourceRating.createCriteria().list{
            projections{
                groupProperty('resource')
                avg('score', 'avg_score')
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
            return Resourcedetail.createCriteria().list{
                createAlias('topic', 't')
                or{
                    ilike('t.name', "%${params.searchInput}%")
                    ilike("description", "%${params.searchInput}%")
                }
            }
        }
    }








}
