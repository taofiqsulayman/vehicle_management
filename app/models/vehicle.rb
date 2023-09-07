class Vehicle < ApplicationRecord
  include AASM

  attr_accessor :acceptable_pattern

  aasm column: 'current_state' do
    state :designed, initial: true
    state :assembled
    state :painted
    state :tested

    event :to_assembled do
      transitions from: [:designed], to: :assembled
    end

    event :to_painted do
      transitions from: [:assembled], to: :painted
    end

    event :to_tested do
      transitions from: [:painted], to: :tested
    end
  end

  # Method to set the acceptable pattern
  def set_acceptable_pattern(pattern)
    @acceptable_pattern = pattern
  end
end
