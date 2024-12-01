# frozen_string_literal: true

require_relative "budget_validator/version"

module BudgetValidator
  class BudgetChecker
    attr_reader :budget

    def initialize(budget)
      @budget = budget
      @total_expenses = 0;
    end

    def add_expense(amount)
      raise ArgumentError, "Amount must be positive" if amount.negative? 
      new_total = @total_expenses + amount
      if new_total > @budget
        raise StandardError,
        "Budget has been exceeded. Total is: #{new_total}, Budget is: #{@budget}"
    end

    @total_expenses = new_total
    @total_expenses
  end

  def total_expenses
    @total_expenses
  end


  class Error < StandardError; end
  # Your code goes here...
end
