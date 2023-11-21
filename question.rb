class Question

  attr_accessor :num_1, :num_2, :answer, :operators, :operator_name

  def initialize
    @operators = ["+", "-"]
    @num_1 = rand(1..20)
    @num_2 = rand(1..20)
  end

  def new_question
    @operator = @operators.sample

    if @operator == "+"
      @operator_name = "plus"
      @answer = @num_1 + @num_2
    else
      @operator_name = "minus"
      @answer = @num_1 - @num_2
    end

    "What does #{@num_1} #{@operator_name} #{@num_2} equal?"
  end

end
