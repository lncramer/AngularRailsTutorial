class Post < ActiveRecord::Base
	has_many :comments

	def as_json(options = {})
		# Make all JSON representations of posts include the comments
		super(options.merge(include: :comments))
	end
end
