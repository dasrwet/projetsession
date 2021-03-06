part of gestion_offre_app;


class GestionEvaluation extends ui.VerticalPanel {
  
 
  ui.ListBox comboActivite = new ui.ListBox();
  ui.ListBox comboEntreprise = new ui.ListBox();
  ui.CaptionPanel PanelContr = new ui.CaptionPanel("");
  var btnLancer= new ui.Button("Lancer");
  var enregistrer= new ui.Button("Enregistrer");
  ui.Grid grilChoix ;
  List<ui.DoubleBox> listEval = new List<ui.DoubleBox>();
  Entreprise entreprise; 
 Activite activite;
 Evaluation evaluation;
 Contrainte contrainte;
  
  GestionEvaluation(OffreEntries offreentries) {
    this.setStylePrimaryName('activite');
    entreprise = new Entreprise(offreentries.entreprises.concept);
    activite = new Activite(offreentries.activites.concept);
    contrainte = new Contrainte(activite.contraintes.concept);
    evaluation = new Evaluation(contrainte.evaluations.concept);
    add(formEval(offreentries));
    grilChoix = new ui.Grid(1,4);
    //grilChoix.setCellFormatter();
    grilChoix.setStylePrimaryName('gridCritere');
    add(grilChoix);
    add(enregistrer);
    
    
    grilChoix.setHtml(0, 0,'<h3>CRITERE</h3>');
    grilChoix.setHtml(0, 1, '<h3>Valeur Moyenne</h3>');
    grilChoix.setHtml(0, 2, '<h3>Valeur seuil</h3>');
    grilChoix.setHtml(0, 3, '<h3>Evaluation</h3>');
    
    btnLancer.addClickHandler(new event.ClickHandlerAdapter((event.ClickEvent e) {
      
      if(comboActivite.getValue(comboActivite.getSelectedIndex())!='0'){
       activite = offreentries.activites.firstWhereAttribute('numactivite',comboActivite.getValue(comboActivite.getSelectedIndex()));
       entreprise=offreentries.entreprises.firstWhereAttribute('numentreprise',comboEntreprise.getValue(comboEntreprise.getSelectedIndex()));

       AjoutChoix(activite.contraintes, comboEntreprise.getValue(comboEntreprise.getSelectedIndex()));
      }else{
        window.alert('Merci de choisir une activite');
      }
      
    }));
    
    enregistrer.addClickHandler(new event.ClickHandlerAdapter((event.ClickEvent e) {
      int i=0;
      if(comboEntreprise.getValue(comboEntreprise.getSelectedIndex())!='0' && comboActivite.getValue(comboActivite.getSelectedIndex())!='0'){
      for (var contrainte in activite.contraintes)
      {
        var _evaluation = new Evaluation(contrainte.evaluations.concept);
        _evaluation.valeur=listEval.elementAt(i).text;
        _evaluation.contrainte=contrainte;
        _evaluation.entreprise=entreprise;
        if(!contrainte.evaluations.add(_evaluation))
        {
          contrainte.evaluations.remove(_evaluation);
          contrainte.evaluations.add(_evaluation);
        }
        i++;
      }
      var act = offreentries.activites.singleWhereOid(activite.oid);
      offreentries.activites.remove(act);
      
      offreentries.activites.add(activite);
     DataBase.save(offreentries);
     window.alert('Action effectuer avec succes');
     
     if(grilChoix.getRowCount()>1){
       for(int a=grilChoix.getRowCount()-1;  a >0 ;  a--){
         grilChoix.removeRow(a);
       }  
     }
     
     comboActivite.setItemSelected(0, true);
     comboEntreprise.setItemSelected(0, true);
      }else{window.alert('Merci de selectionner une activite et/ou une entreprise');}
     
    }));
    
    
  }
  
ui.CaptionPanel formEval(OffreEntries offreentries){
    
    /*DEBUT CONSTRUCTION DU PANEL CONTRAINTE*/
    
  comboActivite.addItem('----------Choisissez une activite----------','0');
    for(Activite activite in offreentries.activites)
    {
      comboActivite.addItem(activite.numactivite+'-->'+activite.titre, activite.numactivite);
    }
    comboEntreprise.addItem('----------Choisissez une entreprise-----------------','0');
    for(Entreprise entreprise in offreentries.entreprises)
    {
      comboEntreprise.addItem('Designation: '+entreprise.designation+' <--> Responsable: '+entreprise.responsable, entreprise.numentreprise);
    }
    
    PanelContr.setSize('95%', '50px');
    
    ui.FlexTable layout1 = new ui.FlexTable();
    layout1.setCellSpacing(6);
    ui.FlexCellFormatter cellFormatter1 = layout1.getFlexCellFormatter();

    
    cellFormatter1.setHorizontalAlignment(0, 0, i18n.HasHorizontalAlignment.ALIGN_CENTER);
    layout1.setHtml(1, 0, "Activite:");
    layout1.setWidget(1, 1, comboActivite);
    layout1.setHtml(1, 2, "Entreprise");
    layout1.setWidget(1, 3, comboEntreprise);
    layout1.setWidget(1, 4, btnLancer);
    PanelContr.add(layout1);

    return PanelContr;
    /*FIN CONSTRUCTION PANEL CONTRAINTE*/
  }



AjoutChoix(Contraintes contraintes, String entr){
  
  /*DEBUT CONSTRUCTION DU PANEL CONTRAINTE choisi*/ 
  PanelContr.setSize('95%', 'auto');
  int nbrow=grilChoix.getRowCount();
  
  if(grilChoix.getRowCount()>1){
    for(int a=grilChoix.getRowCount()-1;  a >0 ;  a--){
      grilChoix.removeRow(a);
    }
    
    }
    int i=1;
    listEval.clear();
    for(var contrainte in contraintes)
    { var value='';
      ui.DoubleBox eval = new ui.DoubleBox();
      if(entr=='0') {eval.enabled=false;}else
      { 
        for(Evaluation evaluation in contrainte.evaluations)
        {
          if(evaluation.entreprise.numentreprise==entr)
          {
            value=evaluation.valeur;
          }
        }
      }
      eval.text=value;
      listEval.add(eval);
      
      grilChoix.insertRow(i);
      var btnSupp= new ui.Button("Supp");
      grilChoix.setHtml(i, 0,  '<h4>'+contrainte.critere.libelle+'</h4>');
      grilChoix.setHtml(i, 1,  '<h4>'+contrainte.valeurs+'</h4>');
      grilChoix.setHtml(i, 2,  '<h4>'+contrainte.seuil+'</h4>');
      grilChoix.setWidget(i, 3, listEval.elementAt(i-1)); 
      
      i++;
      
    }
   
    /*FIN CONSTRUCTION DU PANEL CONTRAINTE choisi*/
  }
 
}