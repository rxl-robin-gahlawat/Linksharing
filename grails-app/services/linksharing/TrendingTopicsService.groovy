package linksharing

import Enum.SeriousnessEnum
import Enum.VisibilityEnum
import grails.gorm.transactions.Transactional
import org.apache.catalina.User

@Transactional
class TrendingTopicsService {

    def serviceMethod() {

    }

    HashMap<String, Integer> sortMapAsValue(HashMap<String, Integer> hm)
    {
        // Create a list from elements of HashMap
        List<Map.Entry<String, Integer> > list =
                new LinkedList<Map.Entry<String, Integer> >(hm.entrySet());

        // Sort the list
        Collections.sort(list, new Comparator<Map.Entry<String, Integer> >() {
            public int compare(Map.Entry<String, Integer> o1,
                               Map.Entry<String, Integer> o2)
            {
                return (o1.getValue()).compareTo(o2.getValue());
            }
        });

        // put data from sorted list to hashmap
        HashMap<String, Integer> temp = new LinkedHashMap<String, Integer>();
        Collections.reverse(list)
        for (Map.Entry<String, Integer> aa : list) {
            temp.put(aa.getKey(), aa.getValue());
        }
        return temp;
    }

    List trendingTopicsList(Userdetail user){


        List topicsList = Topic.createCriteria().list{
            eq("visibility",VisibilityEnum.PUBLIC)
        }


        Map topicWithPostsMap = [:]
        topicsList.each{topic->
            int res = Resourcedetail.countByTopic(topic)
            topicWithPostsMap.put(topic,res)
        }
        topicWithPostsMap = sortMapAsValue(topicWithPostsMap)

        List subscriptionList = []
        int count = 0;
        topicWithPostsMap.each{ topic,totalPosts->
            if(count<5){
                subscriptionList.add(Subscription.findByTopic(topic))
            }
            count++;
        }

        // Everything done above is to get a list of rows of Subscription table.

        List subsList = []
        int i = 0;
        subscriptionList.each{it->
            Map result = [:]
            boolean isSubscribed
            int subsCount = Subscription.countByTopic(it.topic)
            int postCount = Resourcedetail.countByTopic(it.topic)
            Topic tempTopic = it.topic
            def res = Subscription.createCriteria().count{
                eq("topic", tempTopic)
                eq("user", user)
            }
            if(res){
                result.put("isSubscribed",true)
            }
            else{
                result.put("isSubscribed",false)
            }

//            isSubscribed = it.user == user
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
