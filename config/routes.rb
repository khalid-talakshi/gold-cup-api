Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/teams" => "teams#index"
  get "/teams/:id" => "teams#show"
  get "/players/:id" => "players#show"
  get "/teams/:id/players" => "teams#players"
  get "/user" => "users#show"
  get "/people" => "users#index"
  get "/people/approved" => "users#get_approved_people"
  get "/person" => "users#index"
  get "/person/:id/players/:player_id" => "players#show"
  get "/person/:id" => "people#show"
  get "/files/get" => "files#get_file"
  get "/teams" => "user#get_teams"
  get "/person/:id/players" => "players#index"
  get "/players" => "users#get_all_players"
  get "/person/:id/coaches" => "coaches#index"
  get "/person/:id/coaches/:coach_id" => "coaches#show"

  post "/team/new" => "teams#create"
  post "/login" => "users#login"
  post "/register" => "users#create"
  post "/person/new" => "people#create"
  post "/files/token" => "files#create_token"
  post "/user/request_team_manager_permissions" => "users#request_team_manager_permissions"
  post '/players/new' => 'players#create'
  post "team/token" => "teams#get_team_from_token"
  post "/coaches/new" => "coaches#create"

  put "/teams/:id" => "teams#update"
  put "/give_team_manager_permission" => "users#give_team_manager_permission"
  put "/person/:id" => "people#update"
  put "/person/:id/players/:player_id" => "players#update"
  put "/person/:id/coaches/:coach_id" => "coaches#update"

  delete "/person/:id" => "people#destroy"
  delete "/team/:id" => "teams#destroy"
  delete "/player/:player_id" => "players#destroy"
end
