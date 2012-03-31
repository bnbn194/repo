require "nn/basicNeuronModel.rb"

"""
ニューロンのモデルで論理演算
"""

n = BasicNeuronModel.new

# AND演算
"""
x_1 |   x_2 |   y
0   |   0   |   0
0   |   1   |   0
1   |   0   |   0
1   |   1   |   1
"""
puts "*AND演算"
weight = [1,1]
threshold = 1.5

_in = [0,0]
puts n.Neuron(_in, weight, threshold)
_in = [0,1]
puts n.Neuron(_in, weight, threshold)
_in = [1,0]
puts n.Neuron(_in, weight, threshold)
_in = [1,1]
puts n.Neuron(_in, weight, threshold)


# OR演算
"""
x_1 |   x_2 |   y
0   |   0   |   0
0   |   1   |   1
1   |   0   |   1
1   |   1   |   1
"""
puts
puts "*OR演算"
weight = [1,1]
threshold = 0.5

_in = [0,0]
puts n.Neuron(_in, weight, threshold)
_in = [0,1]
puts n.Neuron(_in, weight, threshold)
_in = [1,0]
puts n.Neuron(_in, weight, threshold)
_in = [1,1]
puts n.Neuron(_in, weight, threshold)
