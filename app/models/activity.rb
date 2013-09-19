class Activity < ActiveRecord::Base

  acts_as_tree :order => "name"

  scope :available_parents => { where("id != ?", id) }

  has_many :sessions
end
