class Array
    def my_select(&prc)
        res = []
        self.each { |i| res << i if prc.call(i) }
        res
    end

    def my_each(&prc)
        i = 0
        while i <= self.length-1
            prc.call(self[i])
            i += 1
        end
        self
    end

    def my_reject(&prc)
        res = []
        self.each { |i| res << i if !prc.call(i) }
        res
    end

    def my_any?(&prc)
        self.each {|ele| return true if yield(ele)}
        false
    end

    def my_all?(&prc)
        self.each {|ele| return false if !yield(ele)}
        true
    end

    def my_flatten 
        return [self] if !self.is_a? Array 
        return self if self.none? {|ele| ele.is_a? Array}
        return self if self.none? {|ele| ele.is_a? Array}
            new_arr = []
            self.each do |ele|
                if !ele.is_a? Array
                    new_arr << ele
                else
                    ele.each {|ele2| new_arr << ele2}
                end
            end
            new_arr.my_flatten 
    end

    def my_zip(*arr)
        arr.unshift(self)
        new_arr = Array.new(self.length) {Array.new(arr.length)}
        hsh = Hash.new {Array.new}
        arr.each do |ele|
          ele.each.with_index { |i, idx| hsh[idx] += [i] }
        end
        hsh.each do |key, val|
            val.each.with_index do |ele, idx|
            new_arr[key][idx] = ele if key < new_arr.length
            end
        end
        new_arr
        # hsh
    end
    
end

# calls my_each twice on the array, printing all the numbers twice.
return_value = [1, 2, 3].my_each do |num|
    puts num
   end.my_each do |num|
    puts num
   end
   # => 1
   #    2
   #    3
   #    1
   #    2
   #    3
   
#    p return_value  # => [1, 2, 3]
puts "////////"


a = [1, 2, 3]

p a.my_select { |num| num > 1 } # => [2, 3]
p a.my_select { |num| num == 4 } # => []
puts "////////"


a = [1, 2, 3]
p a.my_reject { |num| num > 1 } # => [1]
p a.my_reject { |num| num == 4 } # => [1, 2, 3]
puts "////////"


a = [1, 2, 3]
p a.my_any? { |num| num > 1 } # => true
p a.my_any? { |num| num == 4 } # => false
p a.my_all? { |num| num > 1 } # => false
p a.my_all? { |num| num < 4 } # => true
puts "////////"

p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]
puts
puts "////////"

a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]


p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]
puts "////////"

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"

# p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# p [ 1 ].my_reverse               #=> [1]