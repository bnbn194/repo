require "nn/base.rb"

class Neuron < Base
    def initialize()
    end

    def basicModel(aIn, aWeight, aThreshold)
        """
        *Arguments
        aIn :   入力
        aWeight:    重み（荷重）
        aThreshold: しきい値

        *Return value
        Σ(入力×重み)-しきい値>0となる時に1を返す。
        Σ(入力×重み)-しきい値<0のとき0を返す。

        *Reference
        http://www.geocities.co.jp/SiliconValley-Cupertino/3384/nn/NN.html#model
        """
        totalAmount = 0.0;
        if aIn.size > aWeight.size then
            error("Invalid input value")
            return
        end
        aIn.each_with_index do |lIn, i| 
            totalAmount += lIn * aWeight[i];
            #dump {
                p [:i=>i, :in=>lIn, :totalAmount=>totalAmount]
            # }
            if totalAmount > aThreshold then
                return 1
            end
        end
        return 0
    end

end

_in = [1,2,3,4,5,6,7,8,9,10]
weight = [0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1]
threshold = 12

n = Neuron.new
print n.basicModel(_in, weight, threshold)

