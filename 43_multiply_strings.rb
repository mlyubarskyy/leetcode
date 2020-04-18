# @param {String} num1
# @param {String} num2
# @return {String}
def multiply(num1, num2)
  (to_i(num1) * to_i(num2)).to_s
end

MAP = {"0"=>0, "1"=>1, "2"=>2, "3"=>3, "4"=>4, "5"=>5, "6"=>6, "7"=>7, "8"=>8, "9"=>9}.freeze

def to_i(str)
  (0...str.size).map do |idx|
    i = ~idx
    MAP[str[i]] * 10 ** idx
  end.sum
end 
