class ScoretablesController < ApplicationController
  before_action :set_scoretable, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verity_authenticity_token, if: :json_request?
  protect_from_forgery :except => [:show, :edit, :update, :destroy]

  # GET /scoretables
  # GET /scoretables.json
  def index
    puts "Here is index."
    @scoretables = Scoretable.order(:score).first(5)
  end

  # GET /scoretables/1
  # GET /scoretables/1.json
  def show
    @scoretables = Scoretable.order(:score).first(5)
  end

  # GET /scoretables/new
  def new
    @scoretable = Scoretable.new
  end

  # GET /scoretables/1/edit
  def edit
  end

  # POST /scoretables
  # POST /scoretables.json
  # respond_to :html, :json
  def create
    puts "START"
    req_body = request.body.read()
    puts req_body
    puts "END"
    
    div_part = req_body.partition("|")
    
    @scoretable = Scoretable.new(:name=>div_part[0], :score=>div_part[2])
=begin   
    if @scoretable.save
      respond_with(Scoretable.order(:score).first(5))
    end
=end
    
    respond_to do |format|
      if @scoretable.save
        format.html { render action: @scoretables = Scoretable.order(:score).first(5), template: "scoretables/index" }
        format.json { }
      else
        format.html { render action: 'new' }
        format.json { render json: @scoretable.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # PATCH/PUT /scoretables/1
  # PATCH/PUT /scoretables/1.json
  def update
    respond_to do |format|
      if @scoretable.update(scoretable_params)
        format.html { redirect_to @scoretable, notice: 'Scoretable was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @scoretable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scoretables/1
  # DELETE /scoretables/1.json
  def destroy
    @scoretable.destroy
    respond_to do |format|
      format.html { redirect_to scoretables_url }
      format.json { head :no_content }
    end
  end
  
  protected
  def json_request?
    request.format.json?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scoretable
      @scoretable = Scoretable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scoretable_params
      params.require(:scoretable).permit(:name, :time)
    end
end
