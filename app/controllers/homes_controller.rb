class HomesController < ApplicationController
  def top
    @recipes = Recipe.all
  end

  def about

  end
end
