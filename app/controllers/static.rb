require 'byebug'

get '/' do
  erb :"static/index"
end

post '/urls' do
	Url.create(long_url: params["long_url"], shortened_url: Url.shorten)
	redirect '/'
end

get '/:shortened_url' do
	target = Url.find_by(shortened_url: params['shortened_url'])
	ori_url = target.long_url
	target.click_count = target.click_count.to_i + 1
	target.save!
	redirect ori_url
end