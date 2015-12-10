require "hash_deep_reject/version"

module HashDeepReject
  # In a nested Hash, rejects values that return true from the block:
  # 
  #   {a: {b: {c: ""}, d: ""}}.deep_reject! { |k,v| v.blank? }
  #   # => {:a=>{:b=>{}}}
  #
  # If you want to call the block on Hash-type values after they've
  # been iterated through (for example, to remove empty Hashes), 
  # pass +true+ as the first argument. For example,
  # 
  #  {a: {b: 1}, c: {d: ""}}.deep_reject! { |k,v| v.blank? }
  #  # => {:a=>{:b=>1}, :c=>{}}
  #
  #  {a: {b: 1}, c: {d: ""}}.deep_reject!(true) { |k,v| v.blank? }
  #  # => {:a=>{:b=>1}}
  #
  def deep_reject!(call_on_hash=false, &blk)
    delete_if do |k,v|
      if v.is_a?(Hash)
        v.deep_reject!(call_on_hash, &blk)
        call_on_hash ? blk.call(k,v) : false
      else
        blk.call(k,v)
      end
    end
  end
end

class ::Hash
  include HashDeepReject
end
