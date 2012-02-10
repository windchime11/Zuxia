class ReportsController < ApplicationController
  def new
  	@report = Report.new 
    @report.en_words.build 
    @report.book_readings.build 
    @report.misc_things.build 
    @report.codings.build 
    @book_table_id = "brtable"
    @coding_table_id = "codingtable"
    @misc_table_id = "misctable"
    @voc_table_id = "voctable"
    store_location
  end

  def create
	@report = current_user.reports.build(params[:report])
	if @report.save
		flash[:success] = "Report Created!"
		redirect_to report_path(@report)
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
