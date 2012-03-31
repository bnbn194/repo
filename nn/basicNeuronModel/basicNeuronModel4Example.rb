require "nn/basicNeuronModel.rb"

_in = [1,2,3,4,5,6,7,8,9,10]
weight = [0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1]
threshold = 12

n = BasicNeuronModel.new
print n.Neuron(_in, weight, threshold)

