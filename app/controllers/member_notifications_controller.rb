class MemberNotificationsController < ApplicationController
  before_action :set_member_notification, only: %i[ show edit update destroy ]

  # GET /member_notifications or /member_notifications.json
  def index
    @member_notifications = MemberNotification.all
  end

  # GET /member_notifications/1 or /member_notifications/1.json
  def show
  end

  # GET /member_notifications/new
  def new
    @member_notification = MemberNotification.new
  end

  # GET /member_notifications/1/edit
  def edit
  end

  # POST /member_notifications or /member_notifications.json
  def create
    @member_notification = MemberNotification.new(member_notification_params)

    respond_to do |format|
      if @member_notification.save
        format.html { redirect_to member_notification_url(@member_notification), notice: "Member notification was successfully created." }
        format.json { render :show, status: :created, location: @member_notification }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @member_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /member_notifications/1 or /member_notifications/1.json
  def update
    respond_to do |format|
      if @member_notification.update(member_notification_params)
        format.html { redirect_to member_notification_url(@member_notification), notice: "Member notification was successfully updated." }
        format.json { render :show, status: :ok, location: @member_notification }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @member_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /member_notifications/1 or /member_notifications/1.json
  def destroy
    @member_notification.destroy!

    respond_to do |format|
      format.html { redirect_to member_notifications_url, notice: "Member notification was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member_notification
      @member_notification = MemberNotification.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def member_notification_params
      params.require(:member_notification).permit(:member_id, :notification_id, :seen)
    end
end
