def get_dummy_iotas
    [
        Iota.new(
            title:       'Ceramic shard, blue glaze',
            description: 'Fragment recovered from the north dig site. Glaze pattern suggests 19th century workshop origin.',
            tags:        ['ceramic', 'fragment', 'blue'],
            type:        'object',
            created_at:  '2024-01-08',
            metadata:    { 'site' => 'north-01', 'depth_cm' => '42' }
        ),
        Iota.new(
            title:       'Polaroid, unlabeled interior',
            description: 'Found loose in a shoebox. No date or names written on the back.',
            tags:        ['photo', 'interior', 'undated'],
            type:        'picture',
            created_at:  '2024-02-14',
            metadata:    { 'format' => 'polaroid', 'condition' => 'faded' }
        ),
        Iota.new(
            title:       'Letter fragment, torn edge',
            description: 'Handwritten note, second page only. Mentions a trip to the coast.',
            tags:        ['letter', 'handwritten', 'incomplete'],
            type:        'writing',
            created_at:  '2024-03-02',
            metadata:    { 'pages' => '1', 'language' => 'en' }
        ),
        Iota.new(
            title:       'Brass key, no matching lock',
            description: 'Small brass key found taped to the underside of a drawer.',
            tags:        ['metal', 'key', 'found'],
            type:        'object',
            created_at:  '2024-03-19',
            metadata:    { 'material' => 'brass', 'length_mm' => '38' }
        ),
        Iota.new(
            title:       'Group photo, back porch',
            description: 'Five people on a porch, one partially cropped out of frame.',
            tags:        ['photo', 'group', 'outdoor'],
            type:        'picture',
            created_at:  '2024-04-05',
            metadata:    { 'people_count' => '5', 'format' => 'print' }
        ),
        Iota.new(
            title:       'Recipe card, coffee stained',
            description: 'Index card with a recipe for spice cake, stained but legible.',
            tags:        ['recipe', 'card', 'kitchen'],
            type:        'writing',
            created_at:  '2024-04-22',
            metadata:    { 'medium' => 'index card' }
        ),
        Iota.new(
            title:       'Wooden button, hand-carved',
            description: 'Small carved button, possibly bone rather than wood.',
            tags:        ['button', 'carved', 'small'],
            type:        'object',
            created_at:  '2024-05-11',
            metadata:    { 'material' => 'unknown', 'diameter_mm' => '14' }
        ),
        Iota.new(
            title:       'Snapshot, empty lot',
            description: 'Vacant lot, possibly before construction. No people visible.',
            tags:        ['photo', 'lot', 'empty'],
            type:        'picture',
            created_at:  '2024-06-01',
            metadata:    {}
        ),
        Iota.new(
            title:       'Diary page, single entry',
            description: 'One page torn from a diary, entry describes a rainy afternoon.',
            tags:        ['diary', 'entry', 'weather'],
            type:        'writing',
            created_at:  '2024-06-17',
            metadata:    { 'pages' => '1' }
        ),
        Iota.new(
            title:       'Glass marble, chipped',
            description: 'Single glass marble with a chip on one side, swirl pattern intact.',
            tags:        ['glass', 'marble', 'toy'],
            type:        'object',
            created_at:  '2024-07-03',
            metadata:    { 'material' => 'glass', 'diameter_mm' => '16' }
        )
    ]
end