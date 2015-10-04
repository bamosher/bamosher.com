require 'date'
require 'time'

module Jekyll
  module UnixTimestampFilter
    def to_unix_timestamp(time)
      parsed_date = time.split

      puts "parsed_date[2] #{parsed_date[2]}"
      puts "Date::MONTHNAMES.index(parsed_date[1]) #{Date::MONTHNAMES.index(parsed_date[1])}"
      puts "parsed_date[0].sub!(/^[0]+/,'') #{parsed_date[0].sub!(/^[0]+/,'')}"

      puts "Date.new(#{parsed_date[2]}, #{Date::MONTHNAMES.index(parsed_date[1])}, #{parsed_date[0]}).to_time.to_i"

      Date.new(parsed_date[2], Date::MONTHNAMES.index(parsed_date[1]), parsed_date[0]).to_time.to_i
    end
  end
end

Liquid::Template.register_filter(Jekyll::UnixTimestampFilter)
