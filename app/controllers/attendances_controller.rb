class AttendancesController < ApplicationController

    def create
        event = Event.find(params[:event])
        new_attendance = Attendance.new(event: event, attendee: current_user)

        if new_attendance.save
            respond_to
        end

    end

    def destroy
    end
end
