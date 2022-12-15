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

  def cart
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

  def add_to_cart
    flash[:notice] = "Added to cart"
    id = params[:id].to_i
    session[:cart] << id unless session[:cart].include?(id)
    redirect_to characters_path
  end

  def remove_from_cart
    flash[:notice] = "Removed from cart"
    id = params[:id].to_i
    session[:cart].delete(id)
    redirect_to characters_path
  end
end
