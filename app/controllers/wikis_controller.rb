class WikisController < ApplicationController

  before_action :set_wiki, except: [:index, :new, :create]
  def index
    @wikis = Wiki.all
    authorize @wikis
  end

  def show
  end

  def new
    @wiki = Wiki.new
    authorize @wikis
  end

  def create
    @wiki = current_user.wikis.build(wiki_params)
    authorize @wikis
    if @wiki.save
      flash[:notice] = 'The wiki has been created'
      redirect_to @wiki
    else
      flash[:error] = 'There was an error saving your wiki. Please try again'
      render new
    end
  end

  def update
    authorize @wikis
      if @wiki.update_attributes(wiki_params)
        flash[:notice]= 'the wiki was updated'
        redirect_to @wiki
      else
        flash[:notice]= 'there was an error updtaded the wiki, please try again'
        render :edit
      end
  end

  def edit
    authorize @wiki
  end

  def destroy
    authorize @wiki
    if @wiki.delete
      flash[:notice] = 'the wiki has been deleted'
      redirect_to wikis_path
    else
      flash[:notice] = 'something went wrong'
      redirect_to @wiki
    end

  end

  private

  def set_wiki
    @wiki = Wiki.find(params[:id])
  end

  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end
end
