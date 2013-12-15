part of gestion_offre_app;


class GestionEvaluation extends ui.VerticalPanel {
  
 
  ui.ListBox comboActivite = new ui.ListBox();
  ui.ListBox comboEntreprise = new ui.ListBox();
  
  GestionEvaluation(OffreEntries offreentries) {
    
  }
  
ui.CaptionPanel formCritere(OffreEntries offreentries){
    
    /*DEBUT CONSTRUCTION DU PANEL CONTRAINTE*/
    
    
    for(Activite activite in offreentries.activites)
    {
      comboActivite.addItem(activite.numactivite+'-->'+activite.titre, activite.numactivite);
    }
    
    for(Entreprise entreprise in offreentries.entreprises)
    {
      comboActivite.addItem('Designation: '+entreprise.designation+' <--> Responsable: '+entreprise.responsable, entreprise.numentreprise);
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
 
}