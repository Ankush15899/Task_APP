class TasksController < ApplicationController
	#Filters
	before_action :authorize_client, only: [:create]
	before_action :authorize_manager, only: [:destroy]
  before_action :authorize_employee, only: [:update]

  # POST /tasks creating the task
  def create
    task = @current_user.tasks.new(task_params)
		if params["status"] != "complete"
			if task.save
				render json: task, status: :created
			else
				render json: { error: task.errors.full_messages }, status: :unprocessable_entity
			end
		else
			render json: { error: "Client doesn't have the right to complete the tasks status" }, status: :unprocessable_entity
		end		
  end

  # DELETE /tasks/:id deleting the task
  def destroy
    task = Task.find(params[:id])
    if task.destroy
			render json: {message: "Task deleted successfully"}
		else
			render json: { error: "Something went wrong" }, status: :unprocessable_entity
		end
  end

  # PUT /tasks/:id  updating the task
  def update
    task = Task.find(params[:id])
    task.update(status: 'complete')
    render json: task
  end

  private

	#parameters
  def task_params
    params.permit(:title, :description, :task_date, :status)
  end

	#authorizing the client
	def authorize_client
		render_unauthorized unless @current_user.client?
	end

	#authorizing the manager
  def authorize_manager
    render_unauthorized unless @current_user.manager?
  end

	#authorizing the employee
  def authorize_employee
    render_unauthorized unless @current_user.employee?
  end
end
