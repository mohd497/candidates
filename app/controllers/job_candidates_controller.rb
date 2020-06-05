class JobCandidatesController < ApplicationController
  before_action :set_job_candidate, only: [:show, :edit, :update, :destroy]

  # GET /job_candidates
  # GET /job_candidates.json
  def index
    @job_candidates = JobCandidate.filter(params).paginate(page: params[:page], per_page: 9)
  end

  # GET /job_candidates/1
  # GET /job_candidates/1.json
  def show
  end

  # GET /job_candidates/new
  def new
    @job_candidate = JobCandidate.new
  end

  # GET /job_candidates/1/edit
  def edit
  end

  # POST /job_candidates
  # POST /job_candidates.json
  def create
    @job_candidate = JobCandidate.new(job_candidate_params)

    respond_to do |format|
      if @job_candidate.save

        JobCandidates.add_search_tech(@job_candidate)

        format.html { redirect_to @job_candidate, notice: 'Candidate was successfully created.' }
        format.json { render :show, status: :created, location: @job_candidate }
      else
        format.html { render :new }
        format.json { render json: @job_candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_candidates/1
  # PATCH/PUT /job_candidates/1.json
  def update
    respond_to do |format|
      if @job_candidate.update(job_candidate_params)
        format.html { redirect_to @job_candidate, notice: 'Candidate was successfully updated.' }
        format.json { render :show, status: :ok, location: @job_candidate }
      else
        format.html { render :edit }
        format.json { render json: @job_candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_candidates/1
  # DELETE /job_candidates/1.json
  def destroy
    @job_candidate.destroy
    respond_to do |format|
      format.html { redirect_to job_candidates_url, notice: 'Candidate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_candidate
      @job_candidate = JobCandidate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_candidate_params
      params.require(:job_candidate).permit(:name, :age, :current_address, :email, :phone_number, :resume)
    end
end
