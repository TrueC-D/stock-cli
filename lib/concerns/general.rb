class Concerns
  def find_by(username)
    self.all.find{|element| element.username == username}
  end
end