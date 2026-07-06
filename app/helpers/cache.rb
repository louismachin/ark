def clear_cache
    $iota_cache       = nil
    $object_count     = 0
    $writing_count    = 0
    $picture_count    = 0
    $other_count      = 0
    $collection_cache = nil
    $tag_cache = nil
end

clear_cache