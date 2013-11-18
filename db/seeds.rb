MENU_NAMES = ['dinner',
			  'suprise',
			  'luncheon',
			  'late night munchies',
			  'white album snakc',
			  'cool menu']


ITEM_NAMES = ['cheese carrots', 
			  'tartar saufle', 
			  'orange cake', 
			  'dinner at five', 
			  'retro milkshake', 
			  'bannannanannaa', 
			  'milk steak', 
			  'potatos', 
			  'lemons',
			  'lambs',
			  'dirt',
			  'mud',
			  'ramen']


5.times do
	Menu.create! name: MENU_NAMES.sample
end

10.times do
	Item.create! name: ITEM_NAMES.sample,
				 price: rand(101..400).to_s.split('').unshift('$').insert(-3, '.').join
end