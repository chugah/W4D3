# Homepage (Root path)
require 'pry'
require 'securerandom'
require 'sinatra/authorization'

enable :sessions

def user_authenticate!
  redirect '/login' unless session.has_key?(:session_token)
  if !session.has_key?(:user_session) || !User.find_by_session_token(session[:session_token])
    redirect '/login'
  end
end

get '/' do
  redirect '/protected'
end

get '/login' do
  erb :index
end

get '/protected' do
  user_authenticate!
end

get '/401' do
  erb :fail401
end

post '/session' do
  user = User.find_by_email(params[:email].downcase)
  if user && user.authenticate(params[:password])
    session[:session_token] = SecureRandom.urlsafe_base64()
    user.update!(session_token: session[:session_token])
    redirect '/protected'
  else
    redirect '/401'
  end
end

get '/session/sign_out' do
  User.find_by_session_token(session[:session_token]).update!(session_token: nil)
  session.clear
  redirect '/login'
end

get '/register' do
	erb :register
end

post '/login' do
  @tracks = Track.all
  redirect '/tracks'
end

post '/register' do
  redirect '/tracks'
end

get '/tracks' do
  @tracks = Track.all
  erb :'tracks/index'
end

get '/tracks/new' do
  @track = Track.new
  erb :'/tracks/new'
end

post '/tracks/new' do
  @track = Track.new(
    artist: params[:artist],
    title: params[:title],  
    url: params[:url] 
    )
    if @track.save
	  redirect ('/tracks')
	else
	  erb :'tracks/new'
	end
end

get '/tracks/:id/upvote' do
  upvote = Upvote.new(user_id: current_user.id, song_id: params[:id])
  if upvote.save
    redirect to('/tracks')
  else
    redirect to('/tracks')
  end
end

get '/tracks/:id/downvote' do
  downvote = Downvote.new(user_id: current_user.id, song_id: params[:id])
  if downvote.save
    redirect to('/tracks')
  else
    redirect to('/tracks')
  end
end

get '/logout' do
		erb :index
end



