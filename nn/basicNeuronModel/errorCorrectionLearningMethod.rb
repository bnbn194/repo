require "nn/base.rb"

"""
誤り訂正学習法（教師付き）
"""

class ErrorCorrectionLearningMethod < Base
    def initialize
        @learningRate = 0.1
    end
    attr_accessor :learningRate
    def Neuron(aIn, aWeight, aThreshold)
        """
        *Arguments
        aIn :   入力
        aWeight:    重み（荷重）
        aThreshold: しきい値
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

    def ErrorCorrection(aWeight, aOut, aTeacher) 
        """
            (@teacher - out) = {
                @teacher == 1 & out == 0    のとき  1
                @teacher == 0 & out == 1    のとき  -1
                @teacher == out             のとき  0
            }
        """
        newWeight = []
        aWeight.each_with_index do |oldWeight, i|
            newWeight[i] = oldWeight + @learningRate * (aTeacher - aOut)
        end
        return newWeight;
    end
end

