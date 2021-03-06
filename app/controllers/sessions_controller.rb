get '/login' do

	erb :'/sessions/login'
end

post '/login' do
	@user = User.find_by(email: params[:user][:email])
	if @user && @user.authenticate(params[:user][:password])
		session[:user_id] = @user.id
		redirect "/questions"
	else
    # binding.pry
		@errors = ["Wrong username, password or email!"]

		erb :'/sessions/login'
	end
end

get '/logout' do
  session.clear
  redirect '/'
end
