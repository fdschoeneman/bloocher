require 'google/api_client'

client = Google::APIClient.new(
  :application_name => "Bloocher",
  :key => 'AIzaSyDu8IFCALXESDHzBKfkGQDEkDjTQC2HfLk',
  :authorization => nil

)

urlshortener = client.discovered_api('urlshortener', 'v1')

result = client.execute(
  :api_method => urlshortener.url.insert,
  :body_object => {
    'longUrl' => 'https://www.blooocher.com/wines/1'
  }
)

puts result.body