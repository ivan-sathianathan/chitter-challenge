class Chitter < Sinatra::Base
  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
      peep = Peep.new(
                        content: params[:content],
                        username: current_user.username,
                        time: Time.now
                      )
      peep.save
      redirect('/')
  end
end
