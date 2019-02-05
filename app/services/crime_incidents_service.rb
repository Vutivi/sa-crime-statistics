class CrimeIncidentsService
  def self.get_crime_incidents
    response = HTTParty.get('https://data.code4sa.org/resource/fgg4-qjnk.json/')
    JSON.parse(response.body)
  end
end
