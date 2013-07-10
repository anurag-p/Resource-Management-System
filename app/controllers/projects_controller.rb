class ProjectsController < ApplicationController
  before_filter :parse_date, :only=> [:create, :update]
  before_filter :change_tag_value, :only=> [:create, :update, :manage_tag]
  
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new
    @project.technologies_projects.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end
  
  def autocomplete
    @projects = Project.autocomplete(:title, params[:q])
    respond_to do |format|
      format.json { render json: @projects }
    end
  end
  
  def manage_tag
    p params
    tech=Technology.where("id=?",params[:technology_id]).first
    if(tech.update_attributes(params[:technology]) if tech.present?)
      render :text => "success"
    else
      render :text => "fail"
    end
  end
  
  def parse_date
    params[:project][:exp_start_date]=DateTime.strptime("#{params[:project][:exp_start_date]}", "%m/%d/%Y") if params[:project] && params[:project][:exp_start_date].present?
  end
  
  def change_tag_value
    p_ids=[]
    t_ids=[]
    if params[:project] && params[:project][:tag_ids].present?
      params[:project][:tag_ids].join(",").split(",").each do |tag_value|
        p_ids << ((tag=Tag.where("name=?",tag_value).first).present? ? tag.id : Tag.create!(name: tag_value).id).to_s
      end
      params[:project][:tag_ids]=p_ids
    end
    
    if params[:technology] && params[:technology][:tag_ids].present?
      params[:technology][:tag_ids].join(",").split(",").each do |tag_value|
        t_ids << ((tag=Tag.where("name=?",tag_value).first).present? ? tag.id : Tag.create!(name: tag_value).id).to_s
      end
      params[:technology][:tag_ids]=t_ids
    end
  end
end
