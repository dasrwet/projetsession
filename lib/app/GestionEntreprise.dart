part of gestion_offre_app;

class GestionEntreprise extends ui.VerticalPanel {
  
  
  Entreprise entr;
  var cles = new ui.TextBox();
  var designation = new ui.TextBox();
  var raisonsocial = new ui.TextBox();
  var responsable = new ui.TextBox();
  var btnAjout= new ui.Button("Ajouter");
  var btnAnnuler= new ui.Button("Annuler");
  
  ui.CaptionPanel dePanel = new ui.CaptionPanel("LISTE DES ENTREPRISE");
  
  GestionEntreprise(OffreEntries offreentries) {
    
    this.setStylePrimaryName('activite');
    pancss(dePanel,'wheat');
    //dePanel.setStylePrimaryName('gridCritere');
    spacing = 10;
    ui.FlexTable layout = new ui.FlexTable();
    layout.setCellSpacing(6);
    ui.FlexCellFormatter cellFormatter = layout.getFlexCellFormatter();
   
    //horizontal panel
    ui.HorizontalPanel hpanel = new ui.HorizontalPanel();
    hpanel.spacing = 10;
// Add a title to the form
    layout.setHtml(0, 0, "Enter one Entreprise");
    cellFormatter.setColSpan(0, 0, 2);
    cellFormatter.setHorizontalAlignment(0, 0, i18n.HasHorizontalAlignment.ALIGN_CENTER);

// Add some standard form options
    cles.enabled=false;
    cles.text='Entr_'+(compteur.nbreentreprise+1).toString();
    layout.setHtml(1, 0, "Cles:");
    layout.setWidget(1, 1, cles);
    layout.setHtml(2, 0, "Designation:");
    layout.setWidget(2, 1, designation);
    layout.setHtml(3, 0, "Raison Social:");
    layout.setWidget(3, 1, raisonsocial);
    layout.setHtml(4, 0, "Responsable:");
    layout.setWidget(4, 1, responsable);
    layout.setWidget(5, 0, btnAjout);
    layout.setWidget(5, 1, btnAnnuler);
    
// Wrap the content in a DecoratorPanel
    ui.DecoratorPanel decPanel = new ui.DecoratorPanel();
    decPanel.setStylePrimaryName('gridCritere');
    decPanel.setWidget(layout);
    
    
    ui.DecoratorPanel  dePanels = new ui.DecoratorPanel();
    dePanels.setSize("100%", "100%");
    
    
    
    btnAjout.addClickHandler(new event.ClickHandlerAdapter((event.ClickEvent e) {
      if (cles.text.trim() != '') {
      var entreprise = new Entreprise(offreentries.entreprises.concept);
      entreprise.numentreprise = cles.text.trim();
      entreprise.designation = designation.text.trim();
      entreprise.raisonsocial = raisonsocial.text.trim();
      entreprise.responsable = responsable.text.trim();
      
          if(btnAjout.text=='Ajouter'){
          if(offreentries.entreprises.add(entreprise)){
            compteur.nbreentreprise++;
            DataBase.save(offreentries);
            cles.text='Entr_'+(compteur.nbreentreprise+1).toString();
            window.alert("Enregistrement effectuee avec succes");
            dePanel.clear();
            dePanel.setContentWidget(_listAffDir(offreentries));
                    }else{window.alert("Cette entreprise existe deja");}
          //window.location.reload();
          
          }else{
           
            offreentries.entreprises.update(entr, entreprise);
            compteur.nbreentreprise++;
            DataBase.save(offreentries);
            //window.location.reload();
            window.alert("Modification effectuee avec succes");
            cles.text='Entr_'+(compteur.nbreentreprise+1).toString();
            designation.setValue("");
            raisonsocial.setValue("");
            responsable.setValue("");
            btnAjout.text='Ajouter';
            dePanel.clear();
            dePanel.setContentWidget(_listAffDir(offreentries));
                  
          }
      //dePanel.clear();
      //dePanel.setCaptionHtml(_listAff(contacts));
      //_add(contact);
      }
    })); 
    
    btnAnnuler.addClickHandler(new event.ClickHandlerAdapter((event.ClickEvent e) {
      cles.text='Entr_'+(compteur.nbreentreprise+1).toString();
      designation.setValue("");
      raisonsocial.setValue("");
      responsable.setValue("");
      btnAjout.text='Ajouter';
    })); 
    hpanel.add(decPanel);
    
    //add(decPanel);
    dePanel.setContentWidget(_listAffDir(offreentries));
    
    hpanel.add(dePanel);
    add(hpanel);
    
    //_AttribOnClik(contacts);
    //add(_listPanel);
   
  }
  
  
  
  
ui.FlexTable _listAffDir(OffreEntries offreentries){
    
    ui.FlexTable layout = new ui.FlexTable();
    layout.setCellSpacing(6);
    ui.FlexCellFormatter cellFormatter = layout.getFlexCellFormatter();

// Add a title to the form
    //layout.setBorderWidth(2);
    layout.setHtml(0, 0, "<h3>Num</h3>");
    layout.setHtml(0, 1, "<h3>Designation</h3>");
    layout.setHtml(0, 2, "<h3>Raison Social</h3>");
    layout.setHtml(0, 3, "<h3>Responsable</h3>");
    layout.setHtml(0, 4, "<h3>Modif</h3>");
    layout.setHtml(0, 5, "<h3>Supp</h3>");

    var clor="#c8bfe7";
    int i=1;
    for (var entreprise in offreentries.entreprises) {
      var btnAjouM = new ui.Button("Modif");
      var btnAjouS = new ui.Button("Supp");
 
      layout.setHtml(i, 0, '<h4>'+entreprise.numentreprise+'</h4>');
      layout.setHtml(i, 1, '<h4>'+entreprise.designation+'</h4>');
      layout.setHtml(i, 2, '<h4>'+entreprise.raisonsocial+'</h4>');
      layout.setHtml(i, 3, '<h4>'+entreprise.responsable+'</h4>');
      layout.setWidget(i, 4, btnAjouM);
      layout.setWidget(i, 5, btnAjouS);
      
      btnAjouS.addClickHandler(new event.ClickHandlerAdapter((event.ClickEvent e) {
        if (window.confirm("Confirmez la suppression?"))
        {
          offreentries.entreprises.remove(entreprise);
          DataBase.save(offreentries);
          //window.location.reload();
          window.alert("Suppression effectuee avec succes");
          dePanel.clear();
          dePanel.setContentWidget(_listAffDir(offreentries));
          
        }
      })); 
      
      
      btnAjouM.addClickHandler(new event.ClickHandlerAdapter((event.ClickEvent e) {
        cles.setValue(entreprise.numentreprise); 
        designation.setValue(entreprise.designation);
        raisonsocial.setValue(entreprise.raisonsocial); 
        responsable.setValue(entreprise.responsable);
        btnAjout.text="Modifier";
        entr=entreprise;
        
      })); 
      i++;
    }
    layout.setStylePrimaryName('gridEntrprese');
    return layout;
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