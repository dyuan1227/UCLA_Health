package edu.ucla.mii.authserver
import javax.servlet.http.Cookie;
import org.apache.http.HttpResponse;
import grails.converters.*

import grails.transaction.Transactional
import edu.ucla.mii.authserver.User
import edu.ucla.mii.authserver.UserRole
import edu.ucla.mii.authserver.Role
import javax.servlet.http.HttpSession;

import grails.converters.JSON;
import groovy.json.JsonBuilder;

class HomeController {
    def validationService
    def authorizationService
    def authenticationService
    def frontService

    def accessibility = []
    def index(){
        def token = frontService.gettingCookies(request, response)
        def map = [:]
        map['ssoToken'] = token
        map['wsIpAddr'] = "10.9.94.110"
        map['applId'] = "D304"
     
        def verification = authenticationService.tryVerify(map)
        def permission_ar = ['authCanView',
                            'authCanEdit']
 
        accessibility= authorizationService.tryGetAuths(verification.uid,permission_ar)
        //println accessibility
        if('authCanView' in accessibility.okAccess){
            render(
                view: 'home'
            )
        }
        else{
            redirect(controller: 'login')
        }    
    }
    def logout(){
        println "BYE BYE World"
        redirect(controller: 'login', params:[message: "logout"])
    }

    def permission(){

        println "transfer to the permission page"
        println accessibility
        if('authCanEdit' in accessibility.okAccess){           
            render (
                view:'permission'
            )
        }else{
            println 'Cant access permission page'
            render (
                view:'permission'
            )
        }
    }
    def backtohome(){
        println 'Back to home page'
        render(
            view:'home'
        )
    }

    @Transactional
    def CreateUser(){
        //In here, I want to save the new user to the database
        //using ajax to display it out
        println "I am in CreateUser"
        def allpermission = Role.findAll().permission
        def size_of_allpermissions = allpermission.size()
        def id_permission=[:]
        for(def i= 0; i <size_of_allpermissions; i++){
            id_permission[Role.findAll().permission[i]]=Role.findAll().id[i]
        }       
        if(params.email in User.findAll().user_id){
            println "found"
        }else{      
            def new_usr = new User(user_id: params.email , email: params.email + '@mednet.ucla.edu', first_name: params.firstname, last_name:params.lastname, enabled: 1)
            new_usr.save()
            println "Successfully added"
        }
        def id_corresponding = id_permission.(params.accesspermission)
        // println id_corresponding
        def usr_role = new UserRole(user_id: params.email, role_id: id_corresponding)
        usr_role.save()
        render(
            view:'home'
        )
        
    }


    @Transactional
    def CreatePermission(){
        //In here, I want to save the new Permission to the database
        //using ajax to display it out
        println "I am in CreatePermission"
        def int_n = params.idx.toInteger()
        def p = new Role (id: int_n, application: params.application, permission: params.privilegename)
        p.id = int_n
        p.save()
        render(
            view:'permission'
        )

       
    }


    def takeTableData() {
        println "I am in User TableData"
        def allusers = []
        def oneuser= []
       
        def alistof_users= User.findAll().user_id
        def num_in_the_list= alistof_users.size()
        //println num_in_the_list
        for(def i= 0; i <num_in_the_list; i++){
            oneuser.push(User.findAll().user_id[i])
            oneuser.push(User.findAll().email[i])
            oneuser.push(User.findAll().first_name[i])
            oneuser.push(User.findAll().last_name[i])

            allusers.push(oneuser)
            oneuser=[]
        
        }

       render ([draw: 1, recordsTotal: 1, recordsFiltered: 1, tableData:allusers] as JSON)
        
    }

    def takeRoleTableData() {
        println "I am in Role TableData"
        def allids = []
        def oneid= []
        def all_ids= Role.findAll().id
        def size_of_ids = all_ids.size()
        
        for(def i= 0; i <size_of_ids; i++){
            oneid.push(Role.findAll().id[i])
            oneid.push(Role.findAll().application[i])
            oneid.push(Role.findAll().permission[i])

            allids.push(oneid)
            oneid = []
        }      
        render ([draw: 1, recordsTotal: 1, recordsFiltered: 1, tableData:allids] as JSON)
    }
    
    def takeUserPermissionTableData(){
        println "I am in User Permission TableData"
        
        def userpermissiontable=[
            user_id: "aaa",
            email:"aaa@mednet.ucla.edu",
            first_name:"aha",
            last_name:"ahaha",
            application:"LIVER_DATA_ENTRY",
            accesspermissions:"liverDataEntryUser"
        ]
        render ([draw: 1, recordsTotal: 1, recordsFiltered: 1, tableData:userpermissiontable] as JSON)

    }


}