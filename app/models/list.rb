class List < ApplicationRecord
  belongs_to :board
  has_many :tasks, dependent: :destroy

  def self.all_lists(board_id)
    List.find_by_sql(["
    SELECT *
    FROM lists AS l
    WHERE l.board_id = ?
    ", board_id])
  end

  def self.single_list(list_id)
    List.find_by_sql(["
    SELECT *
    FROM lists AS l
    WHERE l.id = ?;
    ", list_id]).first
  end

  def self.create_list(board_id, p)
    List.find_by_sql(["
    INSERT INTO lists (list_title, l_o_number, board_id, created_at, updated_at)
    VALUES (?, ?, ?, ?, ?)
    ", p[:list_title], p[:l_o_number], board_id.id, DateTime.now, DateTime.now]).first
  end

  def self.update_list(list_id, p)
    List.find_by_sql(["
    UPDATE lists AS l
    SET list_title = ?, l_o_number = ?, updated_at = ?
    WHERE l.id = ?;
    ", p[:list_title], p[:l_o_number], DateTime.now, list_id])
  end

  def self.destroy_list(list_id)
    List.find_by_sql(["
    DELETE FROM lists AS l
    WHERE l.id = ?;
    ", list_id])
  end

  def self.all_list_stuff(list_id)
    List.find_by_sql(["
      SELECT *
      FROM lists AS l
      WHERE l.id = ?
      ", list_id
      ]).first   
  end
end
