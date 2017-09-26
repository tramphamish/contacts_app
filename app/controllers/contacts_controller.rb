class ContactsController < ApplicationController
  def index
    if current_user
    @contacts = current_user.contacts
    render :index
    else
    flash[:warning] = "You must be logged in to see this page!"
    redirect_to "/login"
    end
  end

  def new
  end

  def create
    coordinates = Geocoder.coordinates(params[:address])
    p coordinates
    @new_contact = Contact.create(
      first_name: params[:first_name], 
      last_name: params[:last_name], 
      email: params[:email], 
      phone_number: params[:phone_number],
      bio: params[:bio],
      latitude: coordinates[0],
      longitude: coordinates[1],
      user_id: current_user.id
      )
    if @new_contact.save
      flash[:success] = "Contact Added!"
      redirect_to "/contacts/#{@contacts.id}"
    else
    render "create.html.erb"
  end
end

  def show
    @contacts = Contact.find_by(id: params[:id])
  end

  def edit
    @contacts = Contact.find_by(id: params[:id])
  end

  def update
    @contacts = Contact.find_by(id: params[:id])
    @contacts = Contact.update(
      first_name: params[:first_name], 
      last_name: params[:last_name], 
      email: params[:email], 
      phone_number: params[:phone_number],
      bio: params[:bio],
      )
    redirect_to "/contacts/#{@contacts.id}"
  end

  def destroy
    @contacts = Contact.find_by(id: params[:id])
    @contacts.delete
    flash[:success] = "Contact has been deleted."
    redirect_to "/"
  end

end
