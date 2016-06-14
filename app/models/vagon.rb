class Vagon < ActiveRecord::Base
	TYPE = [:coupe, :platzkart, :sv, :sitting]

  belongs_to :train

  # def self.type(id)
  # 	return "купейный" if id == 1
  # 	return "плацкартный" if id == 2
  # end

  # def type
  # 	Vagon.type(self.type_id)
  # end
end
