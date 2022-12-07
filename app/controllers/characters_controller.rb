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
end
