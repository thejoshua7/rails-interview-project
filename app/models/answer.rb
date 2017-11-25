class Answer < ApplicationRecord
  #alias_attribute :answerer, :user_id
  belongs_to :question
  belongs_to :user
  
end
