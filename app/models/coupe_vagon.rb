class CoupeVagon < Vagon
  validates :top_seats, :bottom_seats, presence: true
end