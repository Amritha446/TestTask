<cfcomponent>
    <cffunction name = "scheduleDate" access="remote" returnType="void">
        <cfschedule action = "update" 
        task = "TaskName" 
        operation = "HTTPRequest" 
        url = "http://addressbook.com/checkSite.cfm?userName=#session.userName#&userMail=#session.userMail#" 
        startDate = "#Now()#" 
        startTime = "12:00 AM"
        interval = "daily" 
        mode = "application"  
        >
    </cffunction>
</cfcomponent>