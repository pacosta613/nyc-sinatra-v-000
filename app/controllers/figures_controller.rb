class FiguresController < ApplicationController

  get '/figures' do 
    @figure = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all 
    erb :'/figures/new'
  end
  
  post '/figures' do
    @figure = Figure.create(params[:figure])
    @figure.titles << Title.create(params[:title])
    @figure.landmarks << Landmark.create(params[:landmark])
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id' do 
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/:edit' do 
    @figure = Figure.find_by_id(params[:id])
    erb :'/figres/edit'
  end
  
  post '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.name = params[:figure][:name]
    @figure.landmarks = []
    @figure.titles = []
    @figure.titles.push((Title.find_or_create_by(:id => params[:figure][:title_ids])), (Title.find_or_create_by(:name => params[:figure][:title])))
    @figure.landmarks.push((Landmark.find_or_create_by(:id => params[:figure][:landmark_ids])), (Landmark.find_or_create_by(:name => params[:figure][:landmark])))
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end
end