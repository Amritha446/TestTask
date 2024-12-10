<cfcomponent>
    <cffunction name="validateLogin" access="public" returnType="boolean">
        <cfargument  name="userName">
        <cfargument  name="userPassword1">
        <cfset local.encrypted_pass = Hash(#arguments.userPassword1#, 'SHA-512')/>
        <cfquery name="local.qCheck"><!---maked it one query--->
            SELECT CustomerID,
                userName,
                password,
                profile,
                fullName,
                mail
            FROM users
            WHERE userName = <cfqueryparam value="#arguments.userName#" cfsqltype="cf_sql_varchar">
            AND password=<cfqueryparam value="#local.encrypted_pass#" cfsqltype="cf_sql_varchar">
        </cfquery>
        <cfif local.qCheck.password EQ "#local.encrypted_pass#">
            <cfif local.qCheck.recordCount >
                <cfset session.isAuthenticated = true>
                <cfset session.userId = local.qCheck.CustomerId>
                <cfset session.profile = local.qCheck.profile>
                <cfset session.fullName = local.qCheck.fullName>
                <cfset session.userMail = local.qCheck.mail>
                <cfreturn true>
            </cfif>
        <cfelse>
            <cfreturn false>
        </cfif>
        <cfreturn false>
    </cffunction>

    <cffunction  name="signUp" access="public" returnType="string">
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
        
            <cfquery name="local.checkUser">
                SELECT userName 
                FROM users 
                WHERE userName=<cfqueryparam value="#arguments.userName#" cfsqltype="cf_sql_varchar">  
            </cfquery>

            <cfif local.checkUser.RecordCount EQ 0>
                <cfquery name="local.insertDetails">
                    INSERT INTO 
                    users(
                        fullName,
                        mail,
                        userName,
                        password,
                        profile
                    ) 
                    VALUES(
                        <cfqueryparam value="#arguments.fullName#" cfsqltype="cf_sql_varchar">,
                        <cfqueryparam value="#arguments.mail#" cfsqltype="cf_sql_varchar">,
                        <cfqueryparam value="#arguments.userName#" cfsqltype="cf_sql_varchar">,
                        <cfqueryparam value="#local.encrypted_pass1#" cfsqltype="cf_sql_varchar">,
                        <cfqueryparam value="#local.val#" cfsqltype="cf_sql_varchar">
                    )
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
        <cfset  = arguments.userId>
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
        <cfargument  name="multiSel">
        <cfset local.path = expandPath("./assets")>
        <cffile  action="upload" destination="#local.path#" nameConflict="makeUnique">
        <cfset local.value=cffile.clientFile> 
        <cfquery name="local.checkUser">
            SELECT mail,
                phone 
            FROM contact 
            WHERE phone=<cfqueryparam value="#arguments.phone#" cfsqltype="cf_sql_varchar">
        </cfquery>
        <cfif local.checkUser.recordCount EQ 0>
            <cfquery name="local.dataAdd">
                INSERT INTO 
                    contact(
                        title,
                        text1,
                        text2,
                        gender,
                        dob,
                        img,
                        address,
                        street,
                        pin,
                        district,
                        state,
                        country,
                        mail,
                        phone,
                        createdBy 
                    ) 
                VALUES(
                    <cfqueryparam value="#arguments.title#" cfsqltype="cf_sql_varchar">,
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
                    <cfqueryparam value="#session.userId#" cfsqltype="cf_sql_varchar">
                )
            </cfquery>
            <cfquery name="local.idSelect">
                select 
                userId 
                from 
                contact 
                where 
                mail = <cfqueryparam value="#arguments.mail#" cfsqltype="cf_sql_varchar">;
            </cfquery>
           <cfloop list="#arguments.multiSel#" item="item"> 
                <cfquery name = "local.selectedOptionInsertion">
                INSERT INTO 
                contact_role(
                    contact_id,
                    role_id
                ) 
                values
                (<cfqueryparam value="#local.idSelect.userId#" cfsqltype="cf_sql_varchar">, 
                <cfqueryparam value="#item#" cfsqltype="cf_sql_varchar">)
                </cfquery>
            </cfloop> 
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

    <cffunction  name="viewContact" access="remote" returnType="query">
        <cfquery name="local.viewdata">
            SELECT 
                userId,
                title,
                text1,
                text2,
                gender,
                dob,
                img,
                address,
                street,
                pin,
                district,
                state,
                country,
                mail,
                phone 
            FROM contact 
            WHERE createdBy=<cfqueryparam value="#session.userId#" cfsqltype="cf_sql_varchar">
        </cfquery>
        <cfreturn local.viewdata>
        
    </cffunction>

    <cffunction  name="getOneContact" access="remote" returnType="struct" returnFormat="json">
        <cfargument  name="userId">
        <cfquery name="local.getOneContactdata">
            SELECT 
                contact.title,
                contact.text1,
                contact.text2,
                contact.gender,
                contact.dob,
                contact.address,
                contact.street,
                contact.pin,
                contact.district,
                contact.state,
                contact.country,
                contact.mail,
                contact.phone,
                contact.img,
                contact_role.role_id
            FROM 
            contact JOIN
            contact_role
            ON 
            contact.userId = contact_role.contact_id
            WHERE userId = <cfqueryparam value="#arguments.userId#" cfsqltype="cf_sql_varchar">
        </cfquery>

        <cfloop array="#local.getOneContactdata.contact_role.role_id#" item="item">
            <cfset selectedId = ArrayNew(1)>
            <cfset ArrayAppend(selectedId, {"#item#"})>
        </cfloop>

        <cfreturn local.combinedData>
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

        <cfquery name="local.pageList">
            UPDATE contact 
            SET 
                title = <cfqueryparam value="#arguments.title#" cfsqltype="cf_sql_varchar">,
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
                updatedBy = <cfqueryparam value="#session.userId#" cfsqltype="cf_sql_varchar">
            WHERE userId = <cfqueryparam value="#arguments.userId#" cfsqltype="cf_sql_varchar">
        </cfquery>

        <cflocation  url="home.cfm">

        <cfreturn query>
    </cffunction>

    <cffunction  name="delContact" access="remote" returnType="void">
        <cfargument name="userId">
        <cfquery name="local.delete">
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
        <cfset local.result = viewContact()>
        <cfspreadsheet  action="write" filename="../assets/spreadsheet/#local.filename#.xlsx" query="local.result">
        <cfreturn "#local.filename#.xlsx">
    </cffunction>
    
    <cffunction name="multiSelection" access="public" returnType="query">
        <cfquery name = "local.getMultiSelectedData">
            select 
            role_id,
            role_name
            from
            role_select
            order By
            role_name;
        </cfquery>
        <cfreturn local.getMultiSelectedData>
    </cffunction>

</cfcomponent>