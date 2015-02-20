module EventsHelper

  def name(event)
    event['name']['text']
  end

  def street_address(event)
    event['venue']['address']['address_1']
  end

  def url(event)
    event['url']
  end

  def city(event)
    event['venue']['address']['city']
  end

  def state(event)
    event['venue']['address']['region']
  end

  def zip(event)
    event['venue']['address']['postal_code']    
  end

  def time(event)
    event['start']['local']
  end

end
