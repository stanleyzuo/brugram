class Photo < ActiveRecord::Base
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  	has_and_belongs_to_many :hashtags
  	has_many :comments

  	def liked!
		if self.likes == nil
			story = self
			story.likes = 0
			story.save
		else
			story = self
			story.likes = story.likes + 1
			story.save
		end
	end
end
