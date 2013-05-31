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
    @valid_vote = { contest_id: @category.contest, battle_id: @battle.id, ip: "127.0.0.1", user_id: Random.rand(10...10*100) }
  end
end