class Tenant < ApplicationRecord
  before_create :generate_api_key
  
  private

  def generate_api_key
    # don't want collisions on the api_key to be valid so regenerate in the event of a collision
    begin
      self.api_key = SecureRandom.hex(16)
    end while self.class.exists?(api_key: api_key)
  end

end
