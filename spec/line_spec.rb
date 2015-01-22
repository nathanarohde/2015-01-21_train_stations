require("spec_helper")

describe("#Line") do
  describe(".all") do
    it ("starts off with no lines") do
      expect(Line.all()).to(eq([]))
    end
  end

  describe('.find') do
    it('returns a line by its ID number') do
      test_line = Line.new({:line_info => "Gold", :id => nil})
      test_line.save()
      test_line2 = Line.new({:line_info => "Blue", :id => nil})
      test_line2.save()
      expect(Line.find(test_line2.id())).to(eq(test_line2))
    end
  end

  describe('#line_info') do
    it('tells you its line') do
      line = Line.new({:line_info => "Gold", :id => nil})
      expect(line.line_info()).to(eq("Gold"))
    end
  end

  describe("#id") do
    it('sets its ID when you save it') do
      line = Line.new({:line_info => "Gold", :id => nil})
      line.save()
      expect(line.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#save') do
    it('lets you save lists to the database') do
      line = Line.new({:line_info => "Gold", :id => nil})
      line.save()
      expect(Line.all()).to(eq([line]))
    end
  end

  describe('#==') do
    it("is the same if it has the same line info") do
      line1 = Line.new({:line_info => "Gold", :id => nil})
      line2 = Line.new({:line_info => "Gold", :id => nil})
      expect(line1).to(eq(line2))
    end
  end

  describe('#stations') do
    it('returns an array of stations for that line') do
      test_line = Line.new({:line_info => 'Gold', :id => nil})
      test_line.save()
      test_station = Station.new({:station_info => "Tokyo", :line_id => test_line.id(), :station_id => 1})
      test_station.save()
      test_station2 = Station.new({:station_info => "Portland", :line_id => test_line.id(), :station_id => 2})
      test_station2.save()
      expect(test_line.stations()).to(eq([test_station, test_station2]))
    end
  end

  describe("#update") do
    it("lets you update lines in the database") do
      line = Line.new({:line_info => "Blue", :id => nil})
      line.save()
      line.update({:line_info => "Green"})
      expect(line.line_info()).to(eq("Green"))
    end
  end

  describe('#delete') do
    it("deletes a line's station from the database") do
      line = Line.new({:line_info => "Gold", :id => nil})
      line.save()
      station = Station.new({:station_info => "Portland", :line_id => line.id(), :station_id => 1})
      station.save()
      station2 = Station.new({:station_info => "Tokyo", :line_id => line.id(), :station_id => 2})
      station2.save()
      line.delete()
      expect(Station.all()).to(eq([]))
    end
  end
end
