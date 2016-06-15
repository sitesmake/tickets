class Vagon < ActiveRecord::Base
	TYPE = [:coupe, :platzkart, :sv, :sitting]

  belongs_to :train

  # validates :number, uniqueness: { scope: :train_id }

  before_save :set_number

  private

  def set_number
    binding.remote_pry
    number = (self.train.vagons.maximum('number').to_i rescue 0) + 1
  end

  # def self.type(id)
  # 	return "купейный" if id == 1
  # 	return "плацкартный" if id == 2
  # end

  # def type
  # 	Vagon.type(self.type_id)
  # end
end
