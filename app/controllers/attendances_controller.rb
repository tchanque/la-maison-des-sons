class AttendancesController < ApplicationController

    def create
        event = Event.find(params[:event])
        new_attendance = Attendance.new(event: event, attendee: current_user)

        if new_attendance.save
            respond_to do |format|
                format.html { redirect_to event, notice: "Vous êtes inscrit à l'évènement."}
                format.json { head :no_content }
            end
        end

    end

    def destroy
        attendance = Attendance.find(params[:id])
        attendance.destroy!

        respond_to do |format|
            format.html { redirect_to root_path, notice: "Vous vous êtes désinscrit de l'évènement."}
            format.json { head :no_content }
        end
    end
end
