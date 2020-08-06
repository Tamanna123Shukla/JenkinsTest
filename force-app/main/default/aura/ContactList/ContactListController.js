({
	
		doInit : function(component, event) {
            debugger;
            var action = component.get("c.allContact");
            console.log(action);
        action.setCallback(this, function(a) {
            component.set("v.itemstoRepeat", a.getReturnValue());
            console.log(a.getReturnValue());
        });
       $A.enqueueAction(action);
    },
     openModel: function(component, event, helper) {
      // for Display Model,set the "isOpen" attribute to "true"
      component.set("v.isOpen", true);
   },
     editpage : function(component, event) {
    
    
       var idx = event.target.getAttribute('data-index');
       // var contact = component.get("v.contact")[idx];
       /* var navEvent = $A.get("e.force:navigateToSObject");
        if(navEvent){
            navEvent.setParams({
                  recordId: contact.Id,
                  slideDevName: "detail"
            });
            navEvent.fire(); 
        }  */
          window.location.href = 'https://tanna-dev-ed.my.salesforce.com/'+idx;
    }
         
        
    
   
	
})