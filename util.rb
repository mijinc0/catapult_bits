module Util
  class << self
    def bytes_to_hex( bytes )
      return bytes.unpack("H*").first
    end

    def hex_to_bytes( hex )
      return [hex].pack("H*")
    end

    def fixnum_to_hex( num )
      hex = num.to_s(16)
      hex = "0" + hex if hex.size.odd?
      return hex
    end

    { long: "L" , longlong: "Q" }.each do | n , t |
      define_method( "#{n}_to_bytes" ){ | num   , order=:little | fixnum_to_bytes( num   , t , order ) }
      define_method( "bytes_to_#{n}" ){ | bytes , order=:little | bytes_to_fixnum( bytes , t , order ) }
    end

    private

    def byte_order_to_sign( byte_order )
      return byte_order == :little ? "<" : ">"
    end

    def fixnum_to_bytes( num , type , byte_order = :little )
      return [ num ].pack("#{type}#{byte_order_to_sign( byte_order )}")
    end

    def bytes_to_fixnum( bytes , type , byte_order = :little )
      return bytes.unpack("#{type}#{byte_order_to_sign( byte_order )}").first
    end
  end
end
