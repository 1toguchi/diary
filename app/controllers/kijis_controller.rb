class KijisController < ApplicationController
  def index
    if params[:member_id]
      @member = Member.find(params[:member_id])
      @kijis = @member.kijis
    else
      @kijis = Kiji.all
    end
    @kijis = @kijis.current_member
      .order(released_at: :desc)
   end
  
 def new
    @kiji = Kiji.new
  end

 def create
    @kiji = Kiji.new(kiji_params)
    @kiji.author = current_member
    if @kiji.save
      redirect_to @kiji, notice: "記事を作成しました。"
    else
      render "new"
    end
  end

   def edit
    @kiji = Kiji.find(params[:id])
  end

   def update
    @kiji =current_member.entries.find(params[:id])
    @kiji.assign_attributes(kiji_params)
    if @kiji.save
      redirect_to @kiji, notice: "ブログ時期を編集しました"
    else
      render "edit"
    end
  end

  def destroy
    @kiji = Kiji.find(params[:id])
    @kiji.destroy
    redirect_to :root
  end
  
  def show
    @kijis = Kiji.find(params[:id])
  end


private
  def kiji_params
  params.require(:kiji).permit(:title, :body, :released_at)
  end
end
