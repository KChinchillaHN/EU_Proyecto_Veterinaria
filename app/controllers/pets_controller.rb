class PetsController < ApplicationController
  def index
  	@pets = Pet.order(:name)
  end

  def show
  	@pet = Pet.find(params[:id])
  end

  def new  
    @pet = Pet.new
  end

  def create
  	@pet = Pet.new(pet_params)
  	if @pet.save
  		redirect_to pets_path, notice: "La mascota ha sido exitosamente agregada."
  	else
  		flash[:error] = "Error al ingresar la mascota, Favor corregir los errores."
  		render :new
  	end
  end

  def edit
  	@pet = Pet.find(params[:id])
  end

  def update
  	@pet = Pet.find(params[:id])
  	if @pet.update_attributes(pet_params)
  		redirect_to pets_path, notice: "La mascota se actualizo correctamente."
    else
      render :edit
    end

  end

  def destroy
  	@pet = Pet.find(params[:id])
  	@pet.destroy
  	redirect_to pets_path
  end

  protected
  def pet_params
  	params.require(:pet).permit(:name, :born_at, :observations, :animal_id,:pet_url)
  end

end
