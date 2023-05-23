class DoctorsController < ApplicationController
  load_and_authorize_resource
  def index
   @doctors = Doctor.all
  end
end
