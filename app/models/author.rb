class Author < ApplicationRecord

  def full_name
    [self.first_name, self.last_name].compact.join(' ')
  end
end
