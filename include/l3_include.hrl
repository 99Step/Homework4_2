-define(JSON,
<<"
 {
 'squadName': 'Super hero squad',
 'homeTown': 'Metro City',
'formed': 2016,
'secretBase': 'Super tower',
'active': true,
'members': [
{
'name': 'Molecule Man',
'age': 29,
'secretIdentity': 'Dan Jukes',
'powers': [
'Radiation resistance',
'Turning tiny',
'Radiation blast'
]
},
{
'name': 'Madame Uppercut',
 'age': 39,
 'secretIdentity': 'Jane Wilson',
 'powers': [
 'Million tonne punch',
 'Damage resistance',
 'Superhuman reflexes'
 ]
 },
 {
 'name': 'Eternal Flame',
 'age': 1000000,
 'secretIdentity': 'Unknown',
 'powers': [
 'Immortality',
 'Heat Immunity',
 'Inferno',
 'Teleportation',
 'Interdimensional travel'
 ]
 }
 ]
 }">>).

-define(MAP,
#{<<"active">> => true,
<<"formed">> => 2016,
<<"homeTown">> => <<"Metro City">>,
<<"members">> =>
[#{<<"age">> => 1000000,
<<"name">> => <<"Eternal Flame">>,
<<"powers">> =>
[<<"Interdimensional travel">>,<<"Teleportation">>,
<<"Inferno">>,<<"Heat Immunity">>,<<"Immortality">>],
<<"secretIdentity">> => <<"Unknown">>},
#{<<"age">> => 39,<<"name">> => <<"Madame Uppercut">>,
<<"powers">> =>
[<<"Superhuman reflexes">>,<<"Damage resistance">>,
<<"Million tonne punch">>],
<<"secretIdentity">> => <<"Jane Wilson">>},
#{<<"age">> => 29,<<"name">> => <<"Molecule Man">>,
<<"powers">> =>
[<<"Radiation blast">>,<<"Turning tiny">>,
<<"Radiation resistance">>],
<<"secretIdentity">> => <<"Dan Jukes">>}],
<<"secretBase">> => <<"Super tower">>,
<<"squadName">> => <<"Super hero squad">>}).

-define(PROPLIST,
  [{<<"squadName">>,<<"Super hero squad">>},
    {<<"homeTown">>,<<"Metro City">>},
    {<<"formed">>,2016},
    {<<"secretBase">>,<<"Super tower">>},
    {<<"active">>,true},
    {<<"members">>,
      [[{<<"name">>,<<"Eternal Flame">>},
        {<<"age">>,1000000},
        {<<"secretIdentity">>,<<"Unknown">>},
        {<<"powers">>,
          [<<"Interdimensional travel">>,<<"Teleportation">>,
            <<"Inferno">>,<<"Heat Immunity">>,<<"Immortality">>]}],
        [{<<"name">>,<<"Madame Uppercut">>},
          {<<"age">>,39},
          {<<"secretIdentity">>,<<"Jane Wilson">>},
          {<<"powers">>,
            [<<"Superhuman reflexes">>,<<"Damage resistance">>,
              <<"Million tonne punch">>]}],
        [{<<"name">>,<<"Molecule Man">>},
          {<<"age">>,29},
          {<<"secretIdentity">>,<<"Dan Jukes">>},
          {<<"powers">>,
            [<<"Radiation blast">>,<<"Turning tiny">>,
              <<"Radiation resistance">>]}]]}]
).
