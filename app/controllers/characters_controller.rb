class CharactersController < ApplicationController
  before_action :authenticate_user!

  def addCharacter
    @roster = current_user.roster
    @character = @roster.characters.build(character_params)

    if @character.save
      render json: {status: 'SUCCESS', message: 'Character saved', data: @character}, status: :ok
    else
      render json: {status: 'ERROR', message: 'Character not saved', data: @character.errors}, status: :unprocessable_entity
    end
  end

  def removeCharacter
    @roster = current_user.roster
    @character = @roster.characters.find(params[:id])
    if @character.destroy
      render json: {status: 'SUCCESS', message: 'Character removed from roster', data: @character}, status: :ok
    else 
      render json: {status: 'ERROR', message: 'Character not removed from roster', data: @character.errors}, status: :unprocessable_entity
    end
  end

  def updateCharacter
    @roster = current_user.roster
    @character = @roster.characters.find(params[:id])
    if @character.update_attributes(character_params)
      render json: {status: 'SUCCESS', message: 'Character updated', data: @character}, status: :ok
    else
      render json: {status: 'ERROR', message: 'Character not updated', data: @character.errors}, status: :unprocessable_entity
    end
  end

  private
    def character_params
      params.require(:character).permit(:name, :race, :character_class, :spec, :role)
    end
end
