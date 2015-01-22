class Train_time
  attr_reader(:station_id, :train_time)

  define_method(:initialize) do |attributes|
    @train_time  = attributes.fetch(:train_time)
    @station_id = attributes.fetch(:station_id)
  end
