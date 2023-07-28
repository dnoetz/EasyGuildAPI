class RostersController < ApplicationController
  before_action :authenticate_user!

  def index
    @roster = current_user.roster
    if @roster
      @characters = @roster.characters
      if @characters
        render json: @roster, include: :characters
      else
        render json: @roster
      end
    else
      render json: {}
    end
  end

  def createRoster
    @roster = current_user.build_roster(roster_params)
    @roster.characters = []
    if @roster.save
      render json: @roster, include: :characters
    else
      render json: {status: 'ERROR', message: 'Roster not saved', data: @roster.errors}, status: :unprocessable_entity
    end
  end

  private
    def roster_params
      params.require(:roster).permit(:name)
    end
end
