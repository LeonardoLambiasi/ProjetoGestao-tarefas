require '../service/dashboardtodo'
require '../service/postit'

describe DashBoardTODO do
	it "Should include a postit" do
		postit = Postit.new
		postit.name = 'A3'
		dashBoardTODO = DashBoardTODO.new
		dashBoardTODO.add postit

		expect(dashBoardTODO.list).to include(postit)
	end
end

