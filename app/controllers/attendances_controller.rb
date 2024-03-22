class AttendancesController < ApplicationController

    def create
        @event = Event.find(params[:event])
        @new_attendance = Attendance.new(event: @event, attendee: current_user)
        @event.update(available_seats: @event.available_seats - 1)

        respond_to do |format|
            if @new_attendance.save
                format.html { redirect_to event_url(@event), notion: "Votre participation a bien été prise en compte"}
                format.json { render :show, status: :created, location: @event }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @event.errors, status: :unprocessable_entity }

            end
        end
    end

    def destroy
        attendance = Attendance.find(params[:id])
        event = attendance.event

        attendance.destroy!
        event.update(available_seats: event.available_seats + 1)

        respond_to do |format|
            format.html { redirect_to root_path, notice: "Vous vous êtes désinscrit de l'évènement."}
            format.json { head :no_content }
        end
    end
end
