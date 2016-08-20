require 'data_mapper'
require 'dm-sqlite-adapter'
require './models/email_data'

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/emailstats.db#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
