get '/' do
    redirect '/iotas'
end

get '/settings' do
    erb :settings
end

get '/tags' do
    erb :tags
end

not_found do
    content_type :text
    'Not found'
end

get '/robots.txt' do
    content_type 'text/plain'
    "User-agent: *\nDisallow: /"
end