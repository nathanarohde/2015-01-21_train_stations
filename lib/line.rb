class Line
  attr_reader(:line_info, :id)

  define_method(:initialize) do |attributes|
    @line_info = attributes.fetch(:line_info)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_lines = DB.exec("SELECT * FROM lines;")
    lines = []
    returned_lines.each() do |line|
      line_info = line.fetch('line_info')
      id = line.fetch('id').to_i()
      lines.push(Line.new({:line_info => line_info, :id => id}))
    end
    lines
  end

  define_singleton_method(:find) do |id|
    Line.all().each() do |line|
      if line.id().==(id)
        @found_line = line
      end
    end
    @found_line
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO lines (line_info) VALUES ('#{@line_info}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_line|
    self.line_info().==(another_line.line_info()).&(self.id().==(another_line.id()))
  end

  define_method(:stations) do
    line_stations = []
    stations = DB.exec("SELECT * FROM stations WHERE line_id = #{self.id()};")
    stations.each() do |station|
      station_info = station.fetch("station_info")
      line_id = station.fetch("line_id").to_i()
      line_stations.push(Station.new({:station_info => station_info, :line_id => line_id}))
    end
    line_stations
  end

  define_method(:update) do |attributes|
    @line_info = attributes.fetch(:line_info)
    @id = self.id()
    DB.exec("UPDATE lines SET line_info = '#{@line_info}' WHERE id = #{@id};")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM lines WHERE id = #{self.id()};")
    DB.exec("DELETE FROM stations WHERE line_id = #{self.id()};")
  end
end
