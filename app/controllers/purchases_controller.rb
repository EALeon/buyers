class PurchasesController < ApplicationController
  autocomplete :city, :name
  before_filter :authenticate_user!, :except => [:show, :index]

  def index
    @purchases = Purchase.scoped({ })
    @purchases = @purchases.send(:by_name, "%#{params[:name]}%") unless params[:name].blank?
    @purchases = @purchases.send(:by_price, params[:price]) unless params[:price].blank?
    @purchases = @purchases.send(:by_city, params[:city_id]) unless params[:city_id].blank?
    @purchases = @purchases.send(:by_user, params[:user_id]) unless params[:user_id].blank?

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @purchases }
    end
  end

  def show
    @purchase = Purchase.find(params[:id])

    if (params[:model]=="purchase")
      if (params[:liked]=="true")
        @purchase.liked_by current_user
      end
      if (params[:liked]=="false")
        @purchase.disliked_by current_user
      end
    end

    if(@purchase.comment_threads.count > 0)
      if (params[:model]=="comment")
        @comment = Comment.find(params[:comment_id])
        if (params[:liked]=="true")
          @comment.liked_by current_user
        end
        if (params[:liked]=="false")
          @comment.disliked_by current_user
        end
      end
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @purchase }
    end
  end

  def new
    @purchase = Purchase.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @purchase }
    end
  end

  def edit
    @purchase = current_user.purchases.find(params[:id])
  end

  def create
    @purchase = current_user.purchases.new(params[:purchase])
    respond_to do |format|
      if @purchase.save
        format.html { redirect_to @purchase }
        format.json { render :json => @purchase, :status => :created, :location => @purchase }
      else
        format.html { render :action => "new" }
        format.json { render :json => @purchase.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @purchase = current_user.purchases.find(params[:id])
    respond_to do |format|
      if @purchase.update_attributes(params[:purchase])
        format.html { redirect_to @purchase }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @purchase.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @purchase = current_user.purchases.find(params[:id])
    @purchase.destroy
    respond_to do |format|
      format.html { redirect_to purchases_url }
      format.json { head :ok }
    end
  end
 
end