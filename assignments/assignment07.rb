# ========================================================================================
#  Problem 1 - Observable

# implement Observable
# validate using MiniTest unit tests
  require 'MiniTest/autorun'
  module Assignment07
    module Observable
    def initial_observers
      @observers = Array.new
    end
    def add_observer(obj)
      @observers << obj
    end
    def delete_observer(obj)
      @observers.delete obj
    end
    def delete_observers
      @observers = Array.new
    end

    def count
        @observers.count
    end

    def changed(new_state=true)
      @status = true
    end
    def changed?
      @status == true
    end
    def notify_observers(*args)
      if @status
      @observers.each {|x| x.update(*args)}
      @status = false
      end
    end
  end

    class Observed
     include Assignment07::Observable
    end
    class Observer
      def initialize
       @headcount = 1
      end
      def headcount
        @headcount
      end
    end


  class TestObserver < Minitest::Test


    def setup
    @content = Observed.new
    @viewer1 = Observer.new
    @viewer2 = Observer.new
    @viewer3 = Observer.new
    end

    def test01
    @content.add_observer(@viewer1)
    @content.add_observer(@viewer2)
    @content.add_observer(@viewer3)

    assert_equal 3, @content.count
    end
  end
