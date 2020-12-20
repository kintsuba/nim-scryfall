import options
import legalities, image_uris, prices, purchase_uris, related_uris

type Card* = object
  arena_id : Option[int]
  id : string
  lang : string
  mtgo_id : Option[int]
  mtgo_foil_id : Option[int]
  multiverse_ids : seq[int]
  tcgplayer_id : Option[int]
  cardmarket_id : Option[int]
  `object` : string
  oracle_id : string
  prints_search_uri : string
  ruling_uri : string
  scryfall_uri : string
  uri : string

  # all_parts : array
  # card_faces : array
  cmc : int
  color_identity : string
  color_indicator : Option[string]
  colors : Option[string]
  edhrec_rank : Option[int]
  foil : bool
  hand_modifier : Option[string]
  # keywords : array
  layout : string
  legalities : Legalities
  life_modifier : Option[string]
  loyalty : Option[string]
  mana_cost : Option[string]
  name : string
  nonfoil : bool
  oracle_text : Option[string]
  oversized : bool
  power : Option[string]
  produced_mana : Option[string]
  reserved : bool
  toughness : Option[string]
  type_line : string

  artist : Option[string]
  booster : bool
  border_color : string
  card_back_id : string
  collector_number : string
  content_warning : Option[bool]
  digital : bool
  flavor_name : Option[string]
  flavor_text : Option[string]
  # frame_effects : array
  frame : string
  full_art : bool
  # games : array
  highres_image : bool
  illustration_id : Option[string]
  image_uris : ImageUris
  prices : Prices
  printed_name : Option[string]
  printed_text : Option[string]
  printed_type_line : Option[string]
  promo : bool
  # promo_types : array
  purchase_uris : PurchaseUris
  rarity : string
  related_uris : RelatedUris
  released_at : string
  reprint : bool
  scryfall_set_uri : string
  set_name : string
  set_search_uri : string
  set_type : string
  set_uri : string
  `set` : string
  story_spotlight : bool
  textless : bool
  variation : bool
  variation_of : Option[string]
  watermark : Option[string]