class Pet < ApplicationRecord
  belongs_to :shelter
  has_many :adoptions
  has_many :applications, through: :adoptions

  validates_presence_of :name, :description, :approximate_age, :sex

  validates :approximate_age, numericality: {
              greater_than_or_equal_to: 0
            }

  enum sex: [:female, :male]

  def self.filter_by_name(query)
    where('name like ?', "%#{query}%")
  end
end
