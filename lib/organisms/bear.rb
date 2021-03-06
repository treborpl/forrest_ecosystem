require 'colorize'
require_relative 'organism'

class Bear < Organism
  def initialize(location, logger)
    super
    location.bear = self
    notify_observers(self, :bear_added)
  end

  def take_turn
    moves_per_turn.times do
      if move
        return if location.lumberjack? && maul
      end
    end
  end

  def removed
    changed
    notify_observers(self, :bear_removed)
  end

  def to_s
    'B'.cyan
  end

  private

  def move
    new_location = location.neighbour_location
    return false if new_location.bear?

    location.bear = nil
    new_location.bear = self
    self.location = new_location
    new_location.bear?
  end

  def moves_per_turn
    5
  end

  def maul
    return false unless location.remove_lumberjack

    changed
    notify_observers(self, :maul_lumberjack)
    true
  end
end
