ENV['RACK_ENV'] ||= 'dev'
require 'sinatra/base'
require './data_mapper_setup'
require './models/email_data'
require 'json'

class MandrillStatistics < Sinatra::Base

  # curl --data "Address=barney@lostmy.name&EmailType=Shipment&Event=send&Timestamp=1432820696" localhost:4567/email_data
    # curl --data "Address=barney@lostmy.name&EmailType=Shipment&Event=click&Timestamp=1432820696" localhost:4567/email_data
    # curl --data "Address=barney@lostmy.name&EmailType=Shipment&Event=open&Timestamp=1432820696" localhost:4567/email_data

  post '/email_data' do
    body = request.body.read
    data = JSON.parse(body)
    email_data = EmailData.new(
      address: data["Address"],
      email_type: data["EmailType"],
      event: data["Event"],
      timestamp: data["Timestamp"]
    )
    if email_data.save
      "Data saved successfully"
    else
      raise 'Invalid data format!'
    end
  end

  get '/' do
    @overview_map = {
      'sent' => EmailData.all(:event=>"sent").count,
      'opened' => EmailData.all(:event=>"open").count,
      'clicked' => EmailData.all(:event=>"click").count
    }

    @stats_map = Hash.new(0)
    @open_map = Hash.new(0)
    @click_map = Hash.new(0)

    EmailData.each do |data|
      @stats_map[data.email_type] += 1
      if "open" == data.event
        @open_map[data.email_type] += 1
      elsif "click" == data.event
        @click_map[data.email_type] += 1
      end
    end
    erb :index
  end

  run! if app_file == $0
end
