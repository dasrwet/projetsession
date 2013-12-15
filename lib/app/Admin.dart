part of gestion_offre_app;

class Admin extends ui.VerticalPanel {
  
 GestionActivite gestionactivite;
 GestionCritere gestioncritere;
 //GestionContrainte gestioncontrainte;
 GestionEntreprise gestionentreprise;
 GestionEvaluation gestionevaluation;
 Analyse analyse;
 
 ui.TabPanel Tablepanel = new ui.TabPanel();
  
  Admin(OffreEntries offreentries) {
    
   
    
    _Construction(offreentries);
    
 
    add(Tablepanel);
    
    
  }
  
 _Construction(OffreEntries offreentries){
   gestionactivite = new GestionActivite(offreentries);
   gestioncritere = new GestionCritere(offreentries);
  // gestioncontrainte = new GestionContrainte(offreentries);
   gestionentreprise = new  GestionEntreprise(offreentries);
   gestionevaluation = new  GestionEvaluation(offreentries);
    
   Tablepanel.addTabText(gestioncritere, "<div><label>Critere</label></div>",true); 
   //Tablepanel.addTabText(gestioncontrainte, "<div>Contrainte");
   Tablepanel.addTabText(gestionentreprise, "<div><label>Entreprise</label></div>",true);
   Tablepanel.addTabText(gestionactivite, "<div><label>Activite</label></div>",true);
   Tablepanel.addTabText(gestionevaluation, "<div><label>Evaluation</label></div>",true);
   Tablepanel.selectTab(0);
   Tablepanel.setSize("100%", "auto");
   Tablepanel.setStylePrimaryName('admin');
   Tablepanel.setAnimationEnabled(true);
   
 }
}