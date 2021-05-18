class TasksController < ApplicationController
    before_action :authenticate_user!

    def show
        @task = current_user.task
    end

    def edit
        @task = current_user.prepare_task
    end

    def update
       @task = current_user.prepare_task
       @task.assign_attributes(task_params)
        if @task.save
            redirect_to task_path, notice: 'プロフィール更新'
        else
            flash.now[:error] = '更新できませんでした'
            render :edit
        end
    end

    private
    def task_params
        params.require(:task).permit(
            :nickname,
            :introduction,
            :gender,
            :birthday,
            :subscribed,
            :avatar
        )
    end
end