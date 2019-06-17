# class EnumerableTest
    module Enumerable
        def do_me
            "done"
        end
        
        def my_each
            i = 0
            while i < self.size
                yield(self[i])  
                i+=1      
            end
            puts ""
            self
        end


        def my_each_with_index
            i = 0
            while i < self.size
                yield(i,self[i])  
                i+=1      
            end
            self
        end


        def my_select
            i = 0
            j = 0
            @outputArray = []

            while i < self.size

                if yield(self[i])
                    @outputArray[j] = self[i]
                    j += 1
                end

                i+=1      
            end
            @outputArray
        end


        def my_all?
            i = 0
            all = true
            while i < self.size
                if !yield(self[i])
                    all = false
                end
                    
                i+=1      
            end
            all
        end


        def my_any?
            i = 0
            any = false
            while i < self.size
                if yield(self[i])
                    any = true
                end
                    
                i+=1      
            end
            any
        end


        def my_none?
            i = 0
            none = true
            while i < self.size
                if yield(self[i])
                    none = false
                end
                    
                i+=1      
            end
            none
        end


        def my_count
            i = 0
            count = 0
            while i < self.size
                if yield(self[i]) == true
                    count += 1
                end
                    
                i+=1      
            end
            # puts count
            count
        end


        def my_map(proc=false)
            i = 0

            outputArray = []
            while i < self.size

                if proc
                    outputArray[i] = proc.call(self[i])
                else
                    outputArray[i] = yield(self[i])
                end

                i+=1      
            end
            outputArray
        end





        def my_inject(iv)

            i = 0
            @acc = iv

            while i < self.size

                @acc = yield(@acc,self[i])

                i+=1      

            end
            @acc
        end
    end # module Enumberable
# end # class EnumerableTest



# end
# enumerableTest = EnumerableTest.new
# enumerableTest.my_each { |num| print "#{num}!" }
# [1,2,3].my_each { |num| print "#{num}!" }

# [1,2,3].my_each { |num| print "#{num}!" }

# [1,2,3].my_each_with_index { |num,index| puts "num: #{num}, index: #{index}" }
# enumerableTest = EnumerableTest.new
# enumerableTest = [1,2,3]
# [1,2,3].my_each { |num| print "#{num}!" }

# enumerableTest = EnumerableTest.new
# puts [1,2,3].my_select { |num| num.even? }

# [0,2,4].my_all? { |num| num.even? }

# [1,3,3,0].my_any? { |num| num.even? }

# [1,3,6].my_none? { |num| num.even? }

# [1,2,3,4].my_count { |num| num.even? }

# [1,2,3,4].my_map { |num| num * 2 }

# [1,2,3,4].my_inject(0) { |acc, val| acc + val * 2 }

# multiply_els([2,4,5])

# puts [1,2,3,4].inject(0) { |acc,val| acc + val * 2 }

# my_proc = Proc.new { |num| num * 2 }

# [1,2,3,4].my_map(my_proc) { |num| num * 3 }







