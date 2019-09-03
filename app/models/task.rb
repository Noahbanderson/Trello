class Task < ApplicationRecord
  belongs_to :list

  def self.all_tasks(list)
    Task.find_by_sql(["
    SELECT *
    FROM tasks AS t
    WHERE t.list_id = ?
    ", list])
  end

  def self.single_task(task_id)
    Task.find_by_sql(["
    SELECT *  
    FROM tasks AS t
    WHERE t.id = ?
    ", task_id]).first
  end

  def self.create_task(list_id, p)
    Task.find_by_sql(["
    INSERT INTO tasks (task_name, description, t_o_number, list_id, created_at, updated_at)
    VALUES (?, ?, ?, ?, ?, ?)
    ", p[:task_name], p[:description], p[:t_o_number], list_id.id, DateTime.now, DateTime.now])
  end

  def self.update_task(task_id, p)
    Task.find_by_sql(["
    UPDATE tasks AS t
    SET task_name = ?, description = ?, t_o_number = ?, updated_at = ?
    WHERE t.id = ?;
    ", p[:task_name], p[:description], p[:t_o_number], DateTime.now, task_id])
  end

  def self.delete_task(task)
    Task.find_by_sql(["
    DELETE FROM tasks AS t
    WHERE t.id = ?
    ", task])
  end

end
