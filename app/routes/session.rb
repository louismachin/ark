get '/login' do
    erb :login
end

post '/login' do
    login_params = params[:login] || {}
 
    username = login_params[:username]
    password = login_params[:password]

    puts username, password

    redirect '/'
end