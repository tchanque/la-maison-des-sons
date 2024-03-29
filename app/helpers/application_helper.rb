module ApplicationHelper
  
  def event_jsonld(event)
    {
      "@context": "http://schema.org",
      "@type": "MusicEvent",
      "name": event.category,
      "description": event.description,
      "organizer": {
        "@type": "Person",
        "email": event.creator.email
      },
      "duration": event.duration,
      "startDate": event.start_date.to_s,
      "location": event.location,
      "maximumAttendeeCapacity": event.max_seats,
      "remainingAttendeeCapacity": event.available_seats
      # Ajout d'autres propriétés ici selon les besoins
    }.to_json.html_safe
  end
end