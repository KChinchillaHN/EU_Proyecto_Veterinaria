class OwnersController < ApplicationController
  def index
  	@owners = Owner.order(:id)
  end

  def pets
    @owner = Owner.find(params[:id])
    @pet = @owner.pets
  end

  def show
  	@owner = Owner.find(params[:id])
  end
  
  def new
  	@owner = Owner.new	
  end

  def create
  	@owner = Owner.new(owner_params)
  	if @owner.save 
  		redirect_to owners_path, notice: "El Propietario se agrego exitosamente" 
  	else
  		flash[:error] = "No se pudo registrar el propietario, Favor corregir los siguientes errores: "
  		render :new
  	end
  end

  def edit
  	@owner = Owner.find(params[:id])
  end

  def update
  	@owner = Owner.find(params[:id])

  	if @owner.update_attributes(owner_params)
  		redirect_to @owner, notice: "El Propietario se actualizo exitosamente"
  	else
  	   render :edit
  	end
  end

  def destroy
  	@owner = Owner.find(params[:id])
  	@owner.destroy
  	redirect_to owners_path  	
  end

  protected
  def owner_params
  	params.require(:owner).permit(:name, :last_name, :address, :phone, :email)
  end

end
