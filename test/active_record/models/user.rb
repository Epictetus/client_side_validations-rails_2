users_table = %{CREATE TABLE users (id INTEGER PRIMARY KEY, age INTEGER, name TEXT, email TEXT, title VARCHAR(5));}
ActiveRecord::Base.connection.execute(users_table)

class User < ActiveRecord::Base

end
