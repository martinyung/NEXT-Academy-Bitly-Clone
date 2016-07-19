require 'byebug'
enable :sessions

get '/' do
	@messages = session[:errors]
  erb :"static/index"
end

post '/urls' do
	url = Url.create(long_url: params["long_url"], shortened_url: Url.shorten, click_count: 0)
	session[:errors] = url.errors.messages[:long_url]
	redirect '/'
end

get '/:shortened_url' do
	target = Url.find_by(shortened_url: params['shortened_url'])
	target.click_count += 1
	target.save!
	redirect target.long_url
end