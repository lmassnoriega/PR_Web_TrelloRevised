class Task < ActiveRecord::Base

	obfuscate_id
	
	belongs_to :user, class_name: "User", foreign_key: "author"
	belongs_to :assigned, class_name: "User", foreign_key: "responsible"
	
	def self.by_person(user_id)
    	where("user_id = :author OR responsible = :author", author: responsible)
  	end
	validates :title, :description, :responsible, :begindate, :duedate, :presence =>true
	validates :duration, :numericality => { :only_integer => true }	
	validate :valid_date_range_required

	def valid_date_range_required
	  if (begindate && duedate) && (duedate < begindate)
	    errors.add(:duedate, "must be later than Start Date")
	  end
	end
end
