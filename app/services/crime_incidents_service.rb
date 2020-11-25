class CrimeIncidentsService
  def self.get_crime_incidents
    response = HTTParty.get('https://data.openup.org.za/dataset/14ab1e0b-0526-4b5d-ade9-4c00af5e1392/resource/472ac8cd-cd61-4553-a32f-68019cbbf49f/download/8d9f-f6rq.json')
    JSON.parse(response.body)
  end
end
