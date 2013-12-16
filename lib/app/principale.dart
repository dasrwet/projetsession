part of gestion_offre_app;

/**
 * Todo Application entry point.
 */
class Principale {
  GestionModels domain;
  DomainSession session;
  //Contacts contacts;
  /*ui.CaptionPanel panelP = new ui.CaptionPanel("Gestion de contact");
  ui.CaptionPanel panelL = new ui.CaptionPanel("List");
  ui.CaptionPanel panelF = new ui.CaptionPanel("Formulaire");
  
 

  //Header header;
  //Footer footer;

  **
   * Create new instance of [TodoApp].
   */
 
  Principale(this.domain) {
    session = domain.newSession();
    OffreEntries model = domain.getModelEntries('Offre');
    DataBase.Start(model);
    var cpt = compteur;
    //DataBase.drop(model);
    var todos = new GestionOffres(model);
    
    var rootPanel = ui.RootLayoutPanel.get();
           
    ui.DockPanel dock = new ui.DockPanel();
    dock.clearAndSetStyleName("cw-DockPanel");
    dock.spacing = 4;
    dock.setSize("90%", "100%");
    dock.setHorizontalAlignment(i18n.HasHorizontalAlignment.ALIGN_CENTER);
    
    ui.ScrollPanel scroller = new ui.ScrollPanel(dock);
    scroller.clearAndSetStyleName("cnt_body");
    
    
    // Create a menu bar
    ui.MenuBar menu = new ui.MenuBar();
    menu.setAutoOpen(true);
    menu.setWidth("500px");
    menu.setAnimationEnabled(true);
    // Create the Home menu
    ui.MenuBar HomeMenu = new ui.MenuBar(true);
    HomeMenu.setAnimationEnabled(true);
    menu.addItem(new ui.MenuItem('<a href="../doc/problem.txt" target="autre">Problemes</a>', true, subMenu:HomeMenu));
    // Create the Exit menu
    ui.MenuBar exitMenu = new ui.MenuBar(true);
    menu.addSeparator();
    menu.addItem(new ui.MenuItem('<a href="../doc/appeloffre.txt" target="autre">Equipe</a>', true, subMenu:exitMenu));
    // Create the help menu
    ui.MenuBar helpMenu = new ui.MenuBar(true);
    menu.addSeparator();
    menu.addItem(new ui.MenuItem('<a href="../README.md" target="autre">Aide? </a>', true, subMenu:helpMenu));
    

    // Add text all around
    dock.addWidgetTo(new ui.Html("<div id='header'></div>"), util.DockLayoutConstant.NORTH);
    dock.addWidgetTo(new ui.Html("<div id='footer'></br></br>Copyright GestOffre &copy; - Tous droits réservés<br /><a href='#'> Nous contacter</a></div>"), util.DockLayoutConstant.SOUTH);
    dock.addWidgetTo(menu, util.DockLayoutConstant.NORTH);
    dock.addWidgetTo(todos, util.DockLayoutConstant.CENTER);     
    rootPanel.add(scroller);       
   
  }
  principale() {}

  /**
   * Save list of task to local storage.
   */
 // save() { 
  //  window.localStorage['todos-dartling-dwt'] = JSON.encode(contacts.toJson());
 // }

    saveAs(OffreEntries model) { 
    window.localStorage['compteurdb'] = JSON.encode(model.compteurs.toJson());
    window.localStorage['entreprisedb'] = JSON.encode(model.entreprises.toJson());
    window.localStorage['activitedb'] = JSON.encode(model.activites.toJson());
    window.localStorage['criteredb'] = JSON.encode(model.criteres.toJson());
 }
  /**
   * Update header and footer components on page.
   */
  debalejson(OffreEntries model)
  {
    String jsoncompteur = window.localStorage['compteurdb'];
    String jsonentreprise = window.localStorage['entreprisedb'];
    String jsonactivite = window.localStorage['activitedb'];
    String jsoncritere = window.localStorage['criteredb'];
    if (jsoncompteur != null && jsonentreprise != null && 
        jsonactivite != null && jsoncritere != null) {
      try {
        model.compteurs.fromJson(JSON.decode(jsoncompteur));
        model.entreprises.fromJson(JSON.decode(jsonentreprise));
        model.activites.fromJson(JSON.decode(jsonactivite));
        model.criteres.fromJson(JSON.decode(jsoncritere));
      } on Exception catch(e) {
        print(e);
      }
     }
  }
  
  updateDisplay(OffreEntries model) {
    model.activites.clear();
    model.entreprises.clear();
    model.criteres.clear();
    model.compteurs.clear();
    saveAs(model);
  }
}

