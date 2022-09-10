class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  #Enables implicit order column for UUID
  self.implicit_order_column = "created_at"

  scope :all_ordered, -> { all.order('created_at desc')}
  scope :feed, -> {where("status= ?", "Lune")}
end
