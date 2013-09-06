class Activity < ActiveRecord::Base
  has_many :children,
  	class_name: "Activity", foreign_key: "parent_id"

  belongs_to :parent, class_name: "Activity", foreign_key: "parent_id"

  has_many :sessions
end
