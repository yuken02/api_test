class Todo < ApplicationRecord

  include RankedModel
  ranks :row_order

  acts_as_list
    validates :title, presence: true, length: { maximum: 50 }
    
  scope :sorted, -> { order(position: :asc) }

end
