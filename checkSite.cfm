<cfquery name="schedule" datasource="data_base1">
    SELECT userId,title,text1,text2,gender,dob,img,address,street,pin,district,state,country,mail,phone 
    FROM contact 
    WHERE createdBy=<cfqueryparam value="#url.userName#" cfsqltype="cf_sql_varchar">
</cfquery>
<cfloop query = "schedule">
    <cfif DateFormat(schedule.dob,"dd-mm") EQ DateFormat(Now(),"dd-mm") >
        <cfmail  from="#url.userMail#"  subject="Birthday wish"  to="#schedule.mail#" type = "text">
            Bday wishes!
        </cfmail>
    </cfif>
</cfloop>