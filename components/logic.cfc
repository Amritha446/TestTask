<cfcomponent>
    <cffunction name="validateLogin" access="public" returnType="boolean">
        <cfargument  name="userName">
        <cfargument  name="password">
        <cfset local.encrypted_pass = Hash(#arguments.password#, 'SHA-512')/>
        <cfquery name="qcheck" datasource="data_base1">
            SELECT password
            FROM customer1
            WHERE userName = <cfqueryparam value="#arguments.userName#" cfsqltype="cf_sql_varchar">
        </cfquery>
        <cfif qcheck.password EQ "#local.encrypted_pass#">
            <cfquery name="getUser" datasource="data_base1">
                select CustomerID,userName from customer1 where 
                userName=<cfqueryparam value="#arguments.userName#" cfsqltype="cf_sql_varchar">
                AND password=<cfqueryparam value="#local.encrypted_pass#" cfsqltype="cf_sql_varchar">
            </cfquery>
            <cfif getUser.recordCount GT 0>
                <cfset session.isAuthenticated = true>
                <cfset session.userId = "#getUser.CustomerId#">
                <cfset session.userPassword= "#getUser.password#">
                <cfset session.userName="#getUser.userName#">
                <cfreturn true>
            </cfif>
        <cfelse>
            <cfreturn false>
        </cfif>
        <cfreturn false>
    </cffunction>

    <cffunction  name="signIn" access="public" returnType="string">
        <cfargument  name="fullName">
        <cfargument  name="mail">
        <cfargument  name="userName">
        <cfargument  name="userPassword1">
        <cfargument  name="userPassword2">
        <cfset local.encrypted_pass1 = Hash(arguments.userPassword1, 'SHA-512')/>
        <cfset local.encrypted_pass2 = Hash(arguments.userPassword2, 'SHA-512')/>
        <cfif local.encrypted_pass1 EQ local.encrypted_pass2>
            <cfif Find(" ", arguments.userName)>
                <cfreturn "Username should not contain any spaces.">
            </cfif>
        
            <cfquery name="checkUser" datasource="data_base1">
                SELECT userName FROM customer1 WHERE userName=<cfqueryparam value="#arguments.userNamee#" cfsqltype="cf_sql_varchar">  
            </cfquery>

            <cfif checkUser.RecordCount EQ 0>
                <cfquery name="insertDetails" datasource="data_base1">
                    insert into customer1(fullName,mail,userName,password) values(<cfqueryparam value="#arguments.fullName#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.mail#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.userName#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#local.encrypted_pass1#" cfsqltype="cf_sql_varchar">)
                </cfquery>
                <cfreturn true> 
            <cfelse>
                <cfreturn false>
            </cfif>
            <cfreturn true>
        <cfelse>
            <cfreturn false>
        </cfif>
    </cffunction>
    
    <cffunction  name="select" access="public" returnType="query">
        <cfquery name="pagesList" datasource="data_base1">
            select page_id,page_name,page_description from page where 
            CreatedBy=<cfqueryparam value="#session.userName#" cfsqltype="cf_sql_varchar">
        </cfquery>
        <cfreturn pagesList>
    </cffunction>
</cfcomponent>