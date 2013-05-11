class VotesController < ApplicationController
  def create
    @vote = Vote.new(params[:vote])
    if @vote.save
      redirect_to contest_path(@vote.contest_id)
    else
      redirect_to root_path
    end
  end  
end