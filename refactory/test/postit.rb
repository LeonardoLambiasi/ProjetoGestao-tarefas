require File.expand_path('../../src/classes', __FILE__)

describe DashBoardTODO do
    it "Should include a postit with name A3" do
	dashBoardTODO = DashBoardTODO.new
	addedPostit = dashBoardTODO.add 'A3'

	expect(addedPostit.name).to eq('A3')
    end
end

