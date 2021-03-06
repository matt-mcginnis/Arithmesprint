Rails.application.routes.draw do
  post 'challenge_create' => 'challenge#create'
  get 'challenge_run' => 'challenge#run'
  match 'outcome' => 'challenge#outcome', via: [:post, :get]
  get 'challenge_invite' => 'challenge#invite'
  get 'challenge_accept' => 'challenge#accept'
  get 'challenge_decline' => 'challenge#decline'

  post 'posts' => 'headquarters#create_posts'
  get 'posts' => 'headquarters#posts'

  get 'main' => 'headquarters#main'
  get 'all_users' => 'headquarters#all_users'
  get 'show_user' => 'headquarters#show_user'
  get 'friend_invite' => 'headquarters#friend_invite'
  get 'friend_accept' => 'headquarters#friend_accept'
  get 'friend_decline' => 'headquarters#friend_decline'
  get 'unfriend' => 'headquarters#unfriend'
  get 'requests_and_invitations' => 'headquarters#requests_and_invitations'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'headquarters#main'
end
