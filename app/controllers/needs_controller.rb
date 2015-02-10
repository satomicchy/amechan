# -*- coding: utf-8 -*-
class NeedsController < ApplicationController
  before_action :set_need, only: [:show, :edit, :update, :destroy]
  before_action :set_order_keys

  def waitings
    @title = "要望一覧（対応待ち）"
    @needs = Need.where(status: "waiting").order(@order_keys[params[:sort]]).order("id DESC")
    render "index"
  end

  def on_handlings
    @title = "要望一覧（対応中）"
    @needs = Need.where(status: "on_handling").order(@order_keys[params[:sort]]).order("id DESC")
    render "index"
  end

  def on_holds
    @title = "要望一覧（保留中）"
    @needs = Need.where(status: "on_hold").order(@order_keys[params[:sort]]).order("id DESC")
    render "index"
  end

  def resolveds
    @title = "要望一覧（解決済）"
    @needs = Need.where(status: "resolved").order(@order_keys[params[:sort]]).order("id DESC")
    render "index"
  end

  def rejections
    @title = "要望一覧（却下）"
    @needs = Need.where(status: "rejection").order(@order_keys[params[:sort]]).order("id DESC")
    render "index"
  end

  # GET /needs
  # GET /needs.json
  def index
    @title = "要望一覧"
    @needs = Need.order(@order_keys[params[:sort]]).order("id DESC")
  end

  # GET /needs/1
  # GET /needs/1.json
  def show
    @comment  = Comment.new
    @comments = @need.comments.order("id DESC")
  end

  # GET /needs/new
  def new
    @need = Need.new
  end

  # GET /needs/1/edit
  def edit
  end

  # POST /needs
  # POST /needs.json
  def create
    @need = Need.new(need_params)
#    @need.staff_id = current_staff.id
#    @need.status   = "waiting"

    respond_to do |format|
      if @need.save
        format.html { redirect_to @need, notice: 'Need was successfully created.' }
        format.json { render action: 'show', status: :created, location: @need }
      else
        format.html { render action: 'new' }
        format.json { render json: @need.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /needs/1
  # PATCH/PUT /needs/1.json
  def update
    respond_to do |format|
      if @need.update(need_params)
        format.html { redirect_to @need, notice: 'Need was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @need.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /needs/1
  # DELETE /needs/1.json
  def destroy
    @need.destroy
    respond_to do |format|
      format.html { redirect_to needs_url }
      format.json { head :no_content }
    end
  end

  private
    def set_order_keys
      @order_keys = {
        'schedule_asc'  => 'schedule_on ASC',
        'schedule_desc' => 'schedule_on DESC',
      }
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_need
      @need = Need.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def need_params
      params.require(:need).permit(:staff_id, :title, :content, :url, :status, :importance, :finish_on, :memo, :area, :schedule_on)
    end
end
