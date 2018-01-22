class PagesController < ApplicationController
  def root
    redirect_to action: "index", controler: pairs
  end
end
