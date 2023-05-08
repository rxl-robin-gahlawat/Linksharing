package linksharing

import Enum.SeriousnessEnum
import grails.gorm.transactions.Transactional

@Transactional
class UpdatedashboardService {

    def serviceMethod() {

    }

    boolean updateSeriousness(Map params){

        try{
            Subscription sub = Subscription.get(params.subid)
            if(params.seriousness == 'CASUAL')
                sub.seriousness = SeriousnessEnum.CASUAL
            else if(params.seriousness == 'SERIOUS')
                sub.seriousness = SeriousnessEnum.SERIOUS
            else
                sub.seriousness = SeriousnessEnum.VERY_SERIOUS

            return true
        }
        catch(Exception e){
            return false
        }


    }

}
