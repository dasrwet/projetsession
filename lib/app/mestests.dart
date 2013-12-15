part of gestion_offre_app;

class MesTests extends ui.VerticalPanel {
 
  var cles = new ui.TextBox();
  var nom = new ui.TextBox();
  var prenom = new ui.TextBox();
  var phone = new ui.TextBox();
  var email = new ui.TextBox();
  var adresse = new ui.TextArea();
  var btnAjout= new ui.Button("Ajouter");
  var btnAnnuler= new ui.Button("Annuler");
  
  ui.CaptionPanel dePanel = new ui.CaptionPanel("LISTE DES CONTACTS");
  
  MesTests(OffreEntries offreentries) {
    spacing = 10;
    ui.FlexTable layout = new ui.FlexTable();
    layout.setCellSpacing(6);
    ui.FlexCellFormatter cellFormatter = layout.getFlexCellFormatter();
    Point p1 = new Point(30,0);
    Point p2 = new Point(600,400);
    dePanel.setCaptionHtml('<canvas id="canvas" width="800" height="800"></canvas>');
    Element el= dePanel.getElement();
    CanvasElement canvas = el.querySelector('#canvas'); //document.querySelector('#canvas');
    Board board = new Board(canvas,p1,p2,offreentries.activites.first);
    
    //horizontal panel
    ui.HorizontalPanel hpanel = new ui.HorizontalPanel();
    hpanel.spacing = 10;
      // Add a title to the form
     // Administration admin = new Administration(offreentries.administrations.concept);
    // Authentification auth = new Authentification(offreentries.authentifications.concept);
    Activite act = new Activite(offreentries.activites.concept);
    
    /*admin.matricule="m001";
    admin.nom="dossou";
    admin.prenom="codjo";
    admin.poste="administrateur";
    admin.pseudo="admin";
    admin.pass="admin";
    //
    
    act.numactivite="0001";
    act.titre="renovation";
    act.description="renovation des ministeres";
    
    auth.activite=act;
    auth.administration=admin;
    
    admin.authentifications.add(auth);
    act.authentifications.add(auth);
    
    offreentries.authentifications.add(auth);
    offreentries.administrations.add(admin);
    offreentries.activites.add(act);
    
    print(offreentries.toString());
    */
    
    
    
    layout.setHtml(0, 0, "Enter one contact");
    cellFormatter.setColSpan(0, 0, 2);
    cellFormatter.setHorizontalAlignment(0, 0, i18n.HasHorizontalAlignment.ALIGN_CENTER);

// Add some standard form options
    /*layout.setHtml(1, 0, "Cles:");
    layout.setWidget(1, 1, cles);
    layout.setHtml(2, 0, "Nom:");
    layout.setWidget(2, 1, nom);
    layout.setHtml(3, 0, "Prenom:");
    layout.setWidget(3, 1,prenom);
    layout.setHtml(4, 0, "Phone:");
    layout.setWidget(4, 1, phone);
    layout.setHtml(5, 0, "email:");
    layout.setWidget(5, 1, email);
    layout.setHtml(6, 0, "Adresse:");
    layout.setWidget(6, 1, adresse);
    layout.setWidget(7, 0, btnAjout);
    layout.setWidget(7, 1, btnAnnuler);
    */
   var  i=0;
    for (var val in colorList())
    { var btn = new ui.Button(colorMap(val)[val]);
      btn.getElement().style.background=colorMap(val)[val];
      btn.getElement().style.border="0px";
    layout.setHtml(i, 0, val);
    layout.setWidget(i, 1, btn);
    i++;
    }
    layout.getElement().style.background="white";
    ui.DecoratorPanel decPanel = new ui.DecoratorPanel();
    decPanel.setWidget(layout);
    
    add(decPanel);
  }
 
  //----------------------fonction de sauvegarde------------------
  save(OffreEntries offreentries) { 
    window.localStorage['todos-dartling-dwt'] = JSON.encode(offreentries.toJson());
  }
}