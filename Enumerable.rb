module Enumerable
    def my_each
        n= self.length
        i = 0
        while i < n
            yield(self[i])
            i += 1
        end
        return self
    end
    def my_each_with_index
        n= self.length
        i = 0
        while i < n
            yield(self[i], i)
            i += 1
        end
        return self
    end
    def my_select
        pick = []
        self.my_each { |x|
            if yield(x)
                pick.push(x)
            end
        }
        return pick
    end
    def my_all?
        self.my_each { |x|
        if yield(x) == false
            return false
        end
        }
        return true
    end
    #my_any?
    def my_any?
        self.my_each { |x|
        if yield(x) == true
            return true
        end
        }
        return false
    end
    #my_none?
    def my_none?
        self.my_each { |x|
        if yield(x) == true
            return false
        end
        }
        return true
    end
    #my_count
    #my_map
    #my_inject
end

array = ["a","b","c",0,1,2,3,true,false]
num_array = [1,2,3,4,5,6,7]
string_array = ["ab","abc","abcd"]
bool_array = [true,false,true]

array.my_each { |x|
    puts x
}
puts "________"

array.my_each_with_index { |x,y|
    puts x if y.odd?
}
puts "________"

puts num_array.my_select {|x| x.odd?}

puts string_array.my_select {|x| x != "a"}

puts "________"

puts string_array.my_all? {|x| x.length >3}

puts "________"

puts string_array.my_any? {|x| x.length >3}



