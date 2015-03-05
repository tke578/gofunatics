class Event < ActiveRecord::Base
	validates :name, :description, :location, :address,:city,:state,:zip_code, presence:true
	has_many :event_attendants
	has_many :posts,:dependent=>:destroy
	has_many :users, through: :event_attendants
	belongs_to :interest

	geocoded_by :location
 	after_validation :geocode, :if => :location_changed?

 	acts_as_gmappable :process_geocoding => false

 	# Event statuses
 	ACTIVE = 1
 	CANCELLED = 2

 	STATUSES = {
 		ACTIVE => 'Active',
 		CANCELLED => 'Cancelled'
 	} 

	validates_inclusion_of :status, :in => STATUSES.keys,
          :message => "{{value}} must be in #{STATUSES.values.join ','}"

    def status_name
    	STATUSES[status]
    end

    # Event types
    PUBLIC = 1
    PRIVATE = 2

    TYPES = {
    	PUBLIC => 'Public',
    	PRIVATE => 'Private'
    }

	validates_inclusion_of :event_type, :in => TYPES.keys,
          :message => "{{value}} must be in #{TYPES.values.join ','}"

    def type_name
    	TYPES[event_type]
    end

 	def location
 		[address,city,state,zip_code].compact.join(',')
 	end

	def gmaps4rails_address
	#describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
	  "#{self.address}, #{self.city}, #{self.state} #{self.zip_code}" 
	end
	def gmaps4rails_title
      "#{self.name}"
    end
	def gmaps4rails_infowindow
      "<h4>#{self.address},#{self.city}, #{self.state}, #{self.zip_code}</h4>"
  	end
	def gmaps4rails_sidebar
	  "<span class='foo'>#{self.name}</span>" #put whatever you want here
	end
end