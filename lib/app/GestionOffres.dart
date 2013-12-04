part of gestion_offre_app;

class GestionOffres extends ui.VerticalPanel {
  
  Analyse analyse;
  Admin admin;
  ui.DecoratorPanel conteneur = new ui.DecoratorPanel();
  ui.HorizontalPanel conteneurbtn = new ui.HorizontalPanel();
  var btnRetour= new ui.Button("|<< Retour au Debut");
  var btnQuitter= new ui.Button("Quitter");
  
  GestionOffres(OffreEntries offreentries) {
    conteneur.add(_Debut(offreentries));
    add(conteneur);
    conteneurbtn.add(btnQuitter);
    add(conteneurbtn);
    
    btnRetour.addClickHandler(new event.ClickHandlerAdapter((event.ClickEvent e) {
      conteneur.clear(); conteneur.add(_Debut(offreentries));
      })); 
    btnQuitter.addClickHandler(new event.ClickHandlerAdapter((event.ClickEvent e) {
      
      })); 
  }
  
  ui.VerticalPanel _Administrator(OffreEntries offreentries){
    return new Admin(offreentries);
  }
  
  ui.VerticalPanel _Analyze(OffreEntries offreentries){
    return new Analyse(offreentries);
  }
  
  ui.CaptionPanel _Debut(OffreEntries offreentries){
    
    /*Definition du panel de debut  et des boutons */
    ui.CaptionPanel Panretour = new ui.CaptionPanel("Bienvenue sur la gestion des appels d'offres");
    var btnAdmin= new ui.Button("Gestion des donnees");
    var btnAnalyse= new ui.Button("Analyses");
    
    /*Definition des comportements  */
    conteneurbtn.clear(); conteneurbtn.add(btnQuitter);
    btnAdmin.setSize("200px", "80px");
    btnAnalyse.setSize("200px", "80px");
    
    /*Definition du conteneur des boutons  */
    ui.FlexTable layout = new ui.FlexTable();
    layout.setCellSpacing(6);
    ui.FlexCellFormatter cellFormatter = layout.getFlexCellFormatter();
    cellFormatter.setHorizontalAlignment(0, 0, i18n.HasHorizontalAlignment.ALIGN_CENTER);
    layout.setWidget(1, 0,btnAdmin);
    layout.setWidget(1, 1,btnAnalyse);
    
    btnAdmin.addClickHandler(new event.ClickHandlerAdapter((event.ClickEvent e) {
      conteneur.clear(); conteneur.add(_Administrator(offreentries));
      conteneurbtn.clear(); conteneurbtn.add(btnRetour); conteneurbtn.add(btnQuitter);
      })); 
    btnAnalyse.addClickHandler(new event.ClickHandlerAdapter((event.ClickEvent e) {
      conteneur.clear(); conteneur.add(_Analyze(offreentries));
      conteneurbtn.clear(); conteneurbtn.add(btnRetour); conteneurbtn.add(btnQuitter);
      }));
    
    Panretour.setContentWidget(layout);
    Panretour.getElement().style.border = "2px solid #CC88CF";
    Panretour.getContentWidget().getElement().style.margin = "5px 10px 10px 10px";
    Panretour.getContentWidget().getElement().style.padding = "10px 10px 10px 10px";
    Panretour.getContentWidget().getElement().style.border = "1px solid #ccf";
    
    return Panretour;
  }
}