Rails.application.routes.draw do
  get 'main' => 'headquarters#main'
  get 'all_users' => 'headquarters#all_users'
  get 'show_user' => 'headquarters#show_user'
  get 'friend_invite' => 'headquarters#friend_invite'
  get 'friend_accept' => 'headquarters#friend_accept'
  get 'friend_decline' => 'headquarters#friend_decline'
  get 'unfriend' => 'headquarters#unfriend'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'headquarters#main'
end
