class RostersController < ApplicationController
  before_action :authenticate_user!

  def index
    @roster = current_user.roster
    @characters = @roster.characters
    render json: @roster, include: :characters
  end

  def createRoster
    @roster = current_user.build_roster(roster_params)
    if @roster.save
      render json: @roster
    else
      render json: {status: 'ERROR', message: 'Roster not saved', data: @roster.errors}, status: :unprocessable_entity
    end
  end

  private
    def roster_params
      params.require(:roster).permit(:name)
    end
end
