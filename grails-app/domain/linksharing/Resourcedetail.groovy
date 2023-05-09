package linksharing

class Resourcedetail {


    Topic topic
    Userdetail createdBy
    String description
    Date dateCreated
    Date lastUpdated

    static belongsTo = [createdBy: Userdetail, topic: Topic]

    static hasMany = [readingItems: ReadingItem, resourceRatings: ResourceRating]

    static mapping = {
    }


    static constraints = {
        description nullable: false, blank: false
    }
}


/*


package linksharing

import grails.gorm.transactions.Transactional

@Transactional
class SubscriptionListService {

    def serviceMethod() {
    }


    HashMap<String, Date> sortByDateAsValue(HashMap<String, Date> hm)
    {
        // Create a list from elements of HashMap
        List<Map.Entry<String, Date> > list =
                new LinkedList<Map.Entry<String, Date> >(hm.entrySet());

        // Sort the list
        Collections.sort(list, new Comparator<Map.Entry<String, Date> >() {
            public int compare(Map.Entry<String, Date> o1,
                               Map.Entry<String, Date> o2)
            {
                return (o1.getValue()).compareTo(o2.getValue());
            }
        });

        // put data from sorted list to hashmap
        HashMap<String, Date> temp = new LinkedHashMap<String, Date>();
        Collections.reverse(list)
        for (Map.Entry<String, Date> aa : list) {
            temp.put(aa.getKey(), aa.getValue());
        }
        return temp;
    }


    List subscriptionList(Userdetail user){


        List tempSubList = Subscription.createCriteria().list{
            eq("user",user)
        }
        Map sub_topic_map = [:]
        tempSubList.each{ sub->
            sub_topic_map.put(sub.topic.id, sub.id)
        }

        Map topicMapwithResourceLastUpdated = [:]
        tempSubList.each{ sub->
            def res = Resourcedetail.createCriteria().list{
                projections {
                    property("lastUpdated")
                }
                eq("topic", sub.topic)
                order("lastUpdated", "desc")
            }
            if(!res[0]){
                Date defaultDate = new Date()
                defaultDate.setMonth(1)
                topicMapwithResourceLastUpdated.put(sub.topic.id,defaultDate)
            }
            else{
                topicMapwithResourceLastUpdated.put(sub.topic.id,res[0])
            }
        }
        Map sortedTopics = sortByDateAsValue(topicMapwithResourceLastUpdated)

        List finalSubList = []
        sortedTopics.each{topicID,topicLastUpdated->
            println topicID +" :::::: "+ topicLastUpdated
                finalSubList.add(sub_topic_map.get(topicID))
        }
        println finalSubList

        List subscriptionList = []
        finalSubList.each{ subID->
            def l = Subscription.findById(subID)
            subscriptionList.add(l)
        }

        // keep only 5 records

        List subsList = []
        int i = 0;
        subscriptionList.each{it->
            Map result = [:]
            int subsCount = Subscription.countByTopic(it.topic)
            int postCount = Resourcedetail.countByTopic(it.topic)
            result.put("subID", it.id)
            result.put("user",it.user)
            result.put("topic",it.topic)
            result.put("seriousness",it.seriousness)
            result.put("subsCount",subsCount)
            result.put("postCount",postCount)
            subsList.add(result)
        }
        return subsList

    }

}


 */
