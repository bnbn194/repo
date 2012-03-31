require "nn/basicNeuronModel/errorCorrectionLearningMethod.rb"

"""
誤り訂正学習法（教師付き）　論理演算
"""

def study(n, _in, teacher, threshold)
    weight = [0,0,0]
    out = -1 
    print "in:"
    p _in
    print "teacher:"
    puts teacher
    until out == teacher
        # 基本的にはココでweight(重み)の訂正してる。
        # teacher(理想の答え)と一致したら重みを保存することで
        # 学習したことになる。
        out = n.Neuron(_in, weight, threshold)
        weight = n.ErrorCorrection(weight, out, teacher)
        print "weight:"
        p weight
    end
    print "out:"
    puts out
    puts
    return weight
end

def test(n, problem, threshold)
    problem[:in].each_with_index do |_in, i|
        print "in:"
        p _in
        print "weight:"
        p problem[:memory][i]
        out = n.Neuron(_in, problem[:memory][i], threshold)
        print "out:"
        puts out
        puts
    end
end

n = ErrorCorrectionLearningMethod.new
threshold = 1.5

# 結果が長いので
# true ...  AND演算 
# false ... OR演算
if false then

puts "*AND演算"
"""
x_1 |   x_2 |   x_3 |   y
0   |   0   |   0   |   0
1   |   0   |   0   |   0
1   |   0   |   1   |   0
1   |   1   |   0   |   0
1   |   1   |   1   |   1
"""
problem = {
        :in => [
            [0, 0, 0],
            [1, 0, 0],
            [1, 0, 1],
            [1, 1, 0],
            [1, 1, 1]
        ],
        :teacher => [0, 0, 0, 0, 1],
        :memory => []
}

else

puts "*OR演算"
"""
x_1 |   x_2 |   x_3 |   y
0   |   0   |   0   |   0
1   |   0   |   0   |   1
1   |   0   |   1   |   1
1   |   1   |   0   |   1
1   |   1   |   1   |   1
"""
problem = {
        :in => [
            [0, 0, 0],
            [1, 0, 0],
            [1, 0, 1],
            [1, 1, 0],
            [1, 1, 1]
        ],
        :teacher => [0, 1, 1, 1, 1],
        :memory => []
}

end

puts "学習はじめ"
problem[:in].each_with_index do |_in, i|
    problem[:memory][i] = study(n, _in, problem[:teacher][i], threshold)
end
puts "学習おわり"
puts

puts "学習結果"
print "memory:"
p problem[:memory]
puts

puts "テストはじめる"
puts "*test"
test(n, problem, threshold)
puts "テストおわり"
