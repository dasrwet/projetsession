part of gestion_offre_app;


class GestionEvaluation extends ui.VerticalPanel {
  
  Activite activite;
  Contrainte contrainte;
  
  var btnSave= new ui.Button("Enregistrer");
  /*DEBUT CONSTRUCTION DU PANEL ACTIVITE*/
  var cles = new ui.TextBox();
  var titre = new ui.TextBox();
  var description = new ui.TextArea();
  ui.ListBox comboCritere = new ui.ListBox();
  var valeur = new ui.TextBox();
  var seuil = new ui.TextBox();
  var btnAjout= new ui.Button("Ajouter");
  var btnSup= new ui.Button("Supp");
  var btnMod= new ui.Button("Modif");
  var btnSupp= new ui.Button("Supp");
  ui.Grid grilChoix = new ui.Grid(100,4);
  
  ui.DecoratorPanel panInstActi = new ui.DecoratorPanel();
  ui.AbsolutePanel panCritere = new ui.AbsolutePanel();
  ui.HorizontalPanel panActivite = new ui.HorizontalPanel();
  
  
  GestionEvaluation(OffreEntries offreentries) {
    activite = new Activite(offreentries.activites.concept);
    contrainte = new Contrainte(activite.contraintes.concept);
    construction(offreentries);
    
  }
  
  
  ui.FlexTable formActiv(){ 
  
    ui.FlexTable layout = new ui.FlexTable();
  layout.setCellSpacing(6);
  ui.FlexCellFormatter cellFormatter = layout.getFlexCellFormatter();
  
  cellFormatter.setHorizontalAlignment(0, 0, i18n.HasHorizontalAlignment.ALIGN_CENTER);
  
  cles.text='Act_'+(compteur.nbreactivite+1).toString();
  cles.enabled=false;
  activite.numactivite='Act_'+(compteur.nbreactivite+1).toString();
  layout.setHtml(1, 0, "Numero:");
  layout.setWidget(1, 1, cles);
  layout.setHtml(2, 0, "Activite:");
  layout.setWidget(2, 1, titre);
  layout.setHtml(3, 0, "description:");
  layout.setWidget(3, 1, description);
  return layout;
  /*FIN CONSTRUCTION PANEL ACTIVITE*/
  
  }
  
  
  
  
  ui.AbsolutePanel formCritere(OffreEntries offreentries){
    
    /*DEBUT CONSTRUCTION DU PANEL CONTRAINTE*/
    
    
    for(Critere critere in offreentries.criteres)
    {
      comboCritere.addItem(critere.libelle, critere.numcritere);
    }
    
    ui.AbsolutePanel PanelContr = new ui.AbsolutePanel();
    PanelContr.setSize('100%', '50px');
    
    ui.FlexTable layout1 = new ui.FlexTable();
    layout1.setCellSpacing(6);
    ui.FlexCellFormatter cellFormatter1 = layout1.getFlexCellFormatter();
    
    cellFormatter1.setHorizontalAlignment(0, 0, i18n.HasHorizontalAlignment.ALIGN_CENTER);
    
    layout1.setHtml(1, 0, "Critere:");
    layout1.setWidget(1, 1, comboCritere);
    layout1.setHtml(1, 2, "Valeur Moyenne:");
    layout1.setWidget(1, 3, valeur);
    layout1.setHtml(1, 4, "Valeur Seuil:");
    layout1.setWidget(1, 5, seuil);
    layout1.setWidget(1, 6, btnAjout);
    PanelContr.add(layout1);
    pancss(layout1,'wheat');
    
    
    btnAjout.addClickHandler(new event.ClickHandlerAdapter((event.ClickEvent e) {
      
      if(valeur.text!='' && seuil.text!='')
      {
        contrainte.activite=activite;
        contrainte.critere=offreentries.criteres.firstWhereAttribute("numactivite", comboCritere.getValue(comboCritere.getSelectedIndex()));
        var oid = activite.contraintes.firstWhereAttribute("critere",contrainte.critere);
        if(oid==null)
        {
          contrainte.valeurs=valeur.text.trim();
          contrainte.seuil=seuil.text.trim();
          activite.contraintes.add(contrainte);
          grilChoix.setHtml(activite.contraintes.count, 0, comboCritere.getItemText(comboCritere.getSelectedIndex()));
          grilChoix.setHtml(activite.contraintes.count, 1, valeur.text);
          grilChoix.setHtml(activite.contraintes.count, 2, seuil.text);
          grilChoix.setWidget(activite.contraintes.count, 3, btnSupp);
          //panCritere.clear();
          //panCritere.add(formCritere(offreentries));
          //panCritere.add(listChoix());
          
        }else {window.alert('Merci de Choisir un autre critere');}
      }else{window.alert('Merci de remplir les champs vide');}
      
    }));
    return PanelContr;
    /*FIN CONSTRUCTION PANEL CONTRAINTE*/
  }
  
  
  ui.AbsolutePanel listChoix(){
    
    /*DEBUT CONSTRUCTION DU PANEL CONTRAINTE choisi*/
    ui.AbsolutePanel PanelContr = new ui.AbsolutePanel();
    PanelContr.setSize('100%', 'auto'); 
    
    
    
    grilChoix.setHtml(0, 0,'CRITERE');
    grilChoix.setHtml(0, 1, 'Valeur Moyenne');
    grilChoix.setHtml(0, 2, 'Valeur seuil');
    grilChoix.setHtml(0, 3, 'Supp');
    int i=1;
    for(Contrainte contrainte in activite.contraintes)
    {
      grilChoix.setHtml(i, 0, contrainte.critere.libelle);
      grilChoix.setHtml(i, 1, contrainte.valeurs);
      grilChoix.setHtml(i, 2, contrainte.seuil);
      grilChoix.setWidget(i, 3, btnSupp); 
      i++;
    }
    
    
    pancss(PanelContr,'white','2px');
    grilChoix.setSize('99%','auto');
    
    PanelContr.addIsWidget(grilChoix);
    
    
    return PanelContr ;
    /*FIN CONSTRUCTION DU PANEL CONTRAINTE choisi*/
  }
  
  
  
  
  
