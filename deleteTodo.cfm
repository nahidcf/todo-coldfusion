<cfif structKeyExists(form, "id")>
    <cfquery>
        DELETE FROM todos WHERE id = <cfqueryparam value="#form.id#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
    <cflocation url="index.cfm" addToken="false">
</cfif>