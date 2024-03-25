class PicturesController < ApplicationController

    def create
        @topic = Topic.find(params[:topic_id])
        @topic.attach.picture(params[:picture])
        redirect_to(topic_path(@topic))
    end
end
