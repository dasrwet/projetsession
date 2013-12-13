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
   //new ui.Html("<div stype='borderRadius:4px 4px 0px 0px;margin:2px 2px 4px 0px; width:120px;background:wheat'>Critere</div>")
   Tablepanel.addTabText(gestionactivite, "Activite");
   Tablepanel.addTabText(gestioncritere, "Critere"); 
   //Tablepanel.addTabText(gestioncontrainte, "Contrainte");
   Tablepanel.addTabText(gestionentreprise, "Entreprise");
   Tablepanel.addTabText(gestionevaluation, "Evaluation");
   Tablepanel.selectTab(0);
   Tablepanel.setSize("500px", "250px");
   Tablepanel.setAnimationEnabled(true);
   
   
   Tablepanel.getElement().style.margin="2px 2px 8px 2px";
   Tablepanel.getElement().style.borderRadius="4px 4px 4px 4px";
   Tablepanel.getElement().style.backgroundColor="khaki";
   Tablepanel.getElement().style.font="verdana";
   Tablepanel.getElement().style.fontSize="14px";
   Tablepanel.getElement().style.fontWeight="bold";
 }
}