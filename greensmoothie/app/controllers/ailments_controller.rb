class AilmentsController < ApplicationController
  before_action :set_ailment, only: [:show, :edit, :update, :destroy]

  # GET /ailments
  # GET /ailments.json
  #@ailments stores all of the ailments objects in db
  #corresponding index view, will render all of those objects in the view
  def index
    @ailments = Ailment.all
  end

  # GET /ailments/1
  # GET /ailments/1.json
  def show
  end

  # GET /ailments/new
  #create a new object, persist data to ailment object, push to db, form on new page -- ailment object with name attribute, someone types that in and clicks submit, fires up a POST request, which persists data into db using Ailment.new function, then when you go to show page, try to find that specific object, will grab using object_id
  def new
    @ailment = Ailment.new
  end

  # GET /ailments/1/edit
  def edit
  end

  # POST /ailments
  # POST /ailments.json
  def create
    @ailment = Ailment.new(ailment_params)

    respond_to do |format|
      if @ailment.save
        format.html { redirect_to @ailment, notice: 'Ailment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ailment }
      else
        format.html { render action: 'new' }
        format.json { render json: @ailment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ailments/1
  # PATCH/PUT /ailments/1.json
  def update
    respond_to do |format|
      if @ailment.update(ailment_params)
        format.html { redirect_to @ailment, notice: 'Ailment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ailment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ailments/1
  # DELETE /ailments/1.json
  def destroy
    @ailment.destroy
    respond_to do |format|
      format.html { redirect_to ailments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ailment
      @ailment = Ailment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ailment_params
      params.require(:ailment).permit(:name)
    end
end

# class AilmentsController < ApplicationController

#   def index
#     if params[:search].nil?
#       @ailments = []
#     else
#       quoted_search_terms = params[:search].split(",").collect do |recipe|
#         "\"+#{recipe.strip}\""
#       end.join(" ")

#       @ailments = []
#       begin
#         @search = Ailment.search do
#           fulltext quoted_search_terms do
#             highlight :page_content
#             minimum_match 1
#           end
#         end

#         @ailments = @search.results
#         @ailments << Ailment.first if @ailments.count == 0
#       rescue
#         @ailments = Ailment.all.sample(5)
#       end
#       @ailment_name = @ailments[0..4].collect(&:name).shuffle.first
#       @ailment_url = Ailment.find_by(:name => @ailment_name).try(:url)

#       respond_to do |format|
#         format.html { render action: "index" }
#         format.js
#       end
#     end
#   end

# end