  ui.Grid listactivite(OffreEntries offreentries ){
    
    /*DEBUT CONSTRUCTION DU PANEL LISTE DES ACTIVITES*/
    
    ui.Grid grilActivite = new ui.Grid(offreentries.activites.count+2,4);
    
    grilActivite.setHtml(0, 0,'Num');
    grilActivite.setHtml(0, 1, 'Titre');
    grilActivite.setHtml(0, 2, 'Supp');
    grilActivite.setHtml(0, 3, 'Modif');
    int j=1;
    for(Activite activite in offreentries.activites)
    {
      grilActivite.setHtml(j, 0, activite.numactivite);
      grilActivite.setHtml(j, 1, activite.titre);
      grilActivite.setWidget(j, 2, btnSup);
      grilActivite.setWidget(j, 3, btnMod); 
      j++;
    }
    
    pancss(grilActivite,'white','2px');
    grilActivite.setSize('80%','auto');
    return grilActivite;
    /*FIN CONSTRUCTION DU PANEL LISTE DES ACTIVITES*/
    
  }
  
  
  
  
  
  
  
  construction(OffreEntries offreentries){
     
       
        
        panInstActi.setWidget(formActiv());
        
        panCritere.add(formCritere(offreentries));
        panCritere.add(listChoix());
        panCritere.add(btnSave);
        
        
        panActivite.add(panInstActi);
        panActivite.add(panCritere);
        
        pancss(panInstActi,'wheat');
        pancss(panCritere,'gold');
       
        pancss(panActivite,'white');
        
        
        
        add(panActivite);
        add(listactivite(offreentries));
        
        
        
        // action sure les bouton
        
        
        btnSave.addClickHandler(new event.ClickHandlerAdapter((event.ClickEvent e) {
          
        }));
    }
  
  pancss(var PanelParam, String color, [String bord]){
    PanelParam.getElement().style.margin="2px 2px 8px 2px";
    PanelParam.getElement().style.borderRadius="4px 4px 4px 4px";
    PanelParam.getElement().style.backgroundColor=color;
    PanelParam.getElement().style.font="verdana";
    PanelParam.getElement().style.fontSize="11px";
    PanelParam.getElement().style.fontWeight="bold";
    PanelParam.getElement().style.border=bord;
  }
 
}