part of gestion_offre_app;

class GestionActivite extends ui.VerticalPanel {
  
  
  Activite activite;
  //Contrainte contrainte;
  
  var btnSave= new ui.Button("Enregistrer");
  /*DEBUT CONSTRUCTION DU PANEL ACTIVITE*/
  var cles = new ui.TextBox();
  var titre = new ui.TextBox();
  var description = new ui.TextArea();
  ui.ListBox comboCritere = new ui.ListBox();
  var valeur = new ui.DoubleBox();
  var seuil = new ui.DoubleBox();
  var btnAjout= new ui.Button("Ajouter");
  var btnAnul= new ui.Button("Annuler");
 
  ui.Grid grilChoix ;
  ui.Grid grilActivite;
  
  ui.AbsolutePanel panInstActi = new ui.AbsolutePanel();
  ui.AbsolutePanel panCritere = new ui.AbsolutePanel();
  ui.HorizontalPanel panActivite = new ui.HorizontalPanel();
  ui.CaptionPanel PanelAct = new ui.CaptionPanel("Liste des Activites");
  ui.FlexTable layout = new ui.FlexTable();
  
  ui.CaptionPanel PanelContr = new ui.CaptionPanel("Liste des criteres choisi");
  
  
  GestionActivite(OffreEntries offreentries) {
    //setSize("100%", "auto");
    activite = new Activite(offreentries.activites.concept);
    
    
    grilChoix = new ui.Grid(1,4);
    //grilChoix.setCellFormatter();
    grilChoix.setStylePrimaryName('gridCritere');
    grilChoix.setHtml(0, 0,'<h3>CRITERE</h3>');
    grilChoix.setHtml(0, 1, '<h3>Valeur Moyenne</h3>');
    grilChoix.setHtml(0, 2, '<h3>Valeur seuil</h3>');
    grilChoix.setHtml(0, 3, '<h3>Supp</h3>');
    
    PanelContr.addIsWidget(grilChoix);
    
    grilActivite = new ui.Grid(1,4);
    grilActivite.setStylePrimaryName('gridActivite');
    grilActivite.setHtml(0, 0,'<h3>Num</h3>');
    grilActivite.setHtml(0, 1, '<h3>Titre</h3>');
    grilActivite.setHtml(0, 2, '<h3>Supp</h3>');
    grilActivite.setHtml(0, 3, '<h3>Modif</h3>');
    
    PanelAct.addIsWidget(grilActivite);
    
    construction(offreentries);
    
   // bouton ajouter 
btnAjout.addClickHandler(new event.ClickHandlerAdapter((event.ClickEvent e) {
      
      if(valeur.text!='' && seuil.text!='')
      {
        Contrainte contrainte = new Contrainte(activite.contraintes.concept);
        contrainte.activite=activite;
        
        contrainte.critere=offreentries.criteres.firstWhereAttribute("numcritere", comboCritere.getValue(comboCritere.getSelectedIndex()));
        
          contrainte.valeurs=valeur.text.trim();
          contrainte.seuil=seuil.text.trim();
          
    
          //window.alert(test);
          if(activite.contraintes.add(contrainte)){
              AjoutChoix(activite.contraintes);
          }else
          {
           window.alert("Ce critere est deja choisi"); 
          }
          /*grilChoix.setHtml(activite.contraintes.count+1, 0, comboCritere.getItemText(comboCritere.getSelectedIndex()));
          grilChoix.setHtml(activite.contraintes.count+1, 1, valeur.text);
          grilChoix.setHtml(activite.contraintes.count+1, 2, seuil.text);
          grilChoix.setWidget(activite.contraintes.count+1, 3, btnSupp);
          //panCritere.clear();
          //panCritere.add(formCritere(offreentries));
          //panCritere.add(listChoix());*/
          
       
      }else{window.alert('Merci de remplir les champs vide');}
      
    }));


      // bouton enregistrer ou modifier

btnSave.addClickHandler(new event.ClickHandlerAdapter((event.ClickEvent e) {
  
  if(btnSave.text=="Enregistrer")
  {
    if(titre.text!=''){
      if(activite.contraintes.count>0){
          activite.numactivite=cles.text;
          activite.titre=titre.text;
          activite.description=description.text;
          offreentries.activites.add(activite);
          compteur.nbreactivite++;
          DataBase.save(offreentries);
          window.alert("Enregistrement bien effectue");
          //actualisation de la liste des activites
          listactivite(offreentries);
          // fonction pour vider les champs
          Vider(offreentries);
          cles.text='Act_'+(compteur.nbreactivite+1).toString();
          
      }else {window.alert("Merci de choisir les criteres");}
    }else{window.alert("Merci de saisir l'activite");}
  }else  
  if(btnSave.text=="Modifier")
  {
    Activite act = new Activite(offreentries.activites.concept);
    btnSave.text="Enregistrer";
    activite.titre=titre.text;
    activite.description=description.text;
    offreentries.activites.remove(offreentries.activites.singleWhereOid(activite.oid));
    offreentries.activites.add(activite);
    DataBase.save(offreentries);
    window.alert("Modification bien effectue");
    listactivite(offreentries);
    Vider(offreentries);
    cles.text='Act_'+(compteur.nbreactivite+1).toString();
    
  }
}));


// vider les donnees

    btnAnul.addClickHandler(new event.ClickHandlerAdapter((event.ClickEvent e) {
    Vider(offreentries);
    }));
  }
  
  
  
