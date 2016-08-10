class KijisController < ApplicationController
   before_action :login_required, except: [:index, :show]
  def index
    if params[:member_id]
      @member = Member.find(params[:member_id])
      @kijis = @member.kijis
       else
      @kijis = Kiji.all
     end
     @kijis = @kijis.readable_for(current_member).order(released_at: :desc)
   end

  def new
    @kiji = Kiji.new
  end

   def create
      @kiji = Kiji.new(kiji_params)
      @kiji.author = current_member
    if @kiji.save
      redirect_to @kiji
    else
      render "new"
    end
  end

   def edit
    @kiji = Kiji.find(params[:id])
  end

   def update
      @kiji = current_member.kijis.find(params[:id])
      @kiji.assign_attributes(kiji_params)
    if @kiji.save
      redirect_to @kiji
    else
      render "edit"
    end
  end

  def destroy
    @kiji = current_member.kijis.find(params[:id])
    @kiji.destroy
    redirect_to :root
  end

  def show
    @kijis = Kiji.readable_for(current_member).find(params[:id])
  end

  def like
    @kiji = Kiji.published.find(params[:id])
    current_member.voted_kijis << @kiji
    redirect_to @kiji
  end

  def unlike
    current_member.voted_kijis.destroy(Kiji.find(params[:id]))
    redirect_to :voted_kijis
  end

  def voted
    @kijis = current_member.voted_kijis.published
    .order("votes.created_at DESC")
  end


private
  def kiji_params
  params.require(:kiji).permit(:title, :body, :released_at, :status)
  end
end
