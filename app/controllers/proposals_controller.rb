class ProposalsController < ApplicationController
  before_action :set_proposal, only: [:show, :update, :destroy]

  def index
    @proposals = Proposal.all.order('created_at DESC')

    render json: @proposals
  end

  def show
    render json: @proposal
  end

  def create
    @proposal = Proposal.new(proposal_params)

    if @proposal.save
      ProposalMailer.email(@proposal).deliver_later
      render json: @proposal, status: :created, location: @proposal
    else
      render json: @proposal.errors, status: :unprocessable_entity
    end
  end

  def update
    if @proposal.update(proposal_params)
      render json: @proposal
    else
      render json: @proposal.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @proposal.destroy
  end

  private

    def set_proposal
      @proposal = Proposal.find(params[:id])
    end

    def proposal_params
      params.require(:proposal).permit(:customer, :string, :portfolio_url, :tools, :estimated_hours, :hourly_rate, :weeks_to_complete, :client_email)
    end
end
