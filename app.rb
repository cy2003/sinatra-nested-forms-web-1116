require './environment'

module FormsLab
  class App < Sinatra::Base

    get '/' do
      erb :root
    end

    get '/new' do
      erb :'/pirates/new'
      # because it goes through the pirates folder before it reaches new.erb
    end

    post '/pirates' do
      # params =>
      # {"pirate"=>
        #{"name"=>"Ian",
        # "weight"=>"165",
        # "height"=>"95",
        # "ships"=>[{"name"=>"Titanic", "type"=>"Steam Liner", "booty"=>"Silver"}, {"name"=>"Carpathia", "type"=>"Rescue Ship", "booty"=>"Inner Tubes"}]}}
      @pirate = Pirate.new(params['pirate']['name'], params['pirate']['weight'], params['pirate']['height'])
      ships = params['pirate']['ships']
      @ship1 = Ship.new(ships[0]['name'],ships[0]['type'],ships[0]['booty'])
      @ship2 = Ship.new(ships[1]['name'],ships[1]['type'],ships[1]['booty'])
      erb :'/pirates/show'
    end

  end
end