  ui.FlexTable formActiv(){ 
    
    
    layout.setCellSpacing(6);
    ui.FlexCellFormatter cellFormatter = layout.getFlexCellFormatter();
    
    cellFormatter.setHorizontalAlignment(0, 0, i18n.HasHorizontalAlignment.ALIGN_CENTER);
    cles.text='Act_'+(compteur.nbreactivite+1).toString();
    cles.enabled=false;
    //activite.numactivite='Act_'+(compteur.nbreactivite+1).toString();
    layout.setHtml(1, 0, "Numero:");
    layout.setWidget(1, 1, cles);
    layout.setHtml(2, 0, "Activite:");
    layout.setWidget(2, 1, titre);
    layout.setHtml(3, 0, "description:");
    layout.setWidget(3, 1, description);
    return layout;
    /*FIN CONSTRUCTION PANEL ACTIVITE*/
  }
  
  
  
  
  ui.CaptionPanel formCritere(OffreEntries offreentries){
    
    /*DEBUT CONSTRUCTION DU PANEL CONTRAINTE*/
    
    
    for(Critere critere in offreentries.criteres)
    {
      comboCritere.addItem(critere.libelle, critere.numcritere);
    }
    
    ui.CaptionPanel PanelContr = new ui.CaptionPanel("Choix de Critere");
    PanelContr.setSize('95%', '50px');
    
    ui.FlexTable layout1 = new ui.FlexTable();
    layout1.setCellSpacing(6);
    ui.FlexCellFormatter cellFormatter1 = layout1.getFlexCellFormatter();
    
    valeur.setWidth("30px");
    seuil.setWidth("30px");
    
    cellFormatter1.setHorizontalAlignment(0, 0, i18n.HasHorizontalAlignment.ALIGN_CENTER);
    layout1.setHtml(1, 0, "Critere:");
    layout1.setWidget(1, 1, comboCritere);
    layout1.setHtml(1, 2, "Valeur Moyenne:");
    layout1.setWidget(1, 3, valeur);
    layout1.setHtml(1, 4, "Valeur Seuil:");
    layout1.setWidget(1, 5, seuil);
    layout1.setWidget(1, 6, btnAjout);
    PanelContr.add(layout1);
    //pancss(layout1,'wheat');
    
    
    return PanelContr;
    /*FIN CONSTRUCTION PANEL CONTRAINTE*/
  }
  
  
  AjoutChoix(Contraintes contraintes){
    
    /*DEBUT CONSTRUCTION DU PANEL CONTRAINTE choisi*/ 
    PanelContr.setSize('95%', 'auto');
    int nbrow=grilChoix.getRowCount();
   
    if(grilChoix.getRowCount()>1){
    for(int a=grilChoix.getRowCount()-1;  a >0 ;  a--){
      grilChoix.removeRow(a);
    }
    
    }
    int i=1;
    for(var contrainte in contraintes)
    {
      grilChoix.insertRow(i);
      var btnSupp= new ui.Button("Supp");
      grilChoix.setHtml(i, 0,  '<h4>'+contrainte.critere.libelle+'</h4>');
      grilChoix.setHtml(i, 1,  '<h4>'+contrainte.valeurs+'</h4>');
      grilChoix.setHtml(i, 2,  '<h4>'+contrainte.seuil+'</h4>');
      grilChoix.setWidget(i, 3, btnSupp); 
      
      btnSupp.addClickHandler(new event.ClickHandlerAdapter((event.ClickEvent e) {
        contraintes.remove(contrainte);
        AjoutChoix(contraintes);

      }));
      
      i++;
    }
   
    /*FIN CONSTRUCTION DU PANEL CONTRAINTE choisi*/
  }
  
  
  
  
  
