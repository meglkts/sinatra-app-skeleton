class List < ActiveRecord::Base
  has_many :tasks
  belongs_to :user

  def completed_tasks
  	if completed = self.tasks.where(completed: true)
  		completed
  	else
  		[]
  	end
  end

  def outstanding_tasks
  	if outstanding = self.tasks.where(completed: nil)
  		outstanding
  	else
  		[]
  	end
  	
  end
end
