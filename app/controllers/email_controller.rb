class EmailController < ApplicationController
	def new
		@email = Email.new
	end

	def show
		@id = params[:id]
		@email = Email.all.find(params[:id]) 
	end

	def create
	    @email = Email.create(
	      object: Faker::Appliance.brand,
	      body: Faker::Hacker.say_something_smart,
	    )
	    respond_to do |format|
      	format.html { redirect_to email_index_path }
     	format.js { }
    end
  end


	def index
		@email = Email.all 
	end

end


