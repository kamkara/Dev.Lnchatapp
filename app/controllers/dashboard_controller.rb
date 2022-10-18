class DashboardController < ApplicationController
    before_action :authenticate_user!
  
  def index
    @StudentList = User.all_ordered
  end

  def home
    @LevelList = Level.all_ordered
    @CityList = Citytown.all_ordered
    @MaterialList = Material.all_ordered
    @SchoolList = School.all_ordered
  end
end
