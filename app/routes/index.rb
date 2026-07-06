get '/' do
    redirect '/iotas'
end

not_found do
    content_type :text
    'Not found'
end