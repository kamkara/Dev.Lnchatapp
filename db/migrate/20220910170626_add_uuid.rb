class AddUuid < ActiveRecord::Migration[7.0]
  def change
    #Add Uuid Extension
    enable_extension "pgcrypto"
  end
end
