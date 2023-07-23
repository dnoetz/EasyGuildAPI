Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  post '/add-to-roster' => 'characters#addCharacter'
  delete '/remove-from-roster' => 'characters#removeCharacter'
  put '/update-character' => 'characters#updateCharacter'

  post '/create-roster' => 'rosters#createRoster'
  get 'view-roster' => 'rosters#index'
end
