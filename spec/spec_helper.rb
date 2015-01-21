require("rspec")
require("pg")
require("line")
require("station")

DB = PG.connect({:dbname => "trains_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM lines *;")
    DB.exec("DELETE FROM stations *;")
  end
end
