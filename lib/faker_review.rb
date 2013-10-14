module Faker
  
  class Boontling

    class << self 

      def review
        first = intro + " " + intmodifier + " " + adjective + " " + varietal + ". "
        second = adverb + " " + flavor + ", " + adjective + " " + flavor + ", " + strength + " " + flavor 
        third = ". Drink now through " + end_date + "."
        first + second + third 
      end

      def intro 
        [
          "Remarkable","Francophonic","Juicy","Desperate","Serviceable","Generous","Glassy",
          "Blunt","Sturdy","Elegant","Lean","Spare","Simple","Self-righteous",
          "Chewy","Powerful","Soft","Ripe in flavor","Ready to drink","Well focused",
          "Medium-weight","Heavy-weight",    "Light-weight","Austere",
          "Light, simple","Modest","Markedly improved",
          "Nearly matured","Almost matured","Somewhat matured","Overaged",
          "Finely balanced","A firm, full textured",
          "Fully refined","Unnatural","Historic","Classic","Crisp",
          "Neo-classic","Modern","Overdone",
          "Meaty","Unrefined","Direct","Deep and smokey",
          "Dark and mysterious","Good","Evil","Impressive","Unimpressive",
          "Big and strong","Wicked","Raw","Wimpy","Overdressed","Sweet","Rude",
          "Creepy","Open-ended","Rounded","Corpulent","Overbearing","Twisted","Clean",
          "Fun","Intense","Egocentric","Intelligently done","Unstinting","Flourished"
        ].sample
      end

      def intmodifier
        [
          "but","and","almost","but equally","nearly","at the same time", 
          "yet paradoxically","nevertheless","yet oxymoronically","but inevitably"
        ].sample
      end

      def varietal 
        [
          "white","Barbera","Cabernet Franc","Cabernet","Gamay","Merlot","Syrah",
          "Pinot Noir","Zinfandel","Chardonnay","Chenin Blanc",
          "Gewurztraminer","Marsanne","Pinot Gris","Viognier","Sauvingnon Blanc",
          "Semillon","Port","Dessert wine","Edelzwicker","Eiswein","Sticky","Sauterne"
        ].sample
      end   

      def adjective
        [  
          "sassy","desperate","romantic","sad","hopeless","intense","focused",
          "meandering","melancholy","putrid","yellowed","degraded","acidic monster",
          "graceful","open-ended","freakishly evil","plump","spiney", "brackish","ripe",
          "closed","supple","broad-shouldered","big and plump","attractive",
          "complex and stunning","sturdy","elegant","structured","hedonistic",
          "aggressive","limp","lacking in character","morally superior","over-ripe",
          "middle-aged","unripe","overdone","sweet","smoked","lackluster","hoppy",
          "acidic","turgid","understated","fleshy","extra-ripe","zelous",
          "underdone","oaky","over-oaked","american-oaked","french-oaked","musty",
          "soggy","fat","wicked","whimsical","oily","astounding","corpulent",
          "cotton","boggling","unripe","overcooked","sugary","over-the-top"
        ].sample
      end

      def adverb
        [ 
          "Contains","Shows","Detectable","Hints of","Forces","A mouthfull of",
          "Strong","Spews","Resembles","Aromas of","Whispers of","Drops",
          "Essenses of","Kicks you with","Throws out","Hits you with","Displays",
          "Opens with","Reminecent of","Attacks with","Begins with","Starts with",
          "Forcefully bites you with","Reminds one of","Evokes"
        ].sample
      end

      def flavor
        [
          "roast pork","apple","pear","peach-pit","anise","leather","used beer",
          "blackberry","black-cherry","lemon","citrus","citron","toasty oak",
          "cardboard","salted beef","beef","rosemary lamb","cafeteria fish sticks",
          "gatorade but not in a bad way","prison oatmeal","guvmint cheese",
          "ginger","tobacco","cigar box","fruit punch","acid","blueberry","mint",
          "spice","currant","cedar","loganberry","coffee","herbs","dirt","cassis",
          "earth","lime","raspberry","plum","toast","rye","tea notes","green tea",
          "sun-dried tomato","caramel","dried berry","vanilla","bing-cherry","herbs",
          "juniper","sage","wild berry","orange peel","lemon rind","banana","mocha",
          "smoked bacon","clay","thyme","pepper","salt","buttered scones","onion",
          "shallot","fois gras","kalamata olive","celery","fig","bacon-wrapped fig",
          "pineapple","salad","taint","boot-leather","victory","napalm","bug spray",
          "tomato","papaya","mango","chutney","mint julip","bourbon","marmalade",
          "strawberry jam","barley","carrot","roasted vegetables","roasted meat",
          "prune","prune juice","stewed prune","raisin","seedless watermelon",
          "tangerine","peach","nectarine","honey","garlic","melon","cocoa",
          "maple syrup","spruce","sweat","dog-breath","cat breath","carburetor cleaner",
          "WD-40", "10w-30 Motor oil","lollipop","new car smell","talcum" 
        ].sample
      end

      def strength 
        [
          "lingering","forward","strong","weak","bashful","corpulent","insipid","banal",
          "light","aggressive","hopeful","semi-weak","traces of","forceful",
          "total absence of","perceptable","dainty","strong-willed","atomic traces of",
          "scant","a modicum of"
        ].sample
      end

      def end_date
        [
          "2014","2015","2016","2017","2018","2019","2020","2021","2022",
          "eternity","never","April","May","June","graduation",
          "Christmas","Tuesday","Friday"
        ].sample
      end
    end
  end
end