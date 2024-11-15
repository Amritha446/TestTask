<cfcomponent>
    <cfset this.name = 'this.name'>
    <cfset this.sessionManagement = true>
    <cfset this.sessionTimeout=createTimespan(0, 1, 0, 0)>
    <cfset this.datasource = "data_base1">
    <cffunction  name="onRequest" returnType="void">
        <cfargument  name="requestPage" required="true"> 
        <cfset local.excludePages = ["/Amritha_CF/CF/28/admin_login.cfm","/Amritha_CF/CF/28/signUp.cfm"]>
        <cfif ArrayContains(local.excludePages,arguments.requestPage)>
        <cfinclude  template="#arguments.requestPage#">
        <cfelseif structKeyExists(session, "isAuthenticated")>
            <cfinclude  template="#arguments.requestPage#">
        <cfelse>
            <cfinclude  template="admin_login.cfm">
        </cfif>
    </cffunction> 
</cfcomponent>