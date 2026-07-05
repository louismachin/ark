def get_dummy_iotas
    [
        Iota.new(
            title:       'Ceramic shard, blue glaze',
            description: 'Fragment recovered from the north dig site. Glaze pattern suggests 19th century workshop origin.',
            tags:        ['archive', 'found', 'ceramic'],
            type:        'object',
            created_at:  '2024-01-08',
            metadata:    { 'site' => 'north-01', 'depth_cm' => '42' }
        ),
        Iota.new(
            title:       'Polaroid, unlabeled interior',
            description: 'Found loose in a shoebox. No date or names written on the back.',
            tags:        ['archive', 'photo', 'undated'],
            type:        'picture',
            created_at:  '2024-02-14',
            metadata:    { 'format' => 'polaroid', 'condition' => 'faded' }
        ),
        Iota.new(
            title:       'Letter fragment, torn edge',
            description: 'Handwritten note, second page only. Mentions a trip to the coast.',
            tags:        ['archive', 'found', 'letter'],
            type:        'writing',
            created_at:  '2024-03-02',
            metadata:    { 'pages' => '1', 'language' => 'en' }
        ),
        Iota.new(
            title:       'Brass key, no matching lock',
            description: 'Small brass key found taped to the underside of a drawer.',
            tags:        ['archive', 'found', 'metal'],
            type:        'object',
            created_at:  '2024-03-19',
            metadata:    { 'material' => 'brass', 'length_mm' => '38' }
        ),
        Iota.new(
            title:       'Group photo, back porch',
            description: 'Five people on a porch, one partially cropped out of frame.',
            tags:        ['archive', 'photo', 'outdoor'],
            type:        'picture',
            created_at:  '2024-04-05',
            metadata:    { 'people_count' => '5', 'format' => 'print' }
        ),
        Iota.new(
            title:       'Recipe card, coffee stained',
            description: 'Index card with a recipe for spice cake, stained but legible.',
            tags:        ['archive', 'found', 'photo'],
            type:        'writing',
            created_at:  '2024-04-22',
            metadata:    { 'medium' => 'index card' }
        ),
        Iota.new(
            title:       'Wooden button, hand-carved',
            description: 'Small carved button, possibly bone rather than wood.',
            tags:        ['archive', 'found', 'carved'],
            type:        'object',
            created_at:  '2024-05-11',
            metadata:    { 'material' => 'unknown', 'diameter_mm' => '14' }
        ),
        Iota.new(
            title:       'Snapshot, empty lot',
            description: 'Vacant lot, possibly before construction. No people visible.',
            tags:        ['archive', 'photo', 'empty'],
            type:        'picture',
            created_at:  '2024-06-01',
            metadata:    {}
        ),
        Iota.new(
            title:       'Diary page, single entry',
            description: 'One page torn from a diary, entry describes a rainy afternoon.',
            tags:        ['archive', 'found', 'diary'],
            type:        'writing',
            created_at:  '2024-06-17',
            metadata:    { 'pages' => '1' }
        ),
        Iota.new(
            title:       'Glass marble, chipped',
            description: 'Single glass marble with a chip on one side, swirl pattern intact.',
            tags:        ['archive', 'found', 'glass'],
            type:        'object',
            created_at:  '2024-07-03',
            metadata:    { 'material' => 'glass', 'diameter_mm' => '16' }
        )
    ]
end

def get_dummy_collections
    [
        Collection.new(
            title:       'North Dig Site',
            description: 'Material recovered from the 2024 excavation at the north site, mostly ceramics and small metal objects.',
            tags:        ['excavation', 'ceramics', '2024'],
            created_at:  '2024-01-10',
            metadata:    { 'location' => 'north-01', 'lead' => 'field team A' },
            iota_ids:    get_iotas.sample(3).map(&:id)
        ),
        Collection.new(
            title:       'Found Photographs',
            description: 'Unlabeled and undated photographs collected from estate sales and donations.',
            tags:        ['photos', 'undated', 'estate'],
            created_at:  '2024-02-20',
            metadata:    { 'source' => 'donation' }
        ),
        Collection.new(
            title:       'Correspondence',
            description: 'Letters, notes, and diary fragments with no clear attribution.',
            tags:        ['letters', 'diary', 'handwritten'],
            created_at:  '2024-03-05',
            metadata:    { 'condition' => 'mixed' }
        ),
        Collection.new(
            title:       'Household Objects',
            description: 'Small everyday objects recovered from a single estate, uncategorized by room.',
            tags:        ['household', 'estate', 'misc'],
            created_at:  '2024-04-01',
            metadata:    {}
        ),
        Collection.new(
            title:       'Kitchen Ephemera',
            description: 'Recipe cards, menus, and other paper material related to food and cooking.',
            tags:        ['kitchen', 'recipes', 'paper'],
            created_at:  '2024-04-25',
            metadata:    { 'medium' => 'paper' }
        )
    ]
end