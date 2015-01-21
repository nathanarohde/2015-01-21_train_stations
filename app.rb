require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/station")
require("./lib/line")
require("pg")

DB = PG.connect({:dbname => "trains"})

get('/') do
  @lines = Line.all()
  erb(:index)
end

post("/lines") do
  line_info = params.fetch("line_info")
  line = Line.new({:line_info => line_info, :id => nil})
  line.save()
  @lines = Line.all()
  erb(:index)
end

get("/lines/:id") do
  @line =Line.find(params.fetch("id").to_i())
  erb(:line)
end

get("/lines/:id/edit") do
  @line = Line.find(params.fetch("id").to_i())
  erb(:line_edit)
end


patch("/lines/:id") do
  line_info = params.fetch("line_info")
  @line = Line.find(params.fetch('id').to_i())
  @line.update({:line_info => line_info})
  erb(:line)
end

delete("/lines/:id") do
  @line = Line.find(params.fetch("id").to_i())
  @line.delete()
  @lines = Line.all()
  erb(:index)
end

# post("/stations") do
#   station_info = params.fetch("station_info")
#   line_id = params.fetch("line_id").to_i()
#   station = Station.new({:station_info => station_info, :line_id => line_id})
#   station.save()
#   @line = Line.find(line_id)
#   erb(:line)
# end
