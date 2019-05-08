class FiguresController < ApplicationController
  
  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end
  
  post '/figures' do
    @figure = Figure.create(params[:figure])
    if params[:new_title].present?
      title = Title.create(params[:new_title])
      @figure.titles << title
    end
    if params[:new_landmark].present?
      landmark = Landmark.create(params[:new_landmark])
      @figure.landmarks << landmark
    end
    @figure.save
    
  end
  
end
