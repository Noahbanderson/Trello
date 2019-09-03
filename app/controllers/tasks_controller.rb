# class TasksController < ApplicationController
#   before_action :set_list
#   before_action :set_task, only: [:show, :edit, :update, :destroy]
  
#   def index
#     binding.pry
#     @tasks = List.tasks(@list)
#   end

#   def show
#   end

#   def new
#     @task = @list.tasks.new
#     render :template => "tasks/_form"
#   end

#   def create
#     @task = @list.tasks.new(task_params)
  
#     if @task.save
#       redirect_to list_tasks_path(@list)
#     else
#       render :template => "tasks/_form"
#     end
#   end

#   def edit
#     render :template => "tasks/_form"
#   end

#   def update
#     if @task.update(task_params)
#       redirect_to list_tasks_path(@list)
#     else
#       render :template => "tasks/_form"
#     end
#   end



#   def destroy

#     @task.destroy
#    # Task.delete_task(@task)

#     redirect_to list_tasks_path(@task)
#   end

#   private

#     def set_list
#       @list = List.find(params[:list_id])
#     end

#     def set_task
#       binding.pry
#       @task = Task.find(params[:id])
#     end

#     def task_params
#       params.require(:task).permit(:task_name, :description, :t_o_number)
#     end  

# end







































class TasksController < ApplicationController
  before_action :set_list
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks = Task.all_tasks(@list)
  end

  def show
  end

  def new
    @task = @list.tasks.new
    render :template => "tasks/_form"
  end

  def create
    Task.create_task(@list, task_params)
    redirect_to list_tasks_path(@list)
  end

  def edit
    render :template => "tasks/_form"
  end

  def update
    if Task.update_task(@list, task_params)
      redirect_to list_tasks_path(@task.list_id)
    else
      render :template => "tasks/_form"
    end
  end

  def destroy

    @task.destroy
   # Task.delete_task(@task)

    redirect_to list_tasks_path(@task)
  end

  private

    def set_list
      binding.pry
      @list = List.all_list_stuff(params[:list_id])
    end

    def set_task
      binding.pry
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:task_name, :description, :t_o_number)
    end  

end
