class PurchasesController < ApplicationController
  autocomplete :city, :name

  def index
    @purchases = Purchase.search(params[:n], params[:p], params[:c], params[:my_id])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @purchases }
    end
  end

  def show
    @purchase = Purchase.find(params[:id])
    @city = City.find_by_sql ["SELECT name FROM cities WHERE id = ?", @purchase.city_id]
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
    @city = City.find_by_sql ["SELECT name FROM cities WHERE id = ?", @purchase.city_id]
  end

  def create
    @purchase = current_user.purchases.new(params[:purchase])
    respond_to do |format|
      if @purchase.save
        format.html { redirect_to @purchase, :notice => 'Purchase was successfully created.' }
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
        format.html { redirect_to @purchase, :notice => 'Purchase was successfully updated.' }
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