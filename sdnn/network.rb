
class Network
    def initialize
    end
    def modify(aSymbol, aModifier)
        """ 修飾パターンの並び替え """
        aModifier = permutation(aModifier)

        """ 修飾パターンが-1のとき0に不感化 """
        result = []
        aSymbol.each_with_index do |word, index|
            if aModifier[index] == -1 then
                result << 0
            else
                result << word
            end
        end
        return result
    end
    def permutation(aModifier)
        """ 巡回置換 """
        cyclicPermutation = [1,8,12,5,13,2,10,0,4,11,15,6,3,14,7,9]
        (cyclicPermutation.length-1).times do |i|
            tmp = aModifier[cyclicPermutation[i]]
            aModifier[cyclicPermutation[i]] = aModifier[cyclicPermutation[i+1]]
            aModifier[cyclicPermutation[i+1]] = tmp
        end
        return aModifier
    end
    def makeMiddleLayer()
    end
end

n = Network.new
p n.modify([1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1],[1,1,1,-1,-1,-1,1,1,1,1,1,1,1,-1,-1,-1])
