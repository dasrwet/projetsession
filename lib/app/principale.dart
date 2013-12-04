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
    OffreEntries model = domain.getModelEntries('offre');
    //contacts = model.contacts;
    
    var rootPanel = ui.RootLayoutPanel.get();
    
    var vPanel = new ui.VerticalPanel();
    vPanel.spacing = 10;
    rootPanel.add(vPanel);
    var title = new ui.Label('Test');
    vPanel.add(title);
    //var todos = new MesTests(model);
    var todos = new GestionOffres(model);
    vPanel.add(todos);

    //header = new Header(this);
    //Todos todos = new Todos(this);
    //footer = new Footer(this, todos);

    //updateDisplay();
  }

  /**
   * Save list of task to local storage.
   */
 // save() { 
  //  window.localStorage['todos-dartling-dwt'] = JSON.encode(contacts.toJson());
 // }

  /**
   * Update header and footer components on page.
   */
  updateDisplay() {
    //header.updateDisplay();
    //footer.updateDisplay();
    
   /*  panelP.getElement().style.border = "3px solid #00c";
     panelP.getContentWidget().getElement().style.margin = "5px 10px 10px 10px";
     panelP.getContentWidget().getElement().style.padding = "10px 10px 10px 10px";
     panelP.getContentWidget().getElement().style.border = "1px solid #ccf";

    
    panelP.add(panelL);
    panelP.add(panelF);
    ui.RootPanel.get().add(panelP);*/
  }
}

