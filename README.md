# ColdFusion Todo Application

A beautiful, feature-rich todo application built with ColdFusion, featuring a modern UI and robust functionality.

![Todo App Screenshot](assets/Screenshot%202024-10-10%20at%2010-06-55%20Elegant%20Todo%20App.png)

## Features

- ✨ Modern, responsive UI using Tailwind CSS
- ✅ Create, read, update, and delete todos
- 📝 Add detailed descriptions to todos
- ⏱️ Automatic timestamp tracking for creation and completion
- 🔍 Sort todos by creation date
- 🔒 SQL injection prevention using cfqueryparam
- 📱 Mobile-friendly design

## Prerequisites

- ColdFusion server (Tested on Adobe ColdFusion 2021, but should work on 2018+ and Lucee 5+)
- MySQL/MariaDB database
- Web server (Apache, IIS, etc.)

## Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/coldfusion-todo-app.git
   ```

2. **Database Setup**
   - Create a new database named `todoDB` in your MySQL server
   - Configure the datasource in your ColdFusion Administrator:
     1. Log in to the ColdFusion Administrator
     2. Navigate to Data Sources
     3. Add a new data source:
        - Data Source Name: todoDB
        - Driver: MySQL
        - Database: todoDB
        - Server: localhost (or your database server)
        - Username and Password: Your database credentials

3. **Application Setup**
   - Copy all files to your web server's root directory or a subdirectory
   - Ensure the ColdFusion server has write permissions to the directory

## Project Structure

```
coldfusion-todo-app/
│
├── Application.cfc        # Application framework file
├── index.cfm             # Main page with UI and todo list
├── addTodo.cfm           # Handles adding new todos
├── toggleTodo.cfm        # Handles marking todos complete/incomplete
└── deleteTodo.cfm        # Handles deleting todos
```

## Database Schema

The application automatically creates the required table with the following structure:

```sql
CREATE TABLE todos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    completed_at TIMESTAMP NULL,
    is_completed BOOLEAN DEFAULT FALSE
)
```

## Usage

1. Access the application through your web browser
2. Add new todos using the form at the top of the page
3. Mark todos as complete/incomplete by clicking the circle icon
4. Delete todos by clicking the trash icon
5. View creation and completion timestamps for each todo

## Customization

### Styling
The application uses Tailwind CSS for styling. To modify the appearance:
1. Locate the CSS classes in index.cfm
2. Modify the classes according to Tailwind CSS documentation

### Adding New Features
Common feature additions might include:
- Categories for todos
- Due dates
- Priority levels
- User authentication

Example of adding a due date feature:

1. Update the database schema:
```sql
ALTER TABLE todos ADD COLUMN due_date DATE;
```

2. Modify the form in index.cfm:
```coldfusion
<cfinput type="date" name="dueDate">
```

3. Update addTodo.cfm to handle the new field:
```coldfusion
<cfquery>
    INSERT INTO todos (title, description, due_date)
    VALUES (
        <cfqueryparam value="#form.title#" cfsqltype="CF_SQL_VARCHAR">,
        <cfqueryparam value="#form.description#" cfsqltype="CF_SQL_LONGVARCHAR">,
        <cfqueryparam value="#form.dueDate#" cfsqltype="CF_SQL_DATE">
    )
</cfquery>
```

## Security Considerations

- All database queries use cfqueryparam to prevent SQL injection
- Form inputs are validated both client-side and server-side
- Consider adding authentication for multi-user environments

## Performance Optimization

- Database indexes are automatically created on the id column
- Consider adding indexes for frequently queried columns if expanding the application
- Use caching for frequently accessed, rarely changed data

## Troubleshooting

Common issues and solutions:

1. **Database Connection Error**
   - Verify datasource configuration in ColdFusion Administrator
   - Check database credentials
   - Ensure the database server is running

2. **Page Not Found Error**
   - Verify file permissions
   - Check if ColdFusion service is running
   - Ensure proper URL mapping in web server configuration

## Contributing

1. Fork the repository
2. Create a new branch
3. Make your changes
4. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE.md file for details

## Support

For support, please open an issue in the GitHub repository or contact [your-email@example.com]

---

## Changelog

### 1.0.0 (2024-03-14)
- Initial release
- Basic CRUD functionality for todos
- Responsive UI with Tailwind CSS

