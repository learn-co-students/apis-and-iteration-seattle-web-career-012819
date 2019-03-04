class Project
  attr_reader :title, :backers
  @@all = []

  def initialize(title)
    @title = title
    @backers = []
  end

  def self.all
    @@all
  end

  # accepts a Backer as an argument and stores it in a backers array
  def add_backer(backer)
    backers << backer

    # adds the project to the backer's backed_projects array
    backer.backed_projects << self
  end
end
