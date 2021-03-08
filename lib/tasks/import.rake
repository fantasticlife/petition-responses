require 'net/http'
require 'json'

task :import => [
  :import_current_parliament,
  :import_previous_parliaments
]

task :import_current_parliament => :environment do
  puts "importing petitions from current Parliament"
  parliament = 4
  url = "https://petition.parliament.uk/petitions.json?state=with_response"
  get_petitions( parliament, url )
end

task :import_previous_parliaments => :environment do
  puts "importing petitions from previous Parliaments"
  parliaments = [1, 2, 3]
  parliaments.each do |parliament|
    url = "https://petition.parliament.uk/archived/petitions.json?parliament=#{parliament}&state=with_response"
    get_petitions( parliament, url )
  end
end

def get_petitions( parliament, url )
  uri = URI(url)
  response = Net::HTTP.get(uri)
  response = JSON.parse(response)
  response['data'].each do |petition|
    create_petition( parliament, petition )
  end
  if response["links"]["next"]
    get_petitions( parliament, response["links"]["next"] )
  end
end

def create_petition( parliament, petition_json )
  petition = Petition.new
  petition.parliament = parliament
  petition.petition_id = petition_json["id"]
  petition.url = petition_json["links"]["self"]
  petition.action = petition_json["attributes"]["action"]
  petition.signature_count = petition_json["attributes"]["signature_count"]
  petition.created_at = petition_json["attributes"]["created_at"]
  petition.opened_at = petition_json["attributes"]["opened_at"]
  petition.closed_at = petition_json["attributes"]["closed_at"]
  petition.moderation_threshold_reached_at = petition_json["attributes"]["moderation_threshold_reached_at"]
  petition.response_threshold_reached_at = petition_json["attributes"]["response_threshold_reached_at"]
  petition.government_response_at = petition_json["attributes"]["government_response_at"]
  petition.government_response_on = petition_json["attributes"]["government_response"]["responded_on"]
  petition.government_response_summary = petition_json["attributes"]["government_response"]["summary"]
  petition.save
end