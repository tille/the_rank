class VotesController < ApplicationController
  def create
    @vote = Vote.new(params[:vote])
    if @vote.save
      redirect_to contests_path
    else
      redirect_to root_path
    end
  end  
end