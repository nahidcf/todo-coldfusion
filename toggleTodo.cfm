<cfif structKeyExists(form, "id")>
    <cfquery name="checkStatus">
        SELECT is_completed FROM todos WHERE id = <cfqueryparam value="#form.id#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
    
    <cfquery>
        UPDATE todos
        SET 
            is_completed = <cfqueryparam value="#!checkStatus.is_completed#" cfsqltype="CF_SQL_BOOLEAN">,
            completed_at = <cfif !checkStatus.is_completed>CURRENT_TIMESTAMP<cfelse>NULL</cfif>
        WHERE id = <cfqueryparam value="#form.id#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
    <cflocation url="index.cfm" addToken="false">
</cfif>