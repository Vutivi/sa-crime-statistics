class CrimeIncidentsService
  def self.get_crime_incidents
    response = HTTParty.get('https://s3-eu-west-1.amazonaws.com/openup-ckan/openup-ckan/resources/472ac8cd-cd61-4553-a32f-68019cbbf49f/8d9f-f6rq.json?AWSAccessKeyId=AKIAYIFP5EK2O3A7YP4F&Expires=1606340033&Signature=GENxFbHF3HV0WBxni91Gxs9v4Tw%3D')
    JSON.parse(response.body)
  end
end
