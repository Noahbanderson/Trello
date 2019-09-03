class Board < ApplicationRecord
  belongs_to :user
  has_many :lists, dependent: :destroy


  def self.all_boards(id)
    Board.find_by_sql(["
    SELECT *
    FROM boards AS b
    WHERE b.user_id = ?
    ", id])
  end

  def self.single_board_user(user_id, board_id)
    Board.find_by_sql(["
      SELECT *
      FROM boards AS b
      WHERE b.user_id = ? AND b.id = ?;
    ", user_id, board_id
    ]).first
  end

  def self.single_board_id(board_id)
    Board.find_by_sql(["
    SELECT *
    FROM boards AS b
    WHERE b.id = ?
    ", board_id
    ]).first   
  end

  def self.create_board(id, p)
    Board.find_by_sql(["
    INSERT INTO boards (board_title, b_o_number, user_id, created_at, updated_at)
    VALUES (:board_title, :b_o_number, :user_id, :created_at, :updated_at);
    ", {
      board_title: p[:board_title],
      b_o_number: p[:b_o_number],
      user_id: id,
      created_at: DateTime.now,
      updated_at: DateTime.now
    }])
  end

  def self.update_board(id, p)
    Board.find_by_sql(["
    UPDATE boards as b
    SET board_title = ?, b_o_number = ?, updated_at = ? 
    WHERE b.id = ?;
    ", p[:board_title], p[:b_o_number] ,DateTime.now, id
    ])
  end

  def self.destroy_board(id)
    Board.find_by_sql(["
    DELETE FROM boards AS b
    WHERE b.id = ?;
    ", id])
  end

end
