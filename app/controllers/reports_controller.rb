class ReportsController < ApplicationController
  def new
  	@report = Report.new if signed_in?
    #<% @report.en_words.build %>
    3.times do
      @report.en_words.build
    end
  end

  def create
	@report = current_user.reports.build(params[:report])
	if @report.save
		flash[:success] = "Report Created!"
		redirect_to root_path
	else
		flash[:error] = @report.errors.first.to_s
    render 'pages/home'
	end
  end

  def show
  	@report = Report.find_by_id(params[:id])
  end

  def destroy
  end
end
