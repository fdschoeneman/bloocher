module Faker

  class Stoked
  
    class << self
  
      def olympic_event
        ["Shredding sick pow"].sample
      end

      def camera_mount
        ["head strap", "chesty", "junior chesty", "jaws", "suction cup", "roll bar"].sample
      end

      def olympian_country
        %w[Canada US Russia Japan China Australia Norway Austria Finland Sweden Germany Poland Belarus].sample
      end

      def olympian_music
        [
          "Miley Cyrus", "Robin Thicke", "MGMT", "Katy Perry", "Drake", 
          "One Direction", "Gordon Lightfoot"
        ].sample
      end

      def olympian_home_region

        ["Whistler", "Lake Tahoe", "Sarajevo", "Nepal", "Lake Placid","Alps","Bavaria","Grand Tetons"]
      end

      def bio
        first = adj.capitalize + " " + intmodifier + " " + adj + " " + "snowboarder" + ". "
        second = adverb.capitalize + " " + olympian_hobby + ", " + adj + " " + olympian_hobby + ", " + strength + "."
        first + second
      end

      def adj 
        %w[ awesome radical rad bodacious free-spirited cerebral all-natural american-made
         stoked stokealicious stokified stokastic fearless 
        ].sample
      end

      def intmodifier
        [ 
          "but","and","almost","but equally","nearly","at the same time", 
          "yet paradoxically","nevertheless","yet oxymoronically","but inevitably"
        ].sample
      end

      def olympic_sport
        [  
          "figure skater","speed skater","short track speed skater","ice hockey player",
          "curler",
          "cross-country skier","nordic skier","alpine racer",
          "ski jumper","freestyle skier","snowboarder","biathlete","Luger","bobsleigher",
          "skeleton rider"
        ].sample
      end

      def adverb
        [ 
          "loves","amazed by","stoked for","Spends free time"
        ].sample
      end

      def olympian_hobby
        [
          "hamburgers", "world peace","techno dancing","my mom","teachers","painting",
          "Miley Cyrus","GoPro","country music","defying death",
          "defying that which should be defied","work with orphans","raising money for cancer"
        ].sample
      end

      def strength 
        [
          "hard charging","forward","strong","outrageous work ethic","endurance"
        ].sample
      end
    end
  end
end