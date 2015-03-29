class JunitOutputsController < ApplicationController
  protect_from_forgery :except => :create
  respond_to :json

  def create
    @junit_output = JunitOutput.new(task_params)
    if @junit_output.save
      @junit_output.convert
      render :json => @junit_output
    else
      render xml: @junit_output.errors, status: :unprocessable_entity
    end
  end

  private
  def task_params
    params.require(:junit_output).permit(:output)
  end
end

