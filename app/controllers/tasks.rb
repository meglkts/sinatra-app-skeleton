get '/lists/:list_id/tasks/new' do
	@task = Task.new
	@list = List.find(params[:list_id])
	if request.xhr?
		erb :"tasks/new", layout: false
	else
		erb :"tasks/new"
	end
end

post '/lists/:list_id/tasks' do
	task = Task.new(params[:task])
	list = current_user.lists.find(params[:list_id])
	if task.save
		list.tasks << task
		if request.xhr?
			erb :"lists/_list_task", layout: false, locals: { task: task, list: list }
		else
			redirect to "/lists/#{params[:list_id]}"
		end
	else
		erb :"tasks/new"
	end
end

put '/lists/:list_id/tasks/:task_id' do
	@task = Task.find(params[:task_id])
	@task.completed = true
	@list = current_user.lists.find(params[:list_id])
	if @task.save
		redirect to "lists/#{@list.id}"
	else
		erb :"lists/#{@list.id}"
	end
end

delete '/lists/:list_id/tasks/:task_id' do
	@task = Task.find(params[:task_id]).destroy
	redirect to "/lists/#{params[:list_id]}"
end