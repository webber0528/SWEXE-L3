class TweetsController < ApplicationController
  require 'date'
  
  def index
    @tweets = Tweet.all
  end
  
  def new
    @tweets = Tweet.new
  end
  
  def create
    
    @tweets =  Tweet.new(message: params[:tweet][:message], tdate: Time.current)

    if @tweets.save
      flash[:notice] = '1レコード追加しました'
      redirect_to '/'
    else
      render 'new'
    end
    
  end
  
  def destroy
    @tweets = Tweet.find(params[:id])
    @tweets.destroy
    flash[:notice] = '1レコード削除しました'
    redirect_to '/'
  end
  
  def show
    @tweets = Tweet.find(params[:id])
  end 
  
  def edit
    @tweets = Tweet.find(params[:id])
  end
  
  def update
    @tweets = Tweet.find(params[:id])
    @tweets.update(message: params[:tweet][:message], tdate: Time.current) 
    if @tweets.save
      flash[:notice] = '1レコード更新しました'
      redirect_to '/' 
    else 
      render 'edit'
    end
  end
  
end
