class Person < ActiveRecord::Base
  validates :name, :house, presence: true
  # validates :house, presence: true

  belongs_to :house,
    primary_key: :id,
    foreign_key: :house_id,
    class_name: :House

  # def house
  #   House.find(self.house_id)
  # end
end
