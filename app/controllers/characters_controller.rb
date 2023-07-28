class CharactersController < ApplicationController
  before_action :authenticate_user!

  def addCharacter
    @roster = current_user.roster
    @character = @roster.characters.build(character_params)
    @characters = @roster.characters
    if @character.save
      render json: @roster, include: :characters
    else
      render json: {status: 'ERROR', message: 'Character not saved', data: @character.errors}, status: :unprocessable_entity
    end
  end

  def removeCharacter
    @roster = current_user.roster
    @character = @roster.characters.find(params[:id])
    @characters = @roster.characters
    if @character.destroy
      render json: @roster, include: :characters
    else 
      render json: {status: 'ERROR', message: 'Character not removed from roster', data: @character.errors}, status: :unprocessable_entity
    end
  end

  def updateCharacter
    @roster = current_user.roster
    @character = @roster.characters.find(params[:id])
    @characters = @roster.characters
    if @character.update_attributes(character_params)
      render json: @roster, include: :characters
    else
      render json: {status: 'ERROR', message: 'Character not updated', data: @character.errors}, status: :unprocessable_entity
    end
  end

  private
    def character_params
      params.require(:character).permit(:name, :race, :character_class, :spec, :role, :professions)
    end
end
