require("spec_helper")

describe(Station) do

  describe(".all") do
    it("is empty at frst") do
      expect(Station.all()).to(eq([]))
    end
  end

  describe('#station_info') do
    it("lets you enter the information about a station") do
      test_station = Station.new({:station_info => "Tokyo", :line_id => 1})
      expect(test_station.station_info()).to(eq("Tokyo"))
    end
  end

 describe('#==') do
   it("is the same station as station info") do
    station1 = Station.new({:station_info => "Tokyo", :line_id => 1})
    station2 = Station.new({:station_info => "Tokyo", :line_id => 1})
    expect(station1).to(eq(station2))
  end
end

  describe("#save") do
   it("adds a task to the array of saved stations") do
     test_station = Station.new({:station_info => "Tokyo", :line_id => 1})
     test_station.save()
     expect(Station.all()).to(eq([test_station]))
   end
 end

  describe('#line_id') do
    it("lets you see the lines") do
      test_station = Station.new({:station_info => "Tokyo", :line_id => 1})
      expect(test_station.line_id()).to(eq(1))
    end
  end

end 
