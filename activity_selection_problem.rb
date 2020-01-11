require 'test/unit'
require 'pry'
class ActivitySelectionProblem < Test::Unit::TestCase

  def test_calc
    activities = [[0, 6], [3, 4], [1, 2], [5, 8], [5, 7], [8, 9]]
    assert_equal([[1, 2], [3, 4], [5, 7], [8, 9]], calc(activities))

    activities = [[0, 6], [3, 4], [1, 2], [5, 8], [5, 7], [8, 9], [10, 11]]
    assert_equal([[1, 2], [3, 4], [5, 7], [8, 9], [10, 11]], calc(activities))
  end

  def calc(array)
    sorted_arrays = array.sort_by { |a| a[1] }
    results = []

    sorted_arrays.each_with_index do |array, i|
      if i == 0
        results << sorted_arrays[0]
      else
        last_activity = results.last
        if array[0] >= last_activity[1]
          results << array
        end
      end
    end
    results

  end

end
