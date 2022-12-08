class CharactersController < ApplicationController

  def index
    @characters = Character.order(:name).page(params[:page])
    @elements = Element.all
  end

  def show
    @character = Character.find(params[:id])
    @elements = Element.all
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

  def search
    @drop = params[:search]
    @elements = Element.all
    if params[:filter] == "0"
      @returned = Character.where("lower(name) LIKE :search OR lower(description) LIKE :search",
      search: "%#{@drop}%").page(params[:page])
    else
    @returned = Character.where(element_id: params[:filter]).where("lower(name) LIKE :search OR lower(description) LIKE :search",
    search: "%#{@drop}%").page(params[:page])
    end
  end
end
