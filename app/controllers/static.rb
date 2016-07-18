require 'byebug'

get '/' do
  erb :"static/index"
end

post '/urls' do
	Url.create(long_url: params["long_url"], shortened_url: Url.shorten)
	redirect '/'
end

get '/:shortened_url' do
	ori_url = Url.find_by(shortened_url: params['shortened_url']).long_url
	redirect 'https://' + ori_url
end