Rails.application.routes.draw do
  devise_for :users
  get 'posts/casual' => 'posts#casual'
  get 'posts/natural' => 'posts#natural'
  get 'posts/modern' => 'posts#modern'
  get 'posts/classic' => 'posts#classic'
  get 'posts/orthodox' => 'posts#orthodox'
  get 'posts/elegant' => 'posts#elegant'
  get 'posts/chic' => 'posts#chic'
  get 'posts/urban' => 'posts#urban'
  get 'posts/mannish' => 'posts#mannish'
  get 'posts/brooklyn' => 'posts#brooklyn'
  get 'posts/ethnic' => 'posts#ethnic'
  get 'posts/americanvintage' => 'posts#americanvintage'
  get 'posts/nisikaigan' => 'posts#nisikaigan'
  get 'posts/hokuou' => 'posts#hokuou'
  get 'posts/wamodern' => 'posts#wamodern'
  get 'posts/itarian' => 'posts#itarian'
  get 'posts/french' => 'posts#french'
  get 'posts/african' => 'posts#african'
  get 'posts/azian' => 'posts#azian'
  resources :users, only: [:show]
  resources :posts do
    resources :likes, only: [:create, :destroy]
  end
  root 'posts#index'

end
