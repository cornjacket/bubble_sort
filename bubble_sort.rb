## Need to use clone or maybe dup so that this is not destructive.
# how to check if new_list and list are different


# this algorithm can be improved in several ways

def bubble_sort(list)
# list is an array of items to sort
  new_list = list.dup
# need to display object id's to verigy that different/same lists are used without dup or clone
  swapped = true
  while (swapped)
    swapped = false
    1.upto(list.length - 1) do | i |
      if new_list[i-1] > new_list[i]
        new_list[i-1], new_list[i] = new_list[i], new_list[i-1]
        swapped = true
      end
    end
  end
  new_list
end

p bubble_sort([3, 2, 1, 4, 0])

def bubble_sort_by(list)
# does this do what i think or do i need clone? drt
  new_list = list.dup
  swapped = true
  while (swapped)
    swapped = false
    1.upto(list.length - 1) do | i |
      result = block_given? ? yield(new_list[i-1],new_list[i]) : new_list[i-1] - new_list[i]
      if result > 0
        new_list[i-1], new_list[i] = new_list[i], new_list[i-1]
        swapped = true
      end
    end
  end
  new_list
end

#p bubble_sort_by([3, 2, 1, 4, 0]) { |left, right| right-left}
#p bubble_sort_by([3, 2, 1, 4, 0])
#p bubble_sort_by(["hi","hello","hey"]) { |left,right| right.length - left.length}