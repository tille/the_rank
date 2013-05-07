class ContestsController < ApplicationController
  def index
    @contests = Contest.all
  end
  
  # @c1,@c2 are the characters to show
  def show
    @category = Contest.find( params[:id] ).category
    @battle = Battle.where( category_id: @category ).sample
    @c1 = Character.find(@battle.contester1)
    @c2 = Character.find(@battle.contester2)
    @winner = @battle.winner
  end
end