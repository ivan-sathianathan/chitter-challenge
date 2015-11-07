require 'data_mapper'
require 'dm-postgres-adapter'

require './app/model/user'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")

DataMapper.finalize
