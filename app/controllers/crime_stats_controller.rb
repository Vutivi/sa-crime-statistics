class CrimeStatsController < ApiController

  def index
    render json: reports_data
  end

  def crime_by_name
    generate_report_data(grouped_by_key("crime", "incidents"))
  end

  def crime_by_province
    generate_report_data(grouped_by_key("province", "incidents"))
  end

  def crime_by_station
    generate_report_data(grouped_by_key("police_station", "incidents"))
  end

  def crime_by_year
    generate_report_data(grouped_by_key("year", "incidents"))
  end

  def reports_data
    [crime_by_name, crime_by_province, \
     crime_by_station, crime_by_year]
  end

  private

  # count incidents for each grouped crime
  # sort the returned hashes in a list and merge them
  def generate_report_data array
    (array.group_by { |h| h.keys.first }.map do |k, v|
      Hash[k, v.reduce(0) { |sum, n| sum + n.values.first.to_i }]
    end).sort_by!(&:zip).inject(:merge)
  end

  # group all crimes by given keys into array
  # keys include name, crime, incidents, police_station, year
  def grouped_by_key key, second_key
    array = Array.new.tap do |a|
      crime_incidents.each do |h|
        h.each{ |k, v| a << {truncate(h[key], 20) => h[second_key]} }
      end
    end
  end

  # long names of stations should not print everything
  def truncate(string, length = 20)
    string.size > length+5 ? [string[0,length],string[-5,5]].join("...") : string
  end

  def crime_incidents
    CrimeIncidentsService.get_crime_incidents
  end
end
