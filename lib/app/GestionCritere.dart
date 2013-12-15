part of gestion_offre_app;

class GestionCritere extends ui.VerticalPanel {
  
  
  Critere crit;
  var cles = new ui.TextBox();
  var libelle = new ui.TextBox();
  var btnAjout= new ui.Button("Ajouter");
  var btnAnnuler= new ui.Button("Annuler");
  
  ui.CaptionPanel dePanel = new ui.CaptionPanel("LISTE DES CRITERES");
  
  GestionCritere(OffreEntries offreentries) {
  
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
    layout.setHtml(0, 0, "Enter one critere");
    cellFormatter.setColSpan(0, 0, 2);
    cellFormatter.setHorizontalAlignment(0, 0, i18n.HasHorizontalAlignment.ALIGN_CENTER);

// Add some standard form options
    cles.enabled=false;
    cles.text='Cri_'+(compteur.nbrecritere+1).toString();
    layout.setHtml(1, 0, "Cles:");
    layout.setWidget(1, 1, cles);
    layout.setHtml(2, 0, "Libelle:");
    layout.setWidget(2, 1, libelle);
    layout.setWidget(3, 0, btnAjout);
    layout.setWidget(3, 1, btnAnnuler);
    
// Wrap the content in a DecoratorPanel
    ui.DecoratorPanel decPanel = new ui.DecoratorPanel();
    decPanel.setStylePrimaryName('gridCritere');
    decPanel.setWidget(layout);
    
    
    ui.DecoratorPanel  dePanels = new ui.DecoratorPanel();
    dePanels.setSize("100%", "100%");
    
    
    
    btnAjout.addClickHandler(new event.ClickHandlerAdapter((event.ClickEvent e) {
      if (cles.text.trim() != '') {
      var critere = new Critere(offreentries.criteres.concept);
      critere.numcritere = cles.text.trim();
      critere.libelle = libelle.text.trim();
          if(btnAjout.text=='Ajouter'){
          if(offreentries.criteres.add(critere)){
            compteur.nbrecritere++;
            DataBase.save(offreentries);
            cles.text='Cri_'+(compteur.nbrecritere+1).toString();
            window.alert("Enregistrement effectuee avec succes");
            dePanel.clear();
            dePanel.setContentWidget(_listAffDir(offreentries));
                    }else{window.alert("Ce critere existe deja");}
          //window.location.reload();
          
          }else{
           
            offreentries.criteres.update(crit, critere);
            compteur.nbrecritere++;
            DataBase.save(offreentries);
            //window.location.reload();
            window.alert("Modification effectuee avec succes");
            cles.text='Cri_'+(compteur.nbrecritere+1).toString();
            libelle.setValue("");
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
      cles.text='Cri_'+(compteur.nbrecritere+1).toString();
      libelle.setValue("");
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
    layout.setHtml(0, 1, "<h3>Libelle</h3>");
    layout.setHtml(0, 2, "<h3>Modif</h3>");
    layout.setHtml(0, 3, "<h3>Supp</h3>");

    var clor="#c8bfe7";
    int i=1;
    for (var critere in offreentries.criteres) {
      var btnAjouM = new ui.Button("Modif");
      var btnAjouS = new ui.Button("Supp");
 
      layout.setHtml(i, 0, '<h4>'+critere.numcritere+'</h4>');
      layout.setHtml(i, 1, '<h4>'+critere.libelle+'</h4>');
      layout.setWidget(i, 2, btnAjouM);
      layout.setWidget(i, 3, btnAjouS);
      
      btnAjouS.addClickHandler(new event.ClickHandlerAdapter((event.ClickEvent e) {
        if (window.confirm("Confirmez la suppression?"))
        {
          offreentries.criteres.remove(critere);
          DataBase.save(offreentries);
          //window.location.reload();
          window.alert("Suppression effectuee avec succes");
          dePanel.clear();
          dePanel.setContentWidget(_listAffDir(offreentries));
          
        }
      })); 
      
      
      btnAjouM.addClickHandler(new event.ClickHandlerAdapter((event.ClickEvent e) {
        cles.setValue(critere.numcritere); 
        libelle.setValue(critere.libelle);
        btnAjout.text="Modifier";
        crit=critere;
        
      })); 
      i++;
    }
    layout.setStylePrimaryName('gridCritere');
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