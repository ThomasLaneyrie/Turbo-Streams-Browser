class EmailsController < ApplicationController
  def new
  end

  def show
    @email = Email.find(params[:id])
  end

  def index
    @emails = Email.all
  end

  def create
    @email = Email.new(email: Faker::Internet.free_email, object: Faker::Superhero.name, body: Faker::Lorem.paragraph_by_chars(number: 100, supplemental: false))
    respond_to do |format|
      if @email.save
        format.turbo_stream         # If our post saves, we would like the format we respond with to be a create.turbo_stream.erb
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end
end
