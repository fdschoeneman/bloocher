module WineData

  def boonville_producers
    [
      "Ferrari-Carano",
      "Kendall Jackson",  
      "Duckhorn",
      "Lede Wines"
    ]
  end

  def boonville_vineyards
    [
      "Angel Camp Vineyards", 
      "Balo Vineyards",
      "Champ de Reves Vineyards",
      "Elke Vineyards",
      "Esterlina Vineyards",
      "Expression Vineyards",
      "Greenwood Ridge Vineyards",
      "Husch Vineyards",
      "Maggy Hawk Vineyard",
      "Philo Ridge Vineyards",
      "Lazy Creek Vineyards",
      "Londer Vineyards",
      "Toulouse Vineyards"
    ]
  end
  
  def boonville_wineries
    [
      "Baxter Winery",
      "Bink Wines",
      "Black Kite Cellars",
      "Breggo Cellars",
      "Brutocao Cellars",
      "Claudia Springs Winery",
      "Copain Wines",
      "Couloir Wines",
      "Drew Family Cellars",
      "Edmeades Winery",
      "Foursight Wines, Inc.",
      "Frati Horn Wines",
      "Fulcrum Wines",
      "Goldeneye Winery",
      "Handley Cellars",
      "Harmonique - Conzelman Vineyards",
      "Knez Winery",
      "Littorai Wines",
      "Lula Cellars",
      "MacPhail Family Wines",
      "Phillips Hill Winery",
      "Navarro Vineyards",
      "Roederer Estate",
      "Roessler Cellars",
      "Scharffenberger Cellars",
      "Twomey Cellars",
      "Waits-Mast Family Cellars",
      "Zina Hyde Cunningham"
    ]
  end

  def wine_types 
    [ 
      "pinot noir", 
      "chardonnay", 
      "sauvignon blanc", 
      "zinfandel",
      "muscat", 
      "semillon", 
      "pinot gris", 
      "gewurztraminer" 
    ]
  end

  def vineyard_names
    [
      "Donnelly Creek vineyard", 
      "francis vineyard", 
      "Eaglehearth Vineyard", 
      "Ferrington Vineyard", 
      "Hacienda Secoya Vineyards",
      "Kiser Vineyard", 
      "Knez Vineyard", 
      "Leal Vineyard", 
      "Nelson Hill Vineyard",
      "Valley Foothills Vineyard", 
      "Pennyroyal Vineyards", 
      "Ridley Vineyard",
      "Roma's Vineyard", 
      "Roman Vineyard", 
      "Romani Family Vineyard",
      "Run Dog Vineyard", 
      "Saintsbury", 
      "Savoy Vineyard", 
      "Stewart Vineyard",
      "Weir Vineyard", 
      "Wightman Vineyard", 
      "Zicherman-Roemer Vineyard"
    ]
  end

  def differentiators 
    [
      "methode ancien", 
      "deep end", 
      "reserve",
      "estate"
    ]
  end

  def appellation_list 
    [
      "Arroyo Grande Valley",
      "Arroyo Seco",
      "Ben Lomond Mountain",
      "Carmel Valley",
      "Central Coast",
      "Chalone",
      "Cienega Valley",
      "Edna Valley",
      "Hames Valley",
      "Happy Canyon of Santa Barbara",
      "Lime Kiln Valley",
      "Livermore Valley",
      "Monterey",
      "Mt. Harlan",
      "Pacheco Pass",
      "Paicines",
      "Paso Robles",
      "San Antonio Valley",
      "San Benito",
      "San Bernabe",
      "San Francisco Bay",
      "San Lucas",
      "San Ysidro District",
      "Santa Clara Valley",
      "Santa Cruz Mountains",
      "Santa Lucia Highlands",
      "Santa Maria Valley",
      "Sta. Rita Hills",
      "Santa Ynez Valley",
      "York Mountain"
    ]
  end

  def soil_types
    [
      "sand",
      "volcanic",
      "clay",
      "Mica",
      "quartz",
      "loam",
      "muschelkalk",
      "perlite",
      "schist",
      "shale",
      "silt",
      "terra rossa",
      "tufa",
      "ultisoil",
      "slate",
      "keuper",
      "lignite",
      "loess",
      "dolomite",
      "chalk",
      "basalt",
      "alluvial",
      "boulbenes"
    ]
  end

  def topo_aspects
    [
      "north",
      "north-northwest",
      "south",
      "south-southwest",
      "west",
      "east"
    ]
  end

  def soil_drainage_types
    [
      "excessively drained",
      "somewhat excessively drained",
      "well drained",
      "moderately well drained",
      "somewhat poorly drained",
      "poorly drained"
    ]
  end

  def rootstock
    %w[3309c Gravesac 5c borner SO4 Binova 125AA 5BB 34EM 420A 161-49 333EM Fercal 
      Riparia Gloire 196-17 101-14 R99 R110 1103P Schwarzmann Couderc3309 pinot
    ]
  end

  def varietals
    [
      "barbera",
      "brunello",
      "cabernet franc",
      "cabernet sauvignon",
      "carignan",
      "carmenere",
      "charbono",
      "chardonnay",
      "chenin blanc",
      "dolcetto",
      "fume blanc",
      "gamay",
      "gewurztraminer",
      "grenache",
      "gruner veltliner",
      "malbec",
      "marsanne",
      "merlog",
      "mourvedre",
      "muscat",
      "nebbiolo",
      "petite sirah",
      "pinot blanc",
      "pinot gris",
      "tokay",
      "rulander",
      "pinot grigio",
      "pinot noir",
      "riesling",
      "sangiovese",
      "sauvignon blanc",
      "semillon",
      "syrah",
      "shiraz",
      "tempraniloo",
      "trebbiano",
      "viognier",
      "zinfandel",
    ]
  end

  def clones
    [
      "pommard",
      "dijon 114",
      "dijon 115",
      "31 Roederer Selection",
      "Old Wente",
      "rochioli",
      "Calera",
      "Clone 113",
      "Calera",
      "UCD4",
      "2A",
    ]
  end

  def irrigation_types

    %w[natural none sprinkler drip flood surface furrow]
  end

  def nurseries

    [
      "Advanced Vineyard Systems, Inc. (OR)",
      "American Nursery (VA)",
      "Bailey Nurseries, Inc. (MN)", 
      "Bottom's Nursery (GA) ",
      "Brigadoon Vineyards (OR)", 
      "Broadacres Nursery (OR) ",
      "CADE Vines (OR) ",
      "Cal-Western Nurseries (CA)", 
      "Casa Cristal Nursery, Inc. (CA)", 
      "Casa Verde Grapevines (CA)", 
      "Cloud Mountain Farm (WA)", 
      "Concord Nurseries, Inc.- Foster Grapevines (NY)", 
      "Cornerstone Certified Vineyard (CA)", 
      "Dempel Grapevine Nursery (CA)", 
      "DNE Nursery (CA)", 
      "Double A Vineyards (NY)", 
      "Dr. Konstantin Frank Nursery (NY)", 
      "Duarte Nursery, Inc. (CA)", 
      "Duplin Nursery (NC)", 
      "Edible Landscaping (VA)", 
      "Emerald Leaf U.S., Inc. (WA)", 
      "Eusinus Vineyard (CA)", 
      "Falconer Vineyards (MN)", 
      "Flatwoods Fruit Farm (FLA)", 
      "French Camp Vineyards (CA)", 
      "Grafted Grapevine Nursery, LLC (NY)", 
      "Great River Vineyard & Nursery (MN)", 
      "Grey Creek Viticultural Services Inc. (CA)", 
      "Guillaume Grapevine Nursery, Inc. (CA)", 
      "Hart 2 Hart Vineyards (CA)", 
      "Herrick Grapevines (CA)", 
      "Inland Desert Nursery (WA. State) (WA)", 
      "Jaguar Gardens (CA)", 
      "KLM Ranches (CA)", 
      "Kloer Vineyards (CA)", 
      "L.E. Cooke Company (CA)", 
      "Lake County Grapevine Nursery (CA)", 
      "Lincoln Peak Vineyard LLC (VT)", 
      "Lon Rombough (OR)", 
      "Martinez Orchards, Inc. (CA)", 
      "Mercier California, LLC (CA)", 
      "Meyer Nursery & Orchards, Inc. (OR)", 
      "Miller Nurseries (NY)", 
      "Northeastern Vine Supply (VT)", 
      "Northwoods Nursery, Inc. (OR)", 
      "Novavine, Inc. (CA)", 
      "Pense Nursery, Inc. (AR)", 
      "Post Vineyards & Winery (AR)", 
      "Quality Nursery - WA State Certified Grape Plants (WA)", 
      "Richard's Grove & Saralee's Vyd. Inc. (CA)", 
      "Ripley County Farms, LLC (Missouri)", 
      "RSI Growers (Arizona)", 
      "Satiety Foods (CA)", 
      "St. Francois Vineyards & Nursery (MO)", 
      "Sunridge Nurseries, Inc. (CA)", 
      "Sutter Home Vineyards (CA)", 
      "Tecuya Tree & Vine (CA)", 
      "Turnbull Nursery, Inc. (NY)", 
      "Vintage Nurseries, LLC (CA)", 
      "Walla Walla Community College (WA)", 
      "Westridge Vineyards (CA)",
      "Winterhaven Vineyard & Nursery (MN)", 
      "Witness Tree Vineyard (OR)", 
      "Womack's Nursery (TX)",
      "Zuckerman-Heritage, Inc. (CA)"
    ]
  end

end

