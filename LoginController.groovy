package edu.ucla.mii.authserv
import org.apache.http.HttpResponse;
import grails.transaction.Transactional
import javax.servlet.http.Cookie;


class LoginController {

	def validationService
    def authorizationService
    def frontService
    def authenticationService

    def index() {
        
        def ckk = frontService.gettingCookies(request, response)
       // println ckk
    
                if (params.uid != null && params.password != null && params.uid != "" && params.password != ""){
                    //println params.uid
                    //println params.password
                    def credentials = [
                        "uid":params.uid,
                        "password":params.password,
                        "applId": "D304",
                        "wsIpAddr":"10.9.94.110"
                    ]
                def result = validationService.login(credentials)
                //println result
                frontService.creatingCookies(result,response)

                    if(result.status_code==200){
                        redirect(controller: 'home', action: 'index')
                    }
                    else{ 
                        println result.message
                        return[
                            "message": "invalid"
                        ]                           
                    }          
                }
                
                render(
                    view: 'index'
                )
        
    }

}
