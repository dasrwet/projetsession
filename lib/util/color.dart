part of gestion_offre_app;

Map<String, String> colorMap(String value) {
  colorList().remove(value);
  return {
    'black':      '#000000',
    'blue':       '#0000ff' ,
    'brown':      '#963939',
    'chocolate':  '#d2691e',
    'coral':      '#ff7f50',
    'gold':       '#ffd700',
    'gray':       '#909090',
    'khaki':      '#f0e68c',   
    'maroon':     '#800000',
    'orange':     '#ff6f00',
    'silver':     '#c0c0c0',
    'wheat':      '#f5deb3',    
    'yellow':     '#ffff00'
  };
}

List<String> colorList() {
  return [
    'black',
    'blue',
    'brown',
    'chocolate',
    'coral',
    'gold',
    'gray',
    'khaki',  
    'maroon',
    'orange',
    'silver',
    'wheat', 
    'yellow'
  ];
}

String randomColor() => randomListElement(colorList());

String randomColorCode() => colorMap(randomColor())[randomColor()];
