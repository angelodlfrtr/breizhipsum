module Breizhipsum
  class Work

    def initialize options={}
      set_options options
    end

    def generate
      r = []
      (0..@options[:paragraphs]).each do
        r << generate_paragraph
      end
      r.join("\n")
    end

    def set_options options
      @options = {
        format: :medium,
        paragraphs: 5,
        html: false
      }.merge(options)
    end

    def generate_paragraph
      response = ''
      r = []

      i = 0
      loop do
        word = self.word_list[rand(self.word_list.size)]
        word.capitalize! if i == 0
        r << word
        i += 1
        break if r.join('').length > paragraph_size
      end

      (0..r.length).step(10) do |n|
        if r[n] && r[n + 1]
          r[n].concat('.')
          r[n + 1].capitalize!
        end
      end

      response = r.join(' ').concat('.')

      if @options[:html]
        response.insert(0, '<p>').concat('</p>')
      else
        response
      end
    end

    def word_list
      ["memestra", "oh ma doue", "rouler", "aller à  dreuze", "c'est une pikes", "poquà¨s", "pokesden", "dans le lagen", "me zo skuizh", "à  la jaille", "poquer", "des gwennec", "faire l'essence", "liche", "bilig", "distribil", "en riboule", "chouille", "un ben", "un palto", "a la dreuz", "ou tu es rendu", "une poch", "une binouz", "le bourg", "korrigan", "mange comme une gouelle", "comment que c'est", "kig ha farz", "mam couz", "mam kohz", "mam gouz", "du lambig", "une marmule", "le pochon", "ribines", "louzous", "complà¨tement beurrer", "là¢ché une galette", "on va guincher", "gast", "skuizh", "koc'h", "les routes à  3g", "un toul car", "on est pas venus là  déguisés en feuille de chou pour se faire bouffer le cul par des lapins", "pas tout seul", "il est bien accompagné", "souffler dans le biniou", "tiens, v'là  l'bagad glazick", "cuici il tiendra pas la marée", "t'es colboà«t ou quoi", "il fait frisket", "je suis allé que j'peux plus", "ya corchich", "pikouses", "frilouz", "ta un frilou", "drapeau gwen ha du", "madoué béniguette", "penn karn", "fait a la dreuz", "cui-ci est propre", "laket un all", "an vec'h all", "méméstra", "startijenn", "qu'est c'qu'on graille ce soir", "bouge ton rec'h ou der'ch ca dépend des régions", "cabaner", "chom peo", "choms trankil", "je rentre au loch", "qu'est-ce qu'il baraguouine", "je vais donner un coup d lave pont", "il est debwet", "lichouseries", "un lichou", "mettre a la jaille", "an bec toul", "un manche-à -couille", "il a mis dans son col", "on n est pas rendu", "un fruit blette", "un ti zef", "un yannick", "l'arsouille", "arsouiller", "aller a la baille", "da gousket", "cuici il a viré drà´le", "pas possib' que c'est", "cui-ci fait pokez", "c'est pich", "la valoche", "je suis raouet", "chez les boums", "aller en riboul", "toul bouet", "un rade, un troquet", "ca tarz", "route pà¨che", "un bec braz", "tailler la route", "yerc'hed mat", "ca douille", "il a du gout", "une goulée", "tu prend un jus", "oh la wouelle", "un pekno", "faire du reuz", "droche", "c'est marée basse", "piz cras", "a la revoillure", "glep", "gloche", "tor pen", "barrique à  pattes", "il est coco", "crotik", "un coup d'anti rouille", "baragouiner"]
    end

    def paragraph_size
      {
        :short => 500,
        :medium => 1000,
        :long => 3000
      }[@options[:format]]
    end

  end
end
