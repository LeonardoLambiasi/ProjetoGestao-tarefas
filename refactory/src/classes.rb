class Postit
    attr_accessor :name
    attr_accessor :id
end


class DashBoardTODO
    def add(name)
        newPostit = Postit.new
        newPostit.name = name
        newPostit
    end
end
