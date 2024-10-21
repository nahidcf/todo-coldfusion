<cfcomponent>
    <cfset this.name = "TodoApp">
    <cfset this.datasource = "todo">
    <cfset this.sessionManagement = true>
    
    <cffunction name="onApplicationStart">
        
        <!--- database table creation --->
        <cfquery>
            CREATE TABLE IF NOT EXISTS todos (
                id INT AUTO_INCREMENT PRIMARY KEY,
                title VARCHAR(255) NOT NULL,
                description TEXT,
                created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                completed_at TIMESTAMP NULL,
                is_completed BOOLEAN DEFAULT FALSE
            )
        </cfquery>
    </cffunction>
</cfcomponent>