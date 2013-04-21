class ContestsController < ApplicationController
  def index
    @contests = Contest.all
  end
  
  # @c1,@c2 are the characters to show
  def show
    @category = Contest.find( params[:id] ).category
    @characters = @category.characters
    c2 = c1 = Random.rand(1..@characters.count)
    c2 = Random.rand(1..@characters.count) while c1 == c2
    @c1 = Character.find(c1)
    @c2 = Character.find(c2)
  end
end