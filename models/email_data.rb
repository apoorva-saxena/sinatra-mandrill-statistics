class EmailData
  include DataMapper::Resource
   property :id, Serial
   property :address, String, required: true
   property :email_type, String, required: true
   property :event, String, required: true
   property :timestamp, Integer, required: true
end
