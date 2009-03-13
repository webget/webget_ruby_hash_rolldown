# = HashRolldown
#
# Author:: Joel Parker Henderson, joelparkerhenderson@gmail.com
# Copyright:: Copyright (c) 2007-2009 Joel Parker Henderson
# License:: CreativeCommons License, Non-commercial Share Alike
# License:: LGPL, GNU Lesser General Public License
#
# HashRolldown aggregates value for a hash of hashes,
# for example to help calculate subtotals grouped by key.
#
# Example:
#   h=Hash.new
#   h['a']=Hash.new
#   h['b']=Hash.new
#   h['c']=Hash.new
#   h['a']['x']=1
#   h['a']['y']=2
#   h['a']['z']=3
#   h['b']['x']=4
#   h['b']['y']=5
#   h['b']['z']=6
#   h['c']['x']=7
#   h['c']['y']=8
#   h['c']['z']=9
#   h.rolldown => {"x"=>[1,4,7],"y"=>[2,5,8],"z"=>[3,6,9]}
#
# = Calculating subtotals
#
# The rolldown method is especially useful for calculating subtotals by key.
#
# Example:
#   r=h.rolldown  
#   r['x'].sum => 12
#   r['y'].sum => 15
#   r['z'].sum => 18
#
# = Block customization   
#                                                                 
# You can provide a block that will be called for the rolldown items.  
#
# Example:
#   h.rolldown{|items| items.max } => {"a"=>7,"b"=>8,"c"=>9}
#   h.rolldown{|items| items.join("-") } => {"a"=>"1-4-7","b"=>"2-5-8","c"=>"3-6-9"}
#   h.rolldown{|items| items.inject{|sum,x| sum+=x } } => {"a"=>12,"b"=>15,"c"=>18}   
#                                                           
##                                                                                     

module HashRolldown

  def rolldown(&b)
    a=self.class.new
    each_pair{|k1,v1|
      v1.each_pair{|k2,v2|
        a[k2]=[] if (a[k2]==nil or a[k2]=={})
        a[k2]<<(v2)
      }
    }
    if block_given? 
      a.each_pair{|k,v| a[k]=(yield v)}
    end
    a
  end

end

class Hash
 include HashRolldown
end
