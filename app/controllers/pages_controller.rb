class PagesController < ApplicationController
  def root
    redirect_to pairs_url
  end
end
