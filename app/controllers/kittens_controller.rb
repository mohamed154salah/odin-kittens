class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save
      flash[:success] = "Kitten created successfully!"
      redirect_to @kitten
    else
      flash[:danger] = "Kitten not created! Please try again."
      render 'new'
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])

    if @kitten.update(kitten_params)
      flash[:success] = "Kitten updated successfully!"
      redirect_to @kitten
    else
      flash[:danger] = "Kitten not updated! Please try again."
      render 'edit'
    end

  end

  def destroy
    @kitten = Kitten.find(params[:id])

    if @kitten.destroy
      flash[:success] = "Kitten deleted successfully!"
    else
      flash[:danger] = "Kitten not deleted! Please try again."
    end
    redirect_to kittens_path
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
