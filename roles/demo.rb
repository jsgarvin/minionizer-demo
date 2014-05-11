class Demo < Minionizer::RoleTemplate

  def call
    puts session.exec('hostname')[:stdout]
  end

end
