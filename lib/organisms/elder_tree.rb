require_relative 'tree'

class ElderTree < Tree
  def lumber
    2
  end

  private

  def mature_period_in_months
    nil
  end

  def spawning_permitted?
    true
  end

  def spawn_chance
    20
  end

  def grow_to
    nil
  end
end
