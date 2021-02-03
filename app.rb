require './environment'

module FormsLab
  class App < Sinatra::Base

    get '/' do
      erb :root
    end


    get '/new' do
      erb :'pirates/new'
    end

    post "/pirates" do
      begin
        @pirate = Pirate.new(params[:pirate])

        params[:pirate][:ships].each do |details|
          Ship.new(details)
        end
      
        @ships = Ship.all

        erb :'pirates/show'
      rescue => error
        binding.pry
        puts "error"
        raise error
      end
    end
  end	  
end	
