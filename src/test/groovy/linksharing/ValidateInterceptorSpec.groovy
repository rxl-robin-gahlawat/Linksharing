package linksharing

import grails.testing.web.interceptor.InterceptorUnitTest
import spock.lang.Specification

class ValidateInterceptorSpec extends Specification implements InterceptorUnitTest<ValidateInterceptor> {

    def setup() {
    }

    def cleanup() {

    }

    void "Test validate interceptor matching"() {
        when:"A request matches the interceptor"
            withRequest(controller:"validate")

        then:"The interceptor does match"
            interceptor.doesMatch()
    }
}
