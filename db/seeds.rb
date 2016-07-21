file_path = APP_ROOT.join('db', 'urls.txt')
file = IO.readlines(file_path)

file.each do |line|
	line.gsub!("(", "")
	line.gsub!("),\n", "")
	Url.create(long_url: line, shortened_url: Url.shorten, click_count: 0)
end

