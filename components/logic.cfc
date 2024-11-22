<cfcomponent>
    <cffunction name="validateLogin" access="public" returnType="boolean">
        <cfargument  name="userName">
        <cfargument  name="userPassword1">
        <cfset local.encrypted_pass = Hash(#arguments.userPassword1#, 'SHA-512')/>
        <cfquery name="qCheck" datasource="data_base1">
            SELECT password
            FROM customer1
            WHERE userName = <cfqueryparam value="#arguments.userName#" cfsqltype="cf_sql_varchar">
        </cfquery>
        <cfif qCheck.password EQ "#local.encrypted_pass#">
            <cfquery name="getUser" datasource="data_base1">
                SELECT 
                CustomerID,userName,password,profile 
                FROM customer1 
                WHERE 
                userName=<cfqueryparam value="#arguments.userName#" cfsqltype="cf_sql_varchar">
                AND password=<cfqueryparam value="#local.encrypted_pass#" cfsqltype="cf_sql_varchar">
            </cfquery>
            <cfif getUser.recordCount >
                <cfset session.isAuthenticated = true>
                <cfset session.userId = "#getUser.CustomerId#">
                <cfset session.userPassword= "#getUser.password#">
                <cfset session.userName="#getUser.userName#">
                <cfset session.profile="#getUser.profile#">
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
        <cfargument  name="profile">
        <cfset local.path = expandPath("./assets")>
        <cffile  action="upload" destination="#local.path#" nameConflict="makeUnique">
        <cfset local.val=cffile.clientFile> 
        <cfset local.encrypted_pass1 = Hash(arguments.userPassword1, 'SHA-512')/>
        <cfset local.encrypted_pass2 = Hash(arguments.userPassword2, 'SHA-512')/>
        <cfif local.encrypted_pass1 EQ local.encrypted_pass2>
            <cfif Find(" ", arguments.userName)>
                <cfreturn "Username should not contain any spaces.">
            </cfif>
        
            <cfquery name="checkUser" datasource="data_base1">
                SELECT userName 
                FROM customer1 
                WHERE userName=<cfqueryparam value="#arguments.userName#" cfsqltype="cf_sql_varchar">  
            </cfquery>

            <cfif checkUser.RecordCount EQ 0>
                <cfquery name="insertDetails" datasource="data_base1">
                    INSERT INTO customer1(fullName,mail,userName,password,profile) 
                    VALUES(<cfqueryparam value="#arguments.fullName#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.mail#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.userName#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#local.encrypted_pass1#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#local.val#" cfsqltype="cf_sql_varchar">)
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

    <cffunction  name="setSessionId" access="remote" returnType="void">
        <cfargument  name="userId">
        <cfset session.contactId = arguments.userId>
    </cffunction>

    <cffunction  name="createContact" access="public" returnType="any">
        <cfargument  name="title">
        <cfargument  name="text1">
        <cfargument  name="text2">
        <cfargument  name="gender">
        <cfargument  name="dob">
        <cfargument  name="img">
        <cfargument  name="address">
        <cfargument  name="street">
        <cfargument  name="pin">
        <cfargument  name="district">
        <cfargument  name="state">
        <cfargument  name="country">
        <cfargument  name="mail">
        <cfargument  name="phone">
        <cfset local.path = expandPath("./assets")>
        <cffile  action="upload" destination="#local.path#" nameConflict="makeUnique">
        <cfset local.value=cffile.clientFile> 
        <cfquery name="checkUser">
            SELECT mail,phone 
            FROM contact 
            WHERE phone=<cfqueryparam value="#arguments.phone#" cfsqltype="cf_sql_varchar">
        </cfquery>
        <cfif checkUser.recordCount EQ 0>
            <cfquery name="dataAdd" datasource="data_base1">
                INSERT INTO contact(title,text1,text2,gender,dob,img,address,street,pin,district,state,country,mail,phone,createdBy,updatedBy) 
                VALUES(<cfqueryparam value="#arguments.title#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.text1#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.text2#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.gender#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.dob#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#local.value#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.address#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.street#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.pin#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.district#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.state#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.country#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.mail#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.phone#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#session.userName#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#session.userName#" cfsqltype="cf_sql_varchar">)
            </cfquery>
            <cflocation  url="home.cfm">
            <cfreturn query>
        <cfelse>
            <cfreturn "Email and Phone number should be unique">
        </cfif>
    </cffunction>

    <cffunction  name="removeSessionId" access="remote" returnType="void">
        <cfif structKeyExists(session,"contactId")>
            <cfset structDelete(session,"contactId")>
        </cfif>
    </cffunction>

    <cffunction  name="viewContact" access="public" returnType="query">
        <cfquery name="viewdata" datasource="data_base1">
            SELECT userId,title,text1,text2,gender,dob,img,address,street,pin,district,state,country,mail,phone 
            FROM contact 
            WHERE createdBy=<cfqueryparam value="#session.userName#" cfsqltype="cf_sql_varchar">
        </cfquery>
        <cfreturn viewdata>
    </cffunction>

    <cffunction  name="viewOne" access="remote" returnType="query" returnFormat="json">
        <cfargument  name="userId">
        <cfquery name="viewOnedata" datasource="data_base1">
            SELECT title,text1,text2,gender,dob,address,street,pin,district,state,country,mail,phone,img 
            FROM contact
            WHERE userId=<cfqueryparam value="#arguments.userId#" cfsqltype="cf_sql_varchar">
        </cfquery>
        <cfreturn viewonedata>
    </cffunction>

    <cffunction  name="editContact" access="public" returnType="query">
        <cfargument  name="title">
        <cfargument  name="text1">
        <cfargument  name="text2">
        <cfargument  name="gender">
        <cfargument  name="dob">
        <cfargument  name="img">
        <cfargument  name="address">
        <cfargument  name="street">
        <cfargument  name="pin">
        <cfargument  name="district">
        <cfargument  name="state">
        <cfargument  name="country">
        <cfargument  name="mail">
        <cfargument  name="phone">
        <cfargument  name="userId"> 

        <cfset local.path = expandPath("./assets")>
        <cffile  action="upload" destination="#local.path#" nameConflict="makeUnique">
        <cfset local.value=cffile.clientFile> 

        <cfquery name="pageList" datasource="data_base1">
            UPDATE contact 
            SET title = <cfqueryparam value="#arguments.title#" cfsqltype="cf_sql_varchar">,
            text1 = <cfqueryparam value="#arguments.text1#" cfsqltype="cf_sql_varchar">,
            text2 = <cfqueryparam value="#arguments.text2#" cfsqltype="cf_sql_varchar">,
            gender = <cfqueryparam value="#arguments.gender#" cfsqltype="cf_sql_varchar">,
            dob = <cfqueryparam value="#arguments.dob#" cfsqltype="cf_sql_varchar">,
            img = <cfqueryparam value="#local.value#" cfsqltype="cf_sql_varchar">,
            address = <cfqueryparam value="#arguments.address#" cfsqltype="cf_sql_varchar">,
            street = <cfqueryparam value="#arguments.street#" cfsqltype="cf_sql_varchar">,
            pin = <cfqueryparam value="#arguments.pin#" cfsqltype="cf_sql_varchar">,
            district = <cfqueryparam value="#arguments.district#" cfsqltype="cf_sql_varchar">,
            state = <cfqueryparam value="#arguments.state#" cfsqltype="cf_sql_varchar">,
            country = <cfqueryparam value="#arguments.country#" cfsqltype="cf_sql_varchar">,
            mail = <cfqueryparam value="#arguments.mail#" cfsqltype="cf_sql_varchar">,
            phone = <cfqueryparam value="#arguments.phone#" cfsqltype="cf_sql_varchar">,
            updatedBy = <cfqueryparam value="#session.userName#" cfsqltype="cf_sql_varchar">
            WHERE userId = <cfqueryparam value="#arguments.userId#" cfsqltype="cf_sql_varchar">
        </cfquery>

        <cflocation  url="home.cfm">

        <cfreturn query>
    </cffunction>

    <cffunction  name="delContact" access="remote" returnType="void">
        <cfargument name="userId">

        <cfquery name="delete" datasource="data_base1">
            DELETE 
            FROM contact 
            WHERE userId = <cfqueryparam value="#arguments.userId#" cfsqltype="cf_sql_varchar">
        </cfquery>

    </cffunction>
    
    <cffunction  name="logout" access="remote" return="void">
        <cfset structClear(session)>
        <cfreturn true>
    </cffunction>

    <cffunction  name="createExcel" access="remote" returnType="string" returnFormat="json">
        <cfset local.filename = createUUID()>
        <cfquery name="excelReturn">
            SELECT title,text1,text2,gender,dob,address,street,pin,district,state,country,mail,phone,img 
            FROM contact
            WHERE createdBy=<cfqueryparam value="#session.userName#" cfsqltype="cf_sql_varchar"> 
        </cfquery>
        <cfspreadsheet  action="write" filename="../assets/spreadsheet/#local.filename#.xlsx" query="excelReturn">
        <cfreturn "#local.filename#.xlsx">
    </cffunction>
    
</cfcomponent>