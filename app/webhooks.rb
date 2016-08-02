require 'json'

FILTER=[13,14,16,17,19,21,41,42]
#FILTER=[19]
REF= {
"001" => "Bulbasaur",
"002" => "Ivysaur",
"003" => "Venusaur",
"004" => "Charmander",
"005" => "Charmeleon",
"006" => "Charizard",
"007" => "Squirtle",
"008" => "Wartortle",
"009" => "Blastoise",
"010" => "Caterpie",
"011" => "Metapod",
"012" => "Butterfree",
"013" => "Weedle",
"014" => "Kakuna",
"015" => "Beedrill",
"016" => "Pidgey",
"017" => "Pidgeotto",
"018" => "Pidgeot",
"019" => "Rattata",
"020" => "Raticate",
"021" => "Spearow",
"022" => "Fearow",
"023" => "Ekans",
"024" => "Arbok",
"025" => "Pikachu",
"026" => "Raichu",
"027" => "Sandshrew",
"028" => "Sandslash",
"029" => "Nidoran F",
"030" => "Nidorina",
"031" => "Nidoqueen",
"032" => "Nidoran M",
"033" => "Nidorino",
"034" => "Nidoking",
"035" => "Clefairy",
"036" => "Clefable",
"037" => "Vulpix",
"038" => "Ninetales",
"039" => "Jigglypuff",
"040" => "Wigglytuff",
"041" => "Zubat",
"042" => "Golbat",
"043" => "Oddish",
"044" => "Gloom",
"045" => "Vileplume",
"046" => "Paras",
"047" => "Parasect",
"048" => "Venonat",
"049" => "Venomoth",
"050" => "Diglett",
"051" => "Dugtrio",
"052" => "Meowth",
"053" => "Persian",
"054" => "Psyduck",
"055" => "Golduck",
"056" => "Mankey",
"057" => "Primeape",
"058" => "Growlithe",
"059" => "Arcanine",
"060" => "Poliwag",
"061" => "Poliwhirl",
"062" => "Poliwrath",
"063" => "Abra",
"064" => "Kadabra",
"065" => "Alakazam",
"066" => "Machop",
"067" => "Machoke",
"068" => "Machamp",
"069" => "Bellsprout",
"070" => "Weepinbell",
"071" => "Victreebel",
"072" => "Tentacool",
"073" => "Tentacruel",
"074" => "Geodude",
"075" => "Graveler",
"076" => "Golem",
"077" => "Ponyta",
"078" => "Rapidash",
"079" => "Slowpoke",
"080" => "Slowbro",
"081" => "Magnemite",
"082" => "Magneton",
"083" => "Farfetch&#39;d",
"084" => "Doduo",
"085" => "Dodrio",
"086" => "Seel",
"087" => "Dewgong",
"088" => "Grimer",
"089" => "Muk",
"090" => "Shellder",
"091" => "Cloyster",
"092" => "Gastly",
"093" => "Haunter",
"094" => "Gengar",
"095" => "Onix",
"096" => "Drowzee",
"097" => "Hypno",
"098" => "Krabby",
"099" => "Kingler",
"100" => "Voltorb",
"101" => "Electrode",
"102" => "Exeggcute",
"103" => "Exeggutor",
"104" => "Cubone",
"105" => "Marowak",
"106" => "Hitmonlee",
"107" => "Hitmonchan",
"108" => "Lickitung",
"109" => "Koffing",
"110" => "Weezing",
"111" => "Rhyhorn",
"112" => "Rhydon",
"113" => "Chansey",
"114" => "Tangela",
"115" => "Kangaskhan",
"116" => "Horsea",
"117" => "Seadra",
"118" => "Goldeen",
"119" => "Seaking",
"120" => "Staryu",
"121" => "Starmie",
"122" => "Mr. Mime",
"123" => "Scyther",
"124" => "Jynx",
"125" => "Electabuzz",
"126" => "Magmar",
"127" => "Pinsir",
"128" => "Tauros",
"129" => "Magikarp",
"130" => "Gyarados",
"131" => "Lapras",
"132" => "Ditto",
"133" => "Eevee",
"134" => "Vaporeon",
"135" => "Jolteon",
"136" => "Flareon",
"137" => "Porygon",
"138" => "Omanyte",
"139" => "Omastar",
"140" => "Kabuto",
"141" => "Kabutops",
"142" => "Aerodactyl",
"143" => "Snorlax",
"144" => "Articuno",
"145" => "Zapdos",
"146" => "Moltres",
"147" => "Dratini",
"148" => "Dragonair",
"149" => "Dragonite",
"150" => "Mewtwo",
"151" => "Mew",
}

post '/webhook' do 
  data=JSON.parse(request.body.read)['message']
  file=''

  pokemon_id=data['pokemon_id']

  if FILTER.include?(pokemon_id)
    puts "skip #{pokemon_id}"
    return
  end 

  puts data
  ### BTWIN
  # bas droit : 50.613533, 3.086002
  # haut gauche : 50.619303, 3.081365
  # exemple: 50.617922, 3.084890
  # 50.61629933991338,3.0880587305793714 
  if data['longitude'] > 3.081365 && 
     data['latitude'] < 50.619303 && 
     data['longitude'] < 3.0899002 && 
     data['latitude'] > 50.613533 
 
    file='btwin'
  end
   
  ### CITADELLE
  if data['longitude'] > 3.030001 && 
     data['longitude'] < 3.056590 &&
     data['latitude'] < 50.650939 &&
     data['latitude'] > 50.634583
    
    file='citadelle'
  end
  
  ### Euratec
  # haut gauche: 50.633750, 3.017774
  # bas droit : 50.631076, 3.026690 
  # exemple : 50.632692, 3.022050

  if data['longitude'] > 3.017774 &&
     data['latitude'] < 50.633750 &&
     data['longitude'] < 3.026690 &&
     data['latitude'] > 50.631076

    file='euratec'
  end


  ### LAM
  # haut gauche: 50.637883, 3.139996
  # bas droit : 50.629104, 3.186294
  # exemple : 50.634930, 3.151193

  if data['longitude'] > 3.139996 &&
     data['latitude'] < 50.629104 &&
     data['longitude'] < 3.186294 &&
     data['latitude'] > 50.637883

    file='heron'
  end



  ref="#{pokemon_id}".rjust(3, '0')
  pokemon=REF[ref]

  ### Send message to IRC
  if file.to_s == ''
    puts "Pop #{pokemon} (#{ref}) at unknow: https://www.google.fr/maps/place/#{data['latitude']},#{data['longitude']} , http://pokemondb.net/pokedex/#{pokemon}"
  else
    puts "Pop #{pokemon} (#{ref}) at #{file}: https://www.google.fr/maps/place/#{data['latitude']},#{data['longitude']} , http://pokemondb.net/pokedex/#{pokemon}"
    open("/tmp/#{file}", 'a') { |f|
      f.puts "Pop #{pokemon} (#{ref}) at #{file}: https://www.google.fr/maps/place/#{data['latitude']},#{data['longitude']} , http://pokemondb.net/pokedex/#{pokemon}"
    }
  end

  
end

