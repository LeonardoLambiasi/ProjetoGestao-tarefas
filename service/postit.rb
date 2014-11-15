class Postit
	attr_accessor :name
	attr_accessor :id

	def to_json
		{"name"=>@name,"id"=>@id}.to_json
	end
end