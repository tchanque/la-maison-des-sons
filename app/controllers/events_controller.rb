class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]

  # GET /events or /events.json
  def index
    @topics = Topic.all
    @events = []
    case params[:show_only]
      when 'week'
        Event.where(start_date: Date.today..(Date.today + 7.days)).each do |event|
          if event.start_date.after? Date.today
            @events << event
            @events = @events.sort{ |a, b| a.start_date <=> b.start_date }
          end
        end
      when 'month'
        Event.where(start_date: Date.today..(Date.today + 30.days)).each do |event|
          if event.start_date.after? Date.today
            @events << event
            @events = @events.sort{ |a, b| a.start_date <=> b.start_date }
          end
        end
      when 'all'
        Event.all.each do |event|
          if event.start_date.after? Date.today
            @events << event
            @events = @events.sort{ |a, b| a.start_date <=> b.start_date }
          end
        end
      else
      Event.all.each do |event|
        if event.start_date.after? Date.today
          @events << event
          @events = @events.sort{ |a, b| a.start_date <=> b.start_date }
      end
  end
end

  case params[:sort]
  when 'level'
    @events = @events.sort{ |a, b| a.level <=> b.level }
  when 'category'
    @events = @events.sort{ |a, b| a.category <=> b.category }
  when 'date'
    @events = @events.sort{ |a, b| a.start_date <=> b.start_date }
  else
    @events = @events.sort{ |a, b| a.start_date <=> b.start_date }
    end

    #Sort event for the agenda
      @current_attendances = Attendance.all.where(attendee: current_user).sort{ |a, b| a.event.start_date <=> b.event.start_date }
  end

  # GET /events/1 or /events/1.json
  def show
    # find the event
    event = Event.find(params[:id])

    @attendance = Attendance.where(event: event, attendee: current_user).first
    # check if the user is already attending the event (@is_attending => true if attending, else false)
    @is_attending = @attendance ? true : false

  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events or /events.json
  def create
    params[:event][:available_seats] = params[:event][:max_seats]
    puts "The event params are #{event_params}"
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to event_url(@event), notice: "Votre évènement a été créé avec succès." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to event_url(@event), notice: "Votre évènement a été modifié avec succès." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
# initialize information that we need to send a email to all the attendees of the event gonna be delete
      @event_attendance = Attendance.where(event: @event)
      @event_attendance.each do |attendance|
      @user = attendance.attendee
      @email = attendance.attendee.email

      UserMailer.event_delete(@user, @event).deliver_now
    end

  @event.destroy!
    respond_to do |format|
      format.html { redirect_to events_url, notice: "L'évènement a été supprimé avec succès." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:creator_id, :category, :instrument, :level, :price, :start_date, :duration, :description, :location, :max_seats, :available_seats)
    end
end
