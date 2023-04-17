class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @kittens }
    end
  end

  def show
    @kitten = Kitten.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @kitten }
    end
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:success] = "Kitten created successfully!"
      respond_to do |format|
        format.html { redirect_to @kitten }
        format.json { render :json => @kitten, :status => :created, :location => @kitten }

      end
    else
      flash[:danger] = "Kitten not created! Please try again."
      respond_to do |format|
        format.html { render 'new' }
        format.json { render :json => @kitten.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])

    if @kitten.update(kitten_params)
      flash[:success] = "Kitten updated successfully!"
      respond_to do |format|
        format.html { redirect_to @kitten }
        format.json { render :json => @kitten }
      end
    else
      flash[:danger] = "Kitten not updated! Please try again."
      respond_to do |format|
        format.html { render 'edit' }
        format.json { render :json => @kitten.errors, :status => :unprocessable_entity }

      end
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
