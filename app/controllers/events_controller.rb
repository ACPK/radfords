class EventsController < ApplicationController
  before_filter :authenticate, :except => :destroy

  def show
    @event = Event.find( params[:id] )
    @title = @event.name
  end

  def new
    @title = 'New Event'
    @event  = Event.new
  end

  def create
    @title = 'New Event'
    @event = Event.new( params[:event] )

    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end

  def index
    @title = 'Listing events'
    @events = Event.all
  end

  def edit
    @event = Event.find( params[:id] )
    @title = "Edit event"
  end

  def update
    @event = Event.find( params[:id] )

    if @event.update_attributes( params[:event] )
      flash[:success] = "Profile updated."

      redirect_to @event
    else
      @title = "Edit event"
      render "edit"
    end
  end

  private
    def authenticate
      deny_access unless signed_in?
    end
end
