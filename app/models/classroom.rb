class Classroom < ActiveRecord::Base
  belongs_to :user
  has_many :students, dependent: :destroy
end
