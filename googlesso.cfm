<cfoauth  Type="Google"  clientid=""  
scope="email"   result="session.googleAccnt" secretKey = "">

<cfif structKeyExists(session,"googleAccnt")>
    <cflocation  url="login.cfm" addtoken = "no">
</cfif>