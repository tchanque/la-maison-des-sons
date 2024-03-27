class TopicsController < ApplicationController
  def create 
    @topic = Topic.new(topic_params)

    respond_to do |format|
      if @topic.save
        format.html { redirect_to root_path, notice: "Votre actualité a été ajoutée avec succès." }
        format.json { render :index, status: :ok, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end

  end

  def new
    @topic = Topic.new
  end

  def index
    redirect_to root_path, notice: "Votre actualité a été ajoutée avec succès." 
  end

  def destroy
  end

  private

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:title, :description, :picture)
  end
end
