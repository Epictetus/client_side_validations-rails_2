require 'base_helper'
require 'active_record'

# Connection must be establised before anything else
ActiveRecord::Base.establish_connection(
  :adapter => defined?(JRUBY_VERSION) ? 'jdbcsqlite3' : 'sqlite3',
  :database => ':memory:'
)

require 'client_side_validations/rails_2/active_record'
require 'active_record/models/user'
require 'active_record/models/guid'

