<cfcomponent>
    <cffunction name = "scheduleDate" access="remote" returnType="void">
        <cfschedule action = "update" 
        task = "TaskName" 
        operation = "HTTPRequest" 
        url = "http://addressbook/checkSite.cfm" 
        startDate = "Now()" 
        startTime = "12:00 AM" 
        interval = "daily" 
        resolveURL = "Yes" 
        publish = "Yes"  
        >
    </cffunction>
</cfcomponent>