class CharactersController < ApplicationController

  def index
    @characters = Character.order(:name).page(params[:page])
    @elements = Element.all
  end

  def show
    @character = Character.find(params[:id])
  end

  def sort
    @filter = Character.where(element_id: params[:query]).page(params[:page])
    @elements = Element.all
  end

  def recent
    @recent = Character.where("updated_at <= ?", 3.days.ago).where("updated_at != created_at").page(params[:page])
    @elements = Element.all
  end

  def hype
    @hype = Character.where("created_at >= ?", 3.days.ago).page(params[:page])
    @elements = Element.all
  end

end
