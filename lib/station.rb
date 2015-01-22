class Station
  attr_reader(:station_info,:line_id, :station_id)

  define_method(:initialize) do |attributes|
    @station_info = attributes.fetch(:station_info)
    @line_id = attributes.fetch(:line_id)
    @station_id = attributes.fetch(:station_id)
  end

  define_singleton_method(:all) do
    returned_stations = DB.exec("SELECT * FROM stations;")
    stations = []
    returned_stations.each() do |station|
      station_info = station.fetch("station_info")
      line_id = station.fetch("line_id").to_i()
      station_id = station.fetch("id").to_i()
      stations.push(Station.new({:station_info => station_info, :line_id => line_id, :station_id => station_id}))
    end
  stations
  end

  define_method(:save) do
    DB.exec("INSERT INTO stations (station_info, line_id, id) VALUES ('#{@station_info}', #{@line_id}, #{@station_id})")
  end

  define_method(:==) do |another_station|
    self.station_info().==(another_station.station_info()).&(self.line_id().==(another_station.line_id())).&(self.station_id().==(another_station.station_id()))
  end

  define_method(:times) do
    station_times = []
    times = DB.exec("SELECT * FROM train_time WHERE line_id = #{self.id()};")
    times.each() do |time|
      train_time = time.fetch("train_time")
      station_id = time.fetch("id").to_i()
      station_times.push(Times.new({:train_time => train_time, :station_id => station_id}))
    end
    station_times
  end

end
