require "sha3" #SHA3
require_relative "./util"

def generate_namespaceid( name , parent_namespaceid = "" )
  parent_id_of_root  = "00"*8
  parent_namespaceid = parent_id_of_root if parent_namespaceid.empty?
  b_parent_namespaceid = Util.hex_to_bytes( parent_namespaceid )
  # Note: byte order of namespace id
  b_digest = SHA3::Digest.digest( :sha256 , b_parent_namespaceid.reverse + name )
  first_8_bytes = b_digest[0,8]
  ll_first_8_bytes = Util.bytes_to_longlong( first_8_bytes )
  # Most significant bit of NamespaceID is one
  flag = 1<<63
  namespaceid = ll_first_8_bytes | flag
  return Util.fixnum_to_hex( namespaceid )
end
