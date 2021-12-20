class KitchenModel {
  String? title;
  List<String>? subtitlelist;
  String? img;
  String? tag;
  KitchenModel({
    this.title,
    this.subtitlelist,
    this.img,
    this.tag,
  });
}

class Utils {
  static List<KitchenModel> getlist() {
    return [
      KitchenModel(
        img: 'images/canned.PNG',
        title: 'Canned Goods',
        tag:
            'Chicken broth and beef broth are good to have if you make gravies or sauces in which liquid is cooked down, or "reduced." The salty flavor of broth gives these dishes extra punch.',
        subtitlelist: [
          'Chicken stock or broth\n'
              'Beef stock or broth\n'
              'Canned tomatoes\n'
              'Tomato sauce\n'
              'Tomato paste\n'
              'Can/jar of marinara sauce\n'
              'Canned beans: white, black, kidney\n'
              'Tuna\n'
        ],
      ),
      KitchenModel(
        img: 'images/beans.png',
        title: 'Starches and Dry Goods',
        tag:
            'Does your family eat a lot of pasta? Do you prepare stir-fries and other Asian dishes? Stock up on what you like to eat.',
        subtitlelist: [
          'Pasta (in various shapes, strands, and tubes)\n',
          'Rice (white and/or brown in long-grain or short-grain varieties)\n',
          'Lentils\n'
              'Split peas\n'
              'Dried bread crumbs\n'
        ],
      ),
      KitchenModel(
        img: 'images/rootcaller.png',
        title: 'The Root Cellar',
        tag:
            'Store these in a cool, dark, well-ventilated area--never in plastic bags or in the refrigerator.',
        subtitlelist: [
          'Potatoes\n'
              'Onions\n'
              'Garlic\n'
        ],
      ),
      KitchenModel(
        img: 'images/condiments.png',
        title: 'Condiments',
        tag: 'Vinegars (balsamic, cider, white, sherry, and wine vinegars)',
        subtitlelist: [
          '	Soy sauce\n'
              '	Worcestershire sauce\n'
              '	Hot sauce\n'
        ],
      ),
      KitchenModel(
        img: 'images/chicken.png',
        tag:
            'When working with a limited set of measuring spoons or scaling your favorite recipes up or down\n memorizing this kitchen fact will save time\n',
        title: 'How Many Teaspoons in a Tablespoon?',
        subtitlelist: [
          '1 tablespoon is equal to 3 teaspoons For everything else, use this list of conversions for cooking measurements:',
          '	How many teaspoons in a tablespoon? 1 U.S. tablespoon = 3 U.S. teaspoons\n'
              '	How many teaspoons in a ½ tablespoon? ½ U.S. tablespoon = 1½ U.S. teaspoons\n'
              '	How many ¼ teaspoons in a tablespoon? 1 U.S. tablespoon = 12 U.S. ¼ teaspoons\n'
              '	How many teaspoons in 3 tablespoons? 3 U.S. tablespoons = 9 U.S. teaspoons\n'
              '	How many tablespoons in a ¼ cup? ¼ U.S. cup = 4 tablespoons'
        ],
      ),
      KitchenModel(
        img: 'images/spicerack.png',
        title: 'The Spice Rack',
        subtitlelist: [
          '	Dried basil\n'
              '	Bay leaves\n'
              '	Cayenne or\n'
              '	Crushed red pepper flakes\n'
              '	Curry powder\n'
              '	Seasoned salt\n'
              '	Chili powder\n'
              '	Cumin\n'
              '	Cinnamon\n'
              '	Garlic powder\n'
              '	Onion powder\n'
              '	Oregano\n'
              '	Paprika\n'
              '	Dried parsley\n'
        ],
      ),
      KitchenModel(
        img: 'images/extras.png',
        title: 'The Almost-Bare Fridge',
        subtitlelist: [
          '	Eggs\n'
              '		Milk\n'
              '	Cayenne or\n'
              '		Butter or margarine\n'
              '		Ketchup\n'
              '	Mustard (yellow, Dijon, whole grain)\n'
              '		Mayonnaise\n'
              '		Parmesan cheese\n'
              '	Other cheese\n'
        ],
      ),
      KitchenModel(
        img: 'images/eggs.png',
        title: 'The Freezer',
        subtitlelist: [
          '		Frozen corn\n'
              '			Frozen spinach\n'
              '	Frozen peas\n'
              '			Ground beef\n'
              '			Chicken breasts\n'
        ],
      ),
      KitchenModel(
        img: 'images/freezer.png',
        title: 'The Freezer',
        subtitlelist: [
          '		Frozen corn\n'
              '			Frozen spinach\n'
              '	Frozen peas\n'
              '			Ground beef\n'
              '			Chicken breasts\n'
        ],
      ),
      KitchenModel(
        tag:
            'Flavors and ingredients that keep well and are nice to have on hand.',
        img: 'images/extras.png',
        title: 'Extras',
        subtitlelist: [
          '	Herbs and spices: allspice, cloves, ginger, nutmeg, coriander, dill, marjoram, dry mustard, italian seasoning, rosemary, sage, tarragon, thyme\n'
              '	Lemons\n'
              '	Fresh ginger\n'
              '			Shallots\n'
              '			Capers\n'
              '		Canned chiles\n'
              '		Prepared horseradish\n'
              '		Anchovy paste\n'
              '		Almond extract\n'
              'Vanilla extract\n'
              '	Kosher salt\n'
              '	Cooking spray\n'
              '	Cornstarch\n'
              "	Confectioner's sugar\n"
              '	Honey\n'
              '	Brown sugar\n'
        ],
      ),
      KitchenModel(
        img: 'images/eggs.png',
        title: 'How Many Calories in An Egg?',
        subtitlelist: [
          'An average-size egg contains 74 calories, or 310 kJ\n'
              'This is the egg size found in the 700 gram cartons that most people buy\n'
              '	Frozen peas\n'
              'A smaller egg from a 600 gram carton contains 64 calories, or 268 kJ\n'
              'A larger than average egg from an 800 gram carton contains 84 calories, or 352 kJ\n'
        ],
      ),
      KitchenModel(
        img: 'images/rice.png',
        title: 'How Many Calories in Rice?',
        subtitlelist: [
          '1 Bowl of cooked rice has about 136 calories \n'
              'plateful of cooked rice has 272 calories which is about 80 grams a plate\n'
        ],
      ),
      KitchenModel(
        img: 'images/halwa.png',
        title: 'How Many Calories in Halwa?',
        subtitlelist: [
          '1 small bowl of sooji ka halwa is approximately 379 calories \n'
              'This is because the halwa includes lots of pure desi ghee and sugar\n'
        ],
      ),
      KitchenModel(
        img: 'images/samoosa.png',
        title: 'How Many Calories in Samosa?',
        subtitlelist: [
          '1 medium sized aloo ka samosa has about 123 calories. \n'
              'This has added potatoes and is deep fried in refined oil\n'
        ],
      ),
      KitchenModel(
        img: 'images/tea.png',
        title: 'How Many Calories in Tea?',
        subtitlelist: [
          '1 cup of tea with 30 millilitres (ml) of milk and two teaspoons of sugar is about 37 calories\n'
              'The calorie intake of tea increases with the increase in the amount of sugar and milk\n'
        ],
      ),
      KitchenModel(
        img: 'images/caliriescofe.png',
        title: 'How Many Calories in Coffee?',
        subtitlelist: [
          '1 cup of coffee will be 150 calories for the same amount of milk and sugar as tea\n'
        ],
      ),
      KitchenModel(
        img: 'images/biscuits.png',
        title: 'How Many Calories in Biscuits?',
        subtitlelist: [
          '1 creamy biscuit is about 160 calories and 1 non-creamy biscuit is about 100 calories\n. For three creamy biscuits, it will be a whopping 480 calories that you consume and for three non-creamy \nbiscuits you would be adding about 300 calories to your day\n'
        ],
      ),
      KitchenModel(
        img: 'images/banana.png',
        title: 'How Many Calories in Banana?',
        tag: 'According to the US Department of Agriculture',
        subtitlelist: [
          '	A small banana, that is around 101 grams, contains 90 calories\n'
              '	A medium-sized banana (about 118 grams) contains 105 calories\n'
              '	And a large (about 136 grams) contains 121 calories\n'
              "Calories alone don't say much about the quality of the food. So let's look at the banana nutrition facts, and where all of those calories are coming from\n"
        ],
      ),
      KitchenModel(
        img: 'images/mangos.png',
        title: 'How Many Calories in Mango?',
        subtitlelist: [
          " A mango serving size is equivalent to 3/4 cup of sliced mangos and is just 70 calories, so it's a satisfyingly sweet treat\n. There are 202 calories in 1 whole mango (without refuse and 336g)\n. Each serving of mango is fat free, sodium free and cholesterol free\n"
        ],
      ),
      KitchenModel(
        img: 'images/apples.png',
        title: 'How Many Calories in Apple?',
        subtitlelist: [
          " One serving, or one medium apple, provides about 95 calories, 0 gram fat, 1 gram protein, 25 grams carbohydrate\n 19 grams sugar (naturally occurring), and 3 grams fiber\n"
        ],
      ),
      KitchenModel(
        img: 'images/guava.png',
        title: 'How Many Calories in Guava?',
        subtitlelist: [
          "Here are the total calories in guava, depending upon their weight and serving size. Calories in guava \n 100 grams According to United States Department of Agriculture, 100 grams of guava has 68 calories\n"
        ],
      ),
      KitchenModel(
        img: 'images/chicken.png',
        title: 'How Many Calories in Chicken?',
        subtitlelist: [
          "One skinless, boneless, cooked chicken breast (172 grams) has the following nutrition breakdown (1):\n Calories: 284. Protein: 53.4 grams. Carbs: 0 grams\n"
        ],
      ),
      KitchenModel(
        title: 'Oils, Vinegars and Condiments',
        subtitlelist: [
          '	Oils: canola oil, extra-virgin olive oil, toasted sesame\n'
              '	Vinegars: balsamic, distilled white, red wine, rice\n'
              '	Ketchup\n'
              '	Mayonnaise\n'
              '	Dijon mustard\n'
              '	Soy sauce\n'
              '	Chili paste\n'
              '	Hot sauce\n'
              '	Worcestershire\n'
        ],
      ),
      KitchenModel(
        title: 'Seasonings',
        subtitlelist: [
          '	Kosher salt\n'
              '	Black peppercorns'
              '	Dried herbs and spices: bay leaves, cayenne pepper, crushed red pepper, cumin, ground coriander, oregano, paprika, rosemary, thyme leaves, cinnamon, cloves, allspice, ginger, nutmeg\n'
              '	Spice blends: chili powder, curry powder, Italian seasoning\n'
              '	Vanilla extract\n'
        ],
      ),
      KitchenModel(
        title: 'Canned Goods and Bottled Items',
        subtitlelist: [
          '	Canned beans: black, cannellini, chickpeas, kidney\n'
              '	Capers\n'
              '	Olives\n'
              '	Preserves or jelly\n'
              '	Low-sodium stock or broth\n'
              '	Canned tomatoes\n'
              '	Tomatoes, canned and paste\n'
              '	Salsa\n'
              '	Tuna fish\n'
        ],
      ),
      KitchenModel(
        title: 'Grains and Legumes',
        subtitlelist: [
          '	Breadcrumbs: regular, panko\n'
              '	Couscous\n'
              ' 	Dried lentils\n'
              '	Pasta: regular, whole wheat\n'
              '	Rice\n'
              '	Rolled oats\n'
              '	One other dried grain: try barley, millet, quinoa or wheatberries\n'
        ],
      ),
      KitchenModel(
        title: 'Baking Products',
        subtitlelist: [
          '	Baking powder\n'
              '	Baking soda\n'
              '	Brown sugar\n'
              '	Cornstarch\n'
              '	All-purpose flour\n'
              '	Granulated sugar\n'
              '	Honey\n'
        ],
      ),
      KitchenModel(
        title: 'Refrigerator Basics',
        subtitlelist: [
          '	Butter\n'
              '	Cheese: sharp cheddar, feta, Parmesan, mozzarella\n'
              '	Large eggs\n'
              '	Milk\n'
              '	Plain yogurt\n'
              '	Corn tortillas\n'
        ],
      ),
      KitchenModel(
        title: 'Freezer Basics',
        subtitlelist: [
          '	Frozen fruit: blackberries, blueberries, peaches, strawberries\n'
              '	Frozen vegetables: broccoli, bell pepper and onion mix, corn, edamame, peas, spinach\n'
        ],
      ),
      KitchenModel(
        title: 'Storage Produce',
        subtitlelist: [
          '	Garlics\n'
              '	Onions (red, yellow)\n'
              '	Potatoes\n'
              '	Dried fruit: raisins, apples, apricots\n'
              '	Nuts or seeds: almonds, peanuts, sunflower\n'
        ],
      ),
      KitchenModel(
        title: 'What are the basics ingredients for cooking',
        tag: 'These are the essential six staples to always have on hand.',
        subtitlelist: [
          'Salt\n'
              '	Pepper\n'
              '		Olive oil\n'
              '	Vegetable oil\n'
              '		All-purpose flour\n'
              '	Granulated sugar\n'
        ],
      ),
      KitchenModel(
        title: 'Canned Goods',
        tag:
            'Chicken broth and beef broth are good to have if you make gravies or sauces in which liquid is cooked down, or "reduced." The salty flavor of broth gives these dishes extra punch.',
        subtitlelist: [
          'Chicken stock or broth\n'
              'Beef stock or broth\n'
              'Canned tomatoes\n'
              'Tomato sauce\n'
              'Tomato paste\n'
              'Can/jar of marinara sauce\n'
              'Canned beans: white, black, kidney\n'
              'Tuna\n'
        ],
      ),
    ];
  }
}
