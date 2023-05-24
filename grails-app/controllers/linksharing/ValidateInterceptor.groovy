package linksharing


class ValidateInterceptor {

    ValidateInterceptor(){
        match(controller:"dashboard", action: "*")
        match(controller:"admin", action: "*")
        match(controller:"profile", action: "*")
        match(controller:"updatedashboard", action: "*")
//        match(controller:"topic", action: "*")
//        match(controller:"post", action: "*")
        match(controller:"search", action: "*")


    }

    boolean before() {

        boolean flag = false
        if(session.LOGGED_IN_USER_ID){
            flag = true
        }
        else{
            redirect(url:"/login")
            flag = false
        }
        return flag


    }

    boolean after() { true }

    void afterView() {
        // no-op
    }
}
