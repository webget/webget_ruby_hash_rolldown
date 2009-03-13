require 'test/unit'
require 'hash_rolldown'

class HashRolldownTest < Test::Unit::TestCase

 def setup
  @h=Hash.new
  @h['a']=Hash.new
  @h['b']=Hash.new
  @h['c']=Hash.new
  @h['a']['x']='m'
  @h['a']['y']='n'
  @h['a']['z']='o'
  @h['b']['x']='p'
  @h['b']['y']='q'
  @h['b']['z']='r'
  @h['c']['x']='s'
  @h['c']['y']='t'
  @h['c']['z']='u'
 end  

 def test_rolldown
  r=@h.rolldown
  assert_equal(['x','y','z'], r.keys.sort)
  assert_equal(['m','p','s'], r['x'].sort)
  assert_equal(['n','q','t'], r['y'].sort)
  assert_equal(['o','r','u'], r['z'].sort)
 end

 def test_block
   r = @h.rolldown{|items| items.sort.inject{|sum,x| sum+=x}}
   assert_equal(['x','y','z'], r.keys.sort)
   assert_equal('mps', r['x'])
   assert_equal('nqt', r['y'])
   assert_equal('oru', r['z'])
 end

    
end
