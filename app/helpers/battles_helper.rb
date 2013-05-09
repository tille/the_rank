module BattlesHelper
  def contester_name c_id
    Character.find(c_id).name
  end
end
