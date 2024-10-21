<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Elegant Todo App</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/alpinejs/2.3.0/alpine.js"></script>
</head>
<body class="bg-gray-100 min-h-screen py-6 flex flex-col justify-center sm:py-12">
    <div class="relative py-3 sm:max-w-xl sm:mx-auto">
        <div class="absolute inset-0 bg-gradient-to-r from-cyan-400 to-light-blue-500 shadow-lg transform -skew-y-6 sm:skew-y-0 sm:-rotate-6 sm:rounded-3xl"></div>
        <div class="relative px-4 py-10 bg-white shadow-lg sm:rounded-3xl sm:p-20">
            <div class="max-w-md mx-auto">
                <div class="divide-y divide-gray-200">
                    <div class="py-8 text-base leading-6 space-y-4 text-gray-700 sm:text-lg sm:leading-7">
                        <h1 class="text-3xl font-extrabold text-gray-900 mb-8">Elegant Todo List</h1>
                        
                        <!--- Form to add new todo --->
                        <cfform action="addTodo.cfm" method="post" class="mb-8">
                            <div class="mb-4">
                                <label class="block text-gray-700 text-sm font-bold mb-2" for="title">
                                    Title
                                </label>
                                <cfinput type="text" name="title" required="true" 
                                    class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                            </div>
                            <div class="mb-4">
                                <label class="block text-gray-700 text-sm font-bold mb-2" for="description">
                                    Description
                                </label>
                                <cfinput name="description" class="shadow appearance-none border rounded w-full py-5 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                            </div>
                            <div class="flex items-center justify-between">
                                <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" type="submit">
                                    Add Todo
                                </button>
                            </div>
                        </cfform>

                        <!--- Display todos --->
                        <cfquery name="getTodos">
                            SELECT * FROM todos ORDER BY created_at DESC
                        </cfquery>
                        
                        <div class="space-y-4">
                            <cfoutput query="getTodos">
                                <div class="bg-white p-4 rounded-lg shadow-md flex items-center justify-between">
                                    <div class="flex-1">
                                        <h3 class="text-lg font-semibold #IIF(is_completed, DE('text-gray-400'), DE('text-gray-800'))#">
                                            #title#
                                        </h3>
                                        <p class="text-gray-600 text-sm">#description#</p>
                                        <div class="text-xs text-gray-400 mt-1">
                                            Created: #DateFormat(created_at, "mmm d, yyyy")# at #TimeFormat(created_at, "h:mm tt")#
                                            <cfif is_completed>
                                                <br>Completed: #DateFormat(completed_at, "mmm d, yyyy")# at #TimeFormat(completed_at, "h:mm tt")#
                                            </cfif>
                                        </div>
                                    </div>
                                    <div class="ml-4">
                                        <form action="toggleTodo.cfm" method="post" class="inline">
                                            <input type="hidden" name="id" value="#id#">
                                            <button type="submit" class="text-sm p-1">
                                                <i class="fas #IIF(is_completed, DE('fa-check-circle text-green-500'), DE('fa-circle text-gray-300'))# text-xl"></i>
                                            </button>
                                        </form>
                                        <form action="deleteTodo.cfm" method="post" class="inline">
                                            <input type="hidden" name="id" value="#id#">
                                            <button type="submit" class="text-sm text-red-500 p-1">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </cfoutput>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>