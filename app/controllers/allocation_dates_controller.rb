class AllocationDatesController < ApplicationController
before_filter :parse_allocation_date, :only => [:create, :update]
  # GET /allocation_dates
  # GET /allocation_dates.json
  def index
    @allocation_dates = AllocationDate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @allocation_dates }
    end
  end

  # GET /allocation_dates/1
  # GET /allocation_dates/1.json
  def show
    @allocation_date = AllocationDate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @allocation_date }
    end
  end

  # GET /allocation_dates/new
  # GET /allocation_dates/new.json
  def new
    @allocation_date = AllocationDate.new
    @allocation_date.res_allocations.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @allocation_date }
    end
  end

  # GET /allocation_dates/1/edit
  def edit
    @allocation_date = AllocationDate.find(params[:id])
  end

  # POST /allocation_dates
  # POST /allocation_dates.json
  def create
    @allocation_date = AllocationDate.new(params[:allocation_date])
    respond_to do |format|
      if @allocation_date.save
#      redirect_to controller: "res_allocations", action: "new", date_id: @allocation_date.id
        format.html { redirect_to @allocation_date, notice: 'Resource allocation was successfully created.' }
        format.json { render json: @allocation_date, status: :created, location: @allocation_date }
      else
        format.html { render action: "new" }
        format.json { render json: @allocation_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /allocation_dates/1
  # PUT /allocation_dates/1.json
  def update
    @allocation_date = AllocationDate.find(params[:id])

    respond_to do |format|
      if @allocation_date.update_attributes(params[:allocation_date])
      
#        format.html { redirect_to controller: "res_allocations", action: "new", date_id: @allocation_date.id }
        format.html { redirect_to "/allocation_dates" }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @allocation_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /allocation_dates/1
  # DELETE /allocation_dates/1.json
  def destroy
    @allocation_date = AllocationDate.find(params[:id])
    @allocation_date.destroy

    respond_to do |format|
      format.html { redirect_to allocation_dates_url }
      format.json { head :no_content }
    end
  end
  
  def parse_allocation_date
    puts "----------------------------"
    p params[:allocation_date][:value]
    params[:allocation_date][:value]=DateTime.strptime("#{params[:allocation_date][:value]}", "%m/%d/%Y") if params[:allocation_date][:value]
  end
end
