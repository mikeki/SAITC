class PagesController < ApplicationController
  def calendar
    @title = "Calendario de Eventos"
  end

  def gallery
    @title = "Galería de Fotos"
  end

  def about
    @title = "¿Quiénes Somos?"
  end

end
