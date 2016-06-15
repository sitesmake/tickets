class Vagon < ActiveRecord::Base
  def self.types
    %w(CoupeVagon PlatzkartVagon SvVagon SittingVagon)
  end

  belongs_to :train

  # validates :number, uniqueness: { scope: :train_id }

  before_save :set_number

  scope :coupes, -> { where(type: 'CoupeVagon')}
  scope :platzkarts, -> { where(type: 'PLatzkartVagon')}
  scope :svs, -> { where(type: 'SvVagon')}
  scope :sittings, -> { where(type: 'SittingVagon')}

  private

  def set_number
    # binding.remote_pry
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
