class User

  attr_reader :first_name, :last_name
  attr_accessor :special_skill

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end
end