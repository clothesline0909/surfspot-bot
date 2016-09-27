Rails.application.routes.draw do

  get 'bot', to: 'v1/bot#receive'

end
