export class NavBar{
	// ////////////////////////////////////////////////////////////
    // BUILDER
    // ////////////////////////////////////////////////////////////
    constructor(variable){
    	this.variable= variable;
        this.project= variable.project;
        if(this.project.statu){
            this.data= this.project.data;
            this.element= variable.default.all.navbar;
            
            this.project_name= `${this.project.name.title}${this.project.name.symbol}`;
            this.element_name = `${this.project_name}${this.element.name.title}`;
            this.element_name_symbol= this.element.name.symbol;
            this.all();
        }
    }
    
    // ////////////////////////////////////////////////////////////
    // METHODS
    // ////////////////////////////////////////////////////////////
    /**
	 * Metodo que me permite llamar todos los metodos de esta clase.
	 */
    all(){
    	this.advanced();
    }
    
    /**
	 * Metodo que permite hacer animaciones del menu avanzado.
	 */
    advanced(){
    	let advanced= this.element.all.advanced;
    	if(advanced.statu){
    		let advanced_name= `${this.element_name}${this.element_name_symbol}${advanced.name.title}`;
        	let advanced_symbol= advanced.name.symbol;	
        	
        	const _ADVANCED_NAME_CHILDREN_1_= `${advanced_name}${advanced_symbol}container-links-advanced`;
        	const _ADVANCED_NAME_GRID_ =`${advanced_name}${advanced_symbol}container-grid-structure`;
        	const _ADVANCED_NAME_ACTIVE = `${this.project_name}active`
        	const _ADVANCED_NAME_CATEGORY = `#${advanced_name} .${advanced_name}${advanced_symbol}container-grid-structure-categories a`;
        	const _ADVANCED_NAME_SUBCATEGORY_ = `.${advanced_name}${advanced_symbol}container-grid-structure-container-subcategories-subcategories`;
        	const _ADVANCED_NAME_ICON_MENU= `#${advanced_name}${advanced_symbol}container-buttons-menu`;
        	const _ADVANCED_NAME_LINKS = `#${advanced_name} .${advanced_name}${advanced_symbol}container-buttons-menu`;
        	const _ADVANCED_NAME_BUTTON_RETURN = `.${advanced_name}${advanced_symbol}container-grid-structure-button-return`;
        	const _ADVANCED_NAME_BUTTON_CLOSE= `#${advanced_name}${advanced_symbol}container-buttons-close`;
     
        	const esDispositivoMovil = () => window.innerWidth <= 800;
        	
        	let departments = document.getElementById(_ADVANCED_NAME_CHILDREN_1_);
        	let grid = document.getElementById(_ADVANCED_NAME_GRID_);
        	let advanced_name_movil = document.querySelector(_ADVANCED_NAME_ICON_MENU);
        	let contenedorEnlacesNav = document.querySelector(_ADVANCED_NAME_LINKS);
        	let btnCerrarMenu = document.getElementById(_ADVANCED_NAME_BUTTON_CLOSE);
        	let contenedorSubCategorias = document.querySelector(_ADVANCED_NAME_SUBCATEGORY_);
        	
        	if(grid != null && departments != null){
        		////////////////////////
               	// OPEN NAVBAR
               	////////////////////////
        		departments.addEventListener("mouseover", () =>{
    				if(!esDispositivoMovil()){
    					grid.classList.add(_ADVANCED_NAME_ACTIVE);
    				}
    			});
        		
        		////////////////////////
               	// CLOSE NAVBAR
               	////////////////////////
        		grid.addEventListener('mouseleave', () => {
            		if(!esDispositivoMovil()){
            			grid.classList.remove(_ADVANCED_NAME_ACTIVE);
            		}
            	});
        	}
        	
        	////////////////////////
           	// SUBITEMS
           	////////////////////////
           	document.querySelectorAll(_ADVANCED_NAME_CATEGORY).forEach((elemento) => {
        		elemento.addEventListener('mouseenter', (e) => {
        			if(!esDispositivoMovil()){
        				document.querySelectorAll(_ADVANCED_NAME_SUBCATEGORY_).forEach((categoria) => {
        					categoria.classList.remove(_ADVANCED_NAME_ACTIVE);
        					if(categoria.dataset.categoria == e.target.dataset.categoria){
        						categoria.classList.add(_ADVANCED_NAME_ACTIVE);
        					}
        				});
        			};
        		});
        	});
        	
           	////////////////////////
           	// MOVIL
           	////////////////////////
        	if(advanced_name_movil != null){
        		advanced_name_movil.addEventListener('click', (e) => {
            		e.preventDefault();
            		if(contenedorEnlacesNav.classList.contains(_ADVANCED_NAME_ACTIVE)){
            			contenedorEnlacesNav.classList.remove(_ADVANCED_NAME_ACTIVE);
            			document.querySelector('body').style.overflow = 'visible';
            		} else {
            			contenedorEnlacesNav.classList.add(_ADVANCED_NAME_ACTIVE);
            			document.querySelector('body').style.overflow = 'hidden';
            		}
            	});
        	}
        	
           	////////////////////////
           	// MOVIL V2
           	////////////////////////
        	if(departments != null){
            	departments.addEventListener('click', (e) => {
            		e.preventDefault();
            		grid.classList.add(_ADVANCED_NAME_ACTIVE);
            		btnCerrarMenu.classList.add(_ADVANCED_NAME_ACTIVE);
            	});
        	}
        	
           	////////////////////////
           	// RETURN
           	////////////////////////
        	let aux = document.querySelector(_ADVANCED_NAME_BUTTON_RETURN);
        	if(aux != null){
        		aux.addEventListener('click', (e) => {
            		e.preventDefault();
            		grid.classList.remove(_ADVANCED_NAME_ACTIVE);
            		btnCerrarMenu.classList.remove(_ADVANCED_NAME_ACTIVE);
            	});
        		
        	}
        	
        	////////////////////////
           	// CATEGORY
           	////////////////////////
        	document.querySelectorAll(_ADVANCED_NAME_CATEGORY).forEach((elemento) => {
        		elemento.addEventListener('click', (e) => {
        			if(esDispositivoMovil()){
        				contenedorSubCategorias.classList.add(_ADVANCED_NAME_ACTIVE);
        				document.querySelectorAll(_ADVANCED_NAME_SUBCATEGORY_).forEach((categoria) => {
        					categoria.classList.remove(_ADVANCED_NAME_ACTIVE);
        					if(categoria.dataset.categoria == e.target.dataset.categoria){
        						categoria.classList.add(_ADVANCED_NAME_ACTIVE);
        					}
        				});
        			} 
        		});
        	});
        	
        	////////////////////////
           	// RETURN CATEGORY
           	////////////////////////
        	document.querySelectorAll(`.${advanced_name}${advanced_symbol}container-grid-structure-container-subcategories-subcategories .${advanced_name}${advanced_symbol}container-grid-structure-button-return`).forEach((boton) => {
        		boton.addEventListener('click', (e) => {
        			e.preventDefault();
        			contenedorSubCategorias.classList.remove(_ADVANCED_NAME_ACTIVE);
        		});
        	});

        	if(btnCerrarMenu != null){
            	btnCerrarMenu.addEventListener('click', (e)=> {
            		e.preventDefault();
            		document.querySelectorAll(`.${advanced_name} ${_ADVANCED_NAME_ACTIVE}`).forEach((elemento) => {
            			elemento.classList.remove(_ADVANCED_NAME_ACTIVE);
            		});
            		document.querySelector('body').style.overflow = 'visible';
            	});
        	}

    	}
    }
}