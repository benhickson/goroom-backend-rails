class AnonymousUser < ApplicationRecord
	belongs_to :user

	def self.random_name
		animals = ["alligator", "alpaca", "ant", "antelope", "ape", "armadillo", "baboon", "badger", "bat", "bear", "beaver", "bee", "beetle", "buffalo", "butterfly", "camel", "caribou", "cat", "cattle", "cheetah", "chimpanzee", "chinchilla", "cicada", "clam", "cockroach", "cod", "coyote", "crab", "cricket", "crocodile", "crow", "deer", "dinosaur", "dog", "dolphin", "donkey", "duck", "eagle", "eel", "elephant", "elk", "ferret", "fish", "fly", "fox", "frog", "gerbil", "giraffe", "gnat", "gnu", "goat", "goldfish", "goose", "gorilla", "grasshopper", "guinea pig", "hamster", "hare", "hedgehog", "herring", "hippopotamus", "hornet", "horse", "hound", "hyena", "impala", "jackal", "jellyfish", "kangaroo", "koala", "leopard", "lion", "lizard", "llama", "locust", "louse", "macaw", "mallard", "mammoth", "manatee", "marten", "mink", "minnow", "mole", "monkey", "moose", "mosquito", "mouse", "mule", "muskrat", "otter", "ox", "oyster", "panda", "pig", "platypus", "porcupine", "porpoise", "prairie dog", "pug", "rabbit", "raccoon", "rat", "raven", "reindeer", "rhinoceros", "salmon", "sardine", "scorpion", "sea lion", "seal", "serval", "shark", "sheep", "skunk", "snail", "snake", "spider", "squirrel", "swan", "termite", "tiger", "toad", "tortoise", "trout", "turtle", "wallaby", "walrus", "wasp", "water buffalo", "weasel", "whale", "wildebeest", "wolf", "wombat", "woodchuck", "worm", "yak", "yellowjacket", "zebra"]
		animals.sample
	end
end