  listactivite(OffreEntries offreentries ){
    
    /*DEBUT CONSTRUCTION DU PANEL LISTE DES ACTIVITES*/
    
    PanelAct.setSize('92%', 'auto'); 
    
    if(grilActivite.getRowCount()>1){
      for(int a=grilActivite.getRowCount()-1;  a >0 ;  a--){
        grilActivite.removeRow(a);
      }
    }
    
    int j=1;
    for(Activite activit in offreentries.activites)
    {
      var btnSup= new ui.Button("Supp");
      var btnMod= new ui.Button("Modif");
      grilActivite.insertRow(j);
      grilActivite.setHtml(j, 0, '<h4>'+activit.numactivite+'</h4>');
      grilActivite.setHtml(j, 1, '<h4>'+activit.titre+'</h4>');
      grilActivite.setWidget(j, 2, btnSup);
      grilActivite.setWidget(j, 3, btnMod); 
      
      btnSup.addClickHandler(new event.ClickHandlerAdapter((event.ClickEvent e) {
        if(window.confirm("Voulez vous vraiment supprimer l'activite?"))
        {
          offreentries.activites.remove(activit);
          listactivite(offreentries);
          Vider(offreentries);
          DataBase.save(offreentries);
        }
      }));
      
      btnMod.addClickHandler(new event.ClickHandlerAdapter((event.ClickEvent e) {
       btnSave.text="Modifier";
       activite=null;
       activite = new Activite(offreentries.activites.concept);
       activite=activit;
       cles.text=activite.numactivite;
       titre.text=activite.titre;
       description.text=activite.description;
       AjoutChoix(activite.contraintes);
        
      }));
      
      j++;
    }
    
    //pancss(grilActivite,'white','2px');
    //PanelContr.add(grilActivite);
    //grilActivite.setSize('80%','auto');
    //return PanelContr;
    /*FIN CONSTRUCTION DU PANEL LISTE DES ACTIVITES*/
    
  }
  
  Vider(OffreEntries offreentries){
    titre.text="";
    description.text="";
    valeur.text="";
    seuil.text="";
    
    if(grilChoix.getRowCount()>1){
      for(int a=grilChoix.getRowCount()-1;  a >0 ;  a--){
        grilChoix.removeRow(a);
      }
    }
    activite=null;
    
    activite = new Activite(offreentries.activites.concept);
    
    btnSave.text="Enregistrer";
    
  }
  
  
  
  
  
  construction(OffreEntries offreentries){
     
    listactivite(offreentries);
        
        panInstActi.add(formActiv());
        panInstActi.add(PanelAct);
        
        panCritere.add(formCritere(offreentries));
        panCritere.add(PanelContr);
        panCritere.add(btnSave);
        panCritere.add(btnAnul);
        
        //panCritere.add(listactivite(offreentries));
        
        
        panActivite.add(panInstActi);
        panActivite.add(panCritere);
        
        
        pancss(panInstActi,'wheat');
        pancss(panCritere,'wheat');
       
        pancss(panActivite,'');
        
        this.setStylePrimaryName('activite');
        add(panActivite);
        //add(listactivite(offreentries));
        
    }
  
  pancss(var PanelParam, String color, [String bord]){
    PanelParam.getElement().style.margin="2px 2px 8px 2px";
    PanelParam.getElement().style.borderRadius="4px 4px 4px 4px";
    PanelParam.getElement().style.backgroundColor=color;
    PanelParam.getElement().style.font="verdana";
    PanelParam.getElement().style.fontSize="10px";
    PanelParam.getElement().style.fontWeight="bold";
    PanelParam.getElement().style.border=bord;
  }
 
}