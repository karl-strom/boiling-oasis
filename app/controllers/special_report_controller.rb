class SpecialReportController < ApplicationController

  before_action :set_description
  
  #GET 
  def index
    @special_reports = @description.special_reports.all
  end

  # 
  def new
    @special_report = @description.special_reports.build
  end

  def create
    @special_report = @description.special_reports.build(special_report_params)
    respond_to do |format|
      if @special_report.save
        format.html{ redirect_to "#{description_path}#special", notice: "A special report was successfully created!" }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @special_report = @description.special_reports.find(params[:report_id])
  end

  def update
    @special_report = @description.special_reports.find(params[:report_id])
    respond_to do |format|
      if @special_report.update(special_report_params)
        format.html{ redirect_to "#{description_path}#special", notice: "A special report was successfully updated!" }
      else
        format.html { render :edit }
      end
    end
  end

  def delete
    @special_report = @description.special_reports.find(params[:report_id])
    respond_to do |format|
      if @special_report.destroy
        format.html{ redirect_to "#{description_path}#special", notice: "A special report was successfully deleted!" }
      else
        format.html { render :edit }
      end
    end
  end

  def sign_out
    @special_report = @description.special_reports.find(params[:report_id])
    if @special_report.update(:lock => params[:sign_out][:email])
      @result = 'success' 
    else
      @result = 'failure'
    end
    respond_to do |f|      
      f.js { render layout: false, content_type: 'text/javascript' }
      f.html
    end           
  end

  def set_description
    @description = Description.find(params[:id])

  end

  def special_report_params
    params.require("special_report").permit(:title, :final_diagnosis, :gross_description, :blockcode, :microscopic_description, :assign, :lock)
  end

  def signout_params
    params.require("sign_out").permit(:email, :password)
  end

end
