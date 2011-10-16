class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
end