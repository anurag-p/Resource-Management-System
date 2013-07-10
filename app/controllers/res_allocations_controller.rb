class ResAllocationsController < ApplicationController
  # GET /res_allocations
  # GET /res_allocations.json
  def index
    @allocation_date=AllocationDate.find params[:id]
    @res_allocations = @allocation_date.res_allocations

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @res_allocations }
    end
  end

  # GET /res_allocations/1
  # GET /res_allocations/1.json
  def show
    @res_allocation = ResAllocation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @res_allocation }
    end
  end

  # GET /res_allocations/new
  # GET /res_allocations/new.json
  def new
    @allocation_date=AllocationDate.find params[:date_id]
    @res_allocation = ResAllocation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @res_allocation }
    end
  end

  # GET /res_allocations/1/edit
  def edit
    @allocation_date=AllocationDate.find params[:date_id]
    @res_allocation = ResAllocation.find(params[:id])
  end

  # POST /res_allocations
  # POST /res_allocations.json
  def create
    @res_allocation = ResAllocation.new(params[:res_allocation])

    respond_to do |format|
      if @res_allocation.save
        format.html { redirect_to @res_allocation, notice: 'Res allocation was successfully created.' }
        format.json { render json: @res_allocation, status: :created, location: @res_allocation }
      else
        format.html { render action: "new" }
        format.json { render json: @res_allocation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /res_allocations/1
  # PUT /res_allocations/1.json
  def update
    @res_allocation = ResAllocation.find(params[:id])

    respond_to do |format|
      if @res_allocation.update_attributes(params[:res_allocation])
        format.html { redirect_to @res_allocation, notice: 'Res allocation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @res_allocation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /res_allocations/1
  # DELETE /res_allocations/1.json
  def destroy
    @res_allocation = ResAllocation.find(params[:id])
    @res_allocation.destroy

    respond_to do |format|
      format.html { redirect_to res_allocations_url }
      format.json { head :no_content }
    end
  end
  
  
  def get_projects
     projects = Project.where("title LIKE :search",search: "%#{params[:q]}%")
     project_titles=""
     unless projects.blank?
        projects.each do |project|
          project_titles+="#{project.title}|#{project.id.to_s}\n"
        end
       render :text=> project_titles
     else
      render :text=> "Not Found"
    end  
  end 
  def get_resources
     resources = Resource.where("name LIKE :search",search: "%#{params[:q]}%")
     resource_names=""
     unless resources.blank?
        resources.each do |resource|
          resource_names+="#{resource.name}|#{resource.id.to_s}\n"
        end
       render :text=> resource_names
     else
      render :text=> "Not Found"
    end  
  end
end
