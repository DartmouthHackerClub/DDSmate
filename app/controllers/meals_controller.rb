class MealsController < ApplicationController
  before_filter CASClient::Frameworks::Rails::Filter
  before_filter :cas_vars
  # GET /meals
  # GET /meals.xml
  def index
    @meals = Meal.all(:order => "time")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @meals }
    end
  end

  # GET /meals/new
  # GET /meals/new.xml
  def new
    @meal = Meal.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @meal }
    end
  end

  # GET /meals/1/edit
  def edit
    @meal = Meal.find(params[:id])
  end

  # POST /meals
  # POST /meals.xml
  def create
    @meal = Meal.new(params[:meal])
    @meal.name = @name
    @meal.email = @email
    @meal.uid = @uid
    respond_to do |format|
      if @meal.save
        flash[:notice] = 'Meal was successfully created.'
        format.html { redirect_to meals_path }
        format.xml  { render :xml => @meal, :status => :created, :location => @meal }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @meal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /meals/1
  # PUT /meals/1.xml
  def update
    @meal = Meal.find(params[:id],:conditions => ["uid=?",@uid])

    respond_to do |format|
      if @meal.update_attributes(params[:meal])
        flash[:notice] = 'Meal was successfully updated.'
        format.html { redirect_to(@meal) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @meal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /meals/1
  # DELETE /meals/1.xml
  def destroy
    @meal = Meal.find(params[:id],:conditions => ["uid=?",@uid])
    @meal.destroy

    respond_to do |format|
      format.html { redirect_to(meals_url) }
      format.xml  { head :ok }
    end
  end
  private
    def cas_vars 
      @uid = session[:cas_extra_attributes][:uid].to_s
      @email =session[:cas_user].gsub(/ /,'.').gsub(/(\.)+/,".")
      @name =session[:cas_extra_attributes][:name]
    end
end
