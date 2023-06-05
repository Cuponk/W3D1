def factors(num)
  arr = []
  (1..num).each {|ele| arr << ele if num % ele == 0}
  arr
  
end

def substrings(string)

end

def subwords(word, dictionary)
end

def doubler(array)
end

class Array

  proccer = Proc.new { |num1, num2| num1 <=> num2 }

  def bubble_sort!(&prc)
    prc ||= Proc.new { |num1, num2| num1 <=> num2 }
    sorted = false
    while !sorted 
      sorted = true
      (0...self.length - 1).each do |i|
        if prc.call(self[i], self[i+1]) == 1
          self[i], self[i+1] = self[i+1], self[i]
          sorted = false
        end
      end
    end
    nil
  end

  def bubble_sort(&prc)

  end

  def my_each(&prc)
    i = 0
    while i <= self.length-1
        prc.call(self[i])
        i += 1
    end
    self
  end

  def my_map(&prc)
  end

  def my_select(&prc)
    res = []
    self.each { |i| res << i if prc.call(i) }
    res
  end

  def my_inject(&blk)
  end

end

def concatenate(strings)
end

p factors(20)
p factors(42)
p factors(7)
p factors(0)

arr = [5, 3, 1]
arr2 = [1, 3, 2, 5]

arr.bubble_sort!
p arr
arr2.bubble_sort! { |num1, num2| num2 <=> num1 } 
p arr2

