class GroupEvent < ActiveRecord::Base
  attr_accessible :description, :end_at, :is_archived, :is_draft, :is_published, :location, :name, :start_at

  validates :name, :presence => true, :unless => :is_draft?
  validates :description, :presence => true, :unless => :is_draft?
  validates :start_at, :presence => true, :unless => :is_draft?
  validates :end_at, :presence => true, :unless => :is_draft?
  validates :location, :presence => true, :unless => :is_draft?

end
