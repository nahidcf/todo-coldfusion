<cfif structKeyExists(form, "title")>
    <cfquery>
        INSERT INTO todos (title, description)
        VALUES (
            <cfqueryparam value="#form.title#" cfsqltype="CF_SQL_VARCHAR">,
            <cfqueryparam value="#form.description#" cfsqltype="CF_SQL_LONGVARCHAR">
        )
    </cfquery>
    <cflocation url="index.cfm" addToken="false">
</cfif>