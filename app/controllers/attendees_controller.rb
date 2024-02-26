class AttendeesController < ApplicationController
  before_action :set_attendee, only: %i[ show edit update destroy ]

  # GET /attendees or /attendees.json
  def index
    @event = Event.find(params[:event_id])
    @attendees = Attendee.where('event_id = '+params[:event_id])
  end

  # GET /attendees/1 or /attendees/1.json
  def show
  end

  # GET /attendees/new
  def new
    @attendee = Attendee.new
    @event = Event.find(params[:event_id])
  end

  # GET /attendees/1/edit
  def edit
    @event = Event.find(params[:event_id])
    @attendee = Attendee.find(params[:id])
    @member = Member.find(@attendee.member_id)
    currentPoints = @member.points

    if @attendee.attended
      currentPoints -= @event.points
    else
      currentPoints += @event.points
    end

    @member.update(points: currentPoints)
    @attendee.update(attended: !@attendee.attended)
    redirect_to event_attendees_path(@event)
  end

  # POST /attendees or /attendees.json
  def create
    @event = Event.find(attendee_params[:event_id])
    @attendee = Attendee.new(attendee_params)

    if Member.exists?(member_id: attendee_params[:member_id]) && @attendee.save
      respond_to do |format|
        format.html { redirect_to event_attendees_path(@event), notice: "RSVP was successfully created." }
        format.json { render :show, status: :created, location: @attendee }
      end
    else
      @attendee.errors.add(:member_id, "Invalid Member Id")
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @attendee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attendees/1 or /attendees/1.json
  def update
  end

  def delete
    @event = Event.find(params[:event_id])
    @attendee = Attendee.find(params[:id])
  end

  # DELETE /attendees/1 or /attendees/1.json
  def destroy
    event_id = @attendee.event_id
    @attendee.destroy!

    respond_to do |format|
      format.html { redirect_to event_attendees_path(Event.find(event_id)), notice: "RSVP was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def attended
    @event = Event.find(params[:event_id])
    @attendees = @event.attendees.where(attended: true)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendee
      @attendee = Attendee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def attendee_params
      params.require(:attendee).permit(:attended, :rsvp, :member_id, :event_id)
    end
end
