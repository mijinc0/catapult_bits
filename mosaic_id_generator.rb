require  "digest/sha3" #Keccak
require 'sha3' #SHA3
require_relative "./util"

# [ ver cow mosaic ID ]
# digest = Hash( nonce + pubkey )
# first_8_bytes = get_first_8_bytes( digest )
# mosaic_id = MSB_set_zero( first_8_bytes )
def generate_mosaicid( h_pubkey , nonce )
  b_pubkey = Util.hex_to_bytes( h_pubkey )
  b_nonce  = Util.long_to_bytes( nonce )
  b_digest = SHA3::Digest.digest( :sha256 , b_nonce + b_pubkey )
  first_8_bytes = b_digest[0,8]
  ll_first_8_bytes = Util.bytes_to_longlong( first_8_bytes )
  # Most significant bit of MosaicID is zero
  mask = 0xffffffffffffffff ^ (1<<63)
  mosaicid = ll_first_8_bytes & mask
  return Util.fixnum_to_hex( mosaicid )
end
