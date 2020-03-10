package edu.ucla.mii.authserv

import static org.springframework.http.HttpStatus.*
import static org.springframework.http.HttpMethod.*
import grails.converters.*

class ApiController{

    def validationService

    def login() {
        def params = request.JSON

        def retval = validationService.login(params)

        response.status = retval.status_code
        retval.remove('status')
        render( retval as JSON )

    }  

    def logout() {
        def params = request.JSON

        def retval = validationService.logout(params)

        response.status = retval.status_code
        retval.remove('status')
        render( retval as JSON )
    }

    def canAccess() {
        def params = request.JSON

        def retval = validationService.canAccess(params)

        response.status = retval.status_code
        retval.remove('status')
        render( retval as JSON )
    }

    def canAccessMultiple() {
        def params = request.JSON

        def retval = validationService.canAccessMultiple(params)

        response.status = retval.status_code
        retval.remove('status')
        render( retval as JSON )
    }

    def logAccess() {
        def params = request.JSON

        def retval = validationService.logAccess(params)
        
        response.status = retval.status_code
        retval.remove('status')
        render( retval as JSON )
        render (retval as JSON)
    }

}
