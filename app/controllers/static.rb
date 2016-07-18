require 'byebug'
get '/' do
  erb :"static/index"
end

post '/urls' do
	Url.create(long_url: params["long_url"], shortened_url: "www.bit.url/#{Url.shorten}")
	redirect '/'
end