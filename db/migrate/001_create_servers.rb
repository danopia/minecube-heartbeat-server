class CreateServers < ActiveRecord::Migration
  def self.up
    create_table :servers do |t|
      t.timestamp :first_seen_at
      t.string :hostname
      t.integer :port
      t.string :title
      t.integer :beat_counter
      t.integer :game_mode
      t.string :key

      t.timestamps
    end
  end

  def self.down
    drop_table :servers
  end
end
