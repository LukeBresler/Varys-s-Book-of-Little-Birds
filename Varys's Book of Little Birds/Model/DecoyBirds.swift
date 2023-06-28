//
//  DecoyBirds.swift
//  Varys's Book of Little Birds
//
//  Created by Luke Bresler on 2023/06/25.
//

import Foundation

struct Bird {
    let name: String
    let scientificName: String
    let habitat: String
    let description: String
    let image: String
}

let birds: [Bird] = [
    Bird(name: "Puff-faced Waterhen", scientificName: "Avianus ficticius", habitat: "Lumina Grove", description: "This bird has perfected the art of flapping its wings with unrivaled enthusiasm. It's the Michael Jordan of the avian world.", image: "bird1"),
    Bird(name: "Spangled Cotinga", scientificName: "Ornithologica fabulosa", habitat: "Crystal Caverns", description: "This bird is always on the lookout for a quick snack. Its talent lies in spotting crumbs from miles away, earning it the title of the 'Feathered Hoover'", image: "bird2"),
    Bird(name: "Frilled Coquette", scientificName: "Aves imaginaria", habitat: "Whispering Meadows", description: "With its distinctive quacking style, this bird can mimic the sounds of a kazoo, a car alarm, and your neighbor's annoying ringtone", image: "bird3"),
    Bird(name: "Snoring Rail", scientificName: "Passeris fictus", habitat: "Enchanted Mistlands", description: "Watch out for this bird on the dance floor of the forest. With its flamboyant feathers and smooth moves, it's the life of every woodland party.", image: "bird4"),
    Bird(name: "Gaudy Leafbird", scientificName: "Corvidae fantastica", habitat: "Celestial Peaks", description: "This bird takes pride in its plump appearance, proudly declaring itself the 'Chief Pillow of the Bird Kingdom'. Naps are its specialty.", image: "bird5"),
    Bird(name: "Laughing Kookaburra", scientificName: "Columbina fictilis", habitat: "Serenity Isles", description: "Known for its impeccable timing and hilarious antics, this bird's stand-up comedy routine leaves even the grumpiest owls in stitches", image: "bird6"),
    Bird(name: "Wandering Albatross", scientificName: "Falconiformes fictum", habitat: "Skywards", description: "This bird's waddling style could put penguins to shame. It struts around with an air of confidence, showing off its signature swagger.", image: "bird7"),
]
