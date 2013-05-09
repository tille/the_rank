require 'spec_helper'

module RequestHelpers

  def create_valid_db
    Capybara.reset_sessions!
    @contest = FactoryGirl.create(:contest)
    @category = FactoryGirl.create(:category, contest_id: @contest.id)
    @character1 = FactoryGirl.create(:character, category_id: @category.id)
    @character2 = FactoryGirl.create(:character, category_id: @category.id)
    @battle = FactoryGirl.create(:battle, contester1: @character1.id, contester2: @character2.id, category_id: @category.id)
  end
end