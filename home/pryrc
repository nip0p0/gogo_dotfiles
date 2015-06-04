require 'csv'
require 'pry'
class CSV::Table
  def group_by(sym_or_num=nil, &blk)
    arys = if sym_or_num
      super() { |e| e[sym_or_num] }
    else
      super(&blk)
    end
    arys.map { |k, v| [k, CSV::Table.new(v)] }.to_h
  end
end

