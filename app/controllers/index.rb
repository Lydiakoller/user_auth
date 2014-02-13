get '/' do
  # render home page
 #TODO: Show all users if user is signed in
   @users = User.all 
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  
  erb :sign_in
end

post '/sessions' do
  @users = User.all 
  @user = User.find_by(params[:user])
  session[:user_id] = @user.id 
  erb :index
  # sign-in
end

delete '/sessions/:id' do
  session.clear
  redirect '/'
  # sign-out -- invoked via AJAX
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  erb :sign_up
end

post '/users' do
  # @users = User.all 
  user = User.create(params[:user])
  session[:user_id] = user.id

 
   redirect '/'
end
