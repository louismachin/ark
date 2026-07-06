User = Struct.new(:username, :password)

def get_users
    result = {}
    File.readlines(USERS_PATH).each { |line|
        username, password = line.chomp.split(' ', 2)
        result[username] = User.new(username, password)
    }
    return result
end

helpers do
    def protect!
        token = request.cookies[APP_COOKIE]
        return $known_cookies.key?(token)
    end

    def current_user
        return nil unless protect!
        token = request.cookies[APP_COOKIE]
        $known_cookies[token][:user]
    rescue
        return nil
    end

    def set_cookie(username)
        token = SecureRandom.hex(8)
        user = get_users[username]
        puts "set_cookie\tuser=#{user}"
        $known_cookies[token] = { user: user, time: Time.now }
        response.set_cookie(APP_COOKIE, value: token, path: '/', max_age: '3600')
    end

    def unset_cookie
        token = request.cookies[APP_COOKIE]
        $known_cookies.delete(token)
        response.delete_cookie(APP_COOKIE, path: '/')
    end

    def valid_user?(username, password)
        puts "valid_user?\tusername=#{username}\tpassword=#{password}"
        users = get_users
        return false unless users.key?(username)
        return users[username].password == password
    end
end

$known_cookies = {}

puts "Users:", get_users.keys

get '/login' do
    if current_user
        redirect '/'
    else
        erb :login
    end
end

post '/login' do
    login_params = params[:login] || {}
 
    username = login_params[:username]
    password = login_params[:password]
    
    if valid_user?(username, password)
        set_cookie(username)
        redirect '/'
    else
        redirect '/login'
    end
end

get '/logout' do
    unset_cookie
    redirect '/'
end