package linksharing

class LogoutController {

    def index() {
        session.invalidate()
        redirect(url:"/login")
    }
}
