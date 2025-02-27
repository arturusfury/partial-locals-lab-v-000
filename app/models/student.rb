# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  validates_presence_of :name, :birthday, :hometown

  def self.search(query)
    if query.present?
      where('NAME like ?', "%#{query}%")
    else
      all
    end
  end
end
