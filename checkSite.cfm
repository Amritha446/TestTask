<cfquery name="schedule" datasource="data_base1">
    SELECT userId,title,text1,text2,gender,dob,img,address,street,pin,district,state,country,mail,phone 
    FROM contact 
    WHERE createdBy=<cfqueryparam value="#session.userName#" cfsqltype="cf_sql_varchar">
</cfquery>
<cfloop name = "schedule">
    <cfif dateCompare(schedule.dob, Now()) EQ 0>
        <cfmail  from="#session.userMail#"  subject="subject"  to="#schedule.mail#" type = "text">
        </cfmail>
    </cfif>
</cfloop>