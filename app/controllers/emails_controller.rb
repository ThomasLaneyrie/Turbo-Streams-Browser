class EmailsController < ApplicationController
  def new
  end

  def show
    @email = Email.find(params[:id])
  end

  def index
    @emails = Email.all.order('created_at DESC')
  end

  def create
    @email = Email.new(email: Faker::Internet.free_email, object: Faker::Superhero.name, body: Faker::Lorem.paragraph_by_chars(number: 100, supplemental: false))
    respond_to do |format|
      if @email.save
        format.turbo_stream { render turbo_stream: turbo_stream.prepend('all_email', @email) }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  
end




