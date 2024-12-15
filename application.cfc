<cfcomponent>
    <cfset this.name = 'addresbook'>
    <cfset this.sessionManagement = true>
    <cfset this.sessionTimeout=createTimespan(0, 0, 30, 0)>
    <cfset this.datasource = "data_base1">
    <cfset this.ormEnabled="true">
    
    <cffunction  name="onRequest" returnType="void">
        <cfargument  name="requestPage" required="true"> 
        <cfset local.excludePages = ["/login.cfm","/signUp.cfm","/googlesso.cfm","/checkSite.cfm"]>
        <cfif ArrayContains(local.excludePages,arguments.requestPage)>
            <cfinclude  template="#arguments.requestPage#">
        <cfelseif structKeyExists(session, "isAuthenticated")>
            <cfinclude  template="#arguments.requestPage#">
        <cfelse>
            <cfinclude  template="login.cfm">
        </cfif>
    </cffunction> 

</cfcomponent>