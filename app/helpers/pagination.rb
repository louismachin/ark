def paginate(collection, page_no, chunk_size = 20)
    total = collection.size
    total_pages = (total.to_f / chunk_size).ceil
    total_pages = 1 if total_pages < 1

    page_no = page_no.to_i
    page_no = 1 if page_no < 1
    page_no = total_pages if page_no > total_pages

    start_ix = (page_no - 1) * chunk_size
    items = collection[start_ix, chunk_size] || []

    {
        items: items,
        page: page_no,
        total_pages: total_pages,
        total: total,
        range_start: total.zero? ? 0 : start_ix + 1,
        range_end: [start_ix + chunk_size, total].min,
    }
end

# Builds the query string for a given page, preserving other params (tag/type/q)
def pagination_url(page, base_params)
    query = base_params.merge('page' => page)
    query.reject! { |_, v| v.nil? || v == '' }
    "?#{URI.encode_www_form(query)}"
end