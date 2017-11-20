class Calculator
	def eval(expression)
		total = 0
		expression = expression.split(',')
		operands = []
		evaluation = []

		expression.each do |input|
			case input
				when /\d/
					evaluation.push(input.to_i)
				when '+'
					operands = evaluation.pop(2)
					total += operands[0].send(input, operands[1])
			end
		end

		puts "Result: #{total}"
	end
end

calculator = Calculator.new

calculator.eval('3,4,+,5,10,+')
