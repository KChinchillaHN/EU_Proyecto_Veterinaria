class AnimalsController < ApplicationController
  def index
  	@animals = Animal.order(:name)
  end

  def new
  	@animal = Animal.new
  end

  def create
  	@animal = Animal.new(animal_params)
  	if @animal.save
  		redirect_to animals_path, notice: "El nuevo tipo de Animal ha sido exitosamente agregada."
  	else
  		flash[:error] = "Error al ingresar el tipo de Animal, Favor corregir los errores."
  		render :new
  	end
  end

  def edit
  	@animal = Animal.find(params[:id])
  end

  def update
  	@animal = Animal.find(params[:id])
  	if @animal.update_attributes(animal_params)
  		redirect_to animals_path, notice: "El tipo de animal se actualizo correctamente."
    else
      render :edit
    end
  end

  def destroy
  	@animal = Animal.find(params[:id])
  	@animal.destroy
  	redirect_to animals_path	
  end

   protected
  def animal_params
  	params.require(:animal).permit(:name)
  end
end
