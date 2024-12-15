<cfcomponent>
    
    <cffunction name="processData" access="remote" returntype="string" httpmethod="post">
        <!--- Get JSON data from the request body --->
        <cfset var data = deserializeJSON( trim( fileRead( getHTTPRequestData().fileContent ) ) )>
        
        <cfloop array="#data#" index="row">
            <!--- Extract row data (assuming the Excel file has columns 'Name' and 'Age') --->
            <cfset name1 = row["text1"]>
            <cfset name2 = row["text2"]>
            
            <!--- Insert data into the database --->
            <cfquery name="insertion">
                INSERT INTO contact (text1, text2)
                VALUES (<cfqueryparam value="#name1#" cfsqltype="cf_sql_varchar">, <cfqueryparam value="#name2#" cfsqltype="cf_sql_varchar">)
            </cfquery>
        </cfloop>

        <cfreturn "Data processed successfully!">
    </cffunction>
    
</cfcomponent>
