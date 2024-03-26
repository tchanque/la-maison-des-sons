require "administrate/base_dashboard"

class EventDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    attendances: Field::HasMany,
    attendees: Field::HasMany,
    available_seats: Field::Number,
    category: Field::String,
    creator: Field::BelongsTo,
    description: Field::Text,
    duration: Field::Number,
    instrument: Field::String,
    level: Field::Number,
    location: Field::String,
    max_seats: Field::Number,
    price: Field::Number,
    start_date: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    category
    instrument
    available_seats
    attendees
    start_date
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    attendances
    attendees
    available_seats
    category
    creator
    description
    duration
    instrument
    level
    location
    max_seats
    price
    start_date
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    attendances
    attendees
    available_seats
    category
    creator
    description
    duration
    instrument
    level
    location
    max_seats
    price
    start_date
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how events are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(event)
    "#{event.category} #{event.instrument} #{event.start_date}"
  end

  def self.resource_name(_opts)
    "Evènements"
  end
end
