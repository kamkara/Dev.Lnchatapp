class Question < ApplicationRecord
  belongs_to :user
  belongs_to :course

  #Slugged concern
  include ItemsSlugged

end
