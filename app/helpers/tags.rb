# Returns [[tag, css_class], ...] sorted alphabetically by tag.
# css_class is one of 'sm', nil (default size), 'lg', 'xl' based on
# how often the tag appears relative to the least/most common tag.

def get_tag_cloud
    counts = Hash.new(0)
 
    get_iotas.each do |iota|
        iota.tags.each { |tag| counts[tag] += 1 }
    end
 
    return [] if counts.empty?
 
    min_count, max_count = counts.values.min, counts.values.max

    counts.sort_by { |tag, _count| tag.downcase }.map do |tag, count|
        [tag, tag_cloud_class(count, min_count, max_count)]
    end
end
 
def tag_cloud_class(count, min_count, max_count)
    return nil if max_count == min_count
    ratio = (count - min_count).to_f / (max_count - min_count)
    if ratio >= 0.85
        'xl'
    elsif ratio >= 0.6
        'lg'
    elsif ratio < 0.25
        'sm'
    else
        nil
    end
end