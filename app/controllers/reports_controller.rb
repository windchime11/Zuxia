class ReportsController < ApplicationController
  def new
  	@report = Report.new if signed_in?
  end

  def create
	@report = current_user.reports.build(params[:report])
	if @report.save
		flash[:success] = ""
		redirect_to root_path
	else
		render 'pages/home'
	end
  end

  def show
  
  end

  def destroy
  end
end
