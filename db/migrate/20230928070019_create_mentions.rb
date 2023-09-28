class CreateMentions < ActiveRecord::Migration[7.0]
  def change
    create_table :mentions do |t|
      t.references :mentioning_reports, foreign_key: {to_table: :reports}
      t.references :mentioned_reports, foreign_key: {to_table: :reports}
    end
  end
end
