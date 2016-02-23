class LandmarksController < ApplicationController

  get '/landmarks' do 
    @landmark = LandMark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do 
    erb :'/landmarks/new'
  end

  post '/landmarks/new' do 
    @landmark = LandMark.create(params[:landmark])
    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do 
    @landmark = LandMark.find_by_id(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/:edit' do 
    @landmark = LandMark.find_by_id(params[:id])
    erb :'/landmarks/edit'
  end

  post '/landmarks/:id' do 
    @landmark = LandMark.find_by_id(params[:id])
    @landmark.name = params[:landmark][:name]
    @landmark.year_completed = params[:landmark][:year_completed]
    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end

end