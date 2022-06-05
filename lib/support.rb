# TODO: Avoid monkey patching Fixnum class

class Integer
  def rand_sum(n = 2)
    number_1s = (n-1).times.map{|x| 1 }

    [number_1s, (self - (n-1))].flatten
  end
end
