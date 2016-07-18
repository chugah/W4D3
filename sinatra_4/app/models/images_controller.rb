class ImagesController < ApplicationController
  before_filter :authenticate, :except => [:index, :show]
  #...
end