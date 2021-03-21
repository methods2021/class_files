import DBInterface
import MySQL

function with_password(f::F) where {F <: Function}
    Sys.iswindows() && throw(ErrorException("This function is not secure on Windows."))
    password_secretbuffer = Base.getpass("Please enter your password")
    result = f(password_secretbuffer)
    Base.shred!(password_secretbuffer)
    return result
end

"""
    open_mysql_connection(; host::AbstractString, user::AbstractString)

Open a connection to the specified MYSQL server.

When you are done with the connection, please make sure to close the connection
with `close_mysql_connection!(conn)`
"""
function open_mysql_connection(; host::AbstractString, user::AbstractString)
    return with_password() do password_secretbuffer
        return DBInterface.connect(
            MySQL.Connection,
            host,
            user,
            String(read(password_secretbuffer));
            opts = Dict(MySQL.API.MYSQL_ENABLE_CLEARTEXT_PLUGIN => "true"),
            ssl_enforce = true,
        )
    end
end

"""
    close_mysql_connection!(conn)

Close the given MySQL connection.
"""
function close_mysql_connection!(conn)
    return DBInterface.close!(conn)
end

"""
    mysql_execute(conn, sql_statement)

Execute the given SQL statement and return the result
```
"""
function mysql_execute(conn, sql_statement)
    return DBInterface.execute(conn, sql_statement)
end
