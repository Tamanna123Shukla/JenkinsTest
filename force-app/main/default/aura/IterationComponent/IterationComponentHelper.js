({
	PicklistOptionMethod : function(component,event,helper) {
		 var action = component.get("c.getAccountList");
              action.setCallback(this, function(response) {
            var state = response.getState();
                       if (state === "SUCCESS") {
                           // alert("From server: " + response.getReturnValue());
                           console.log(response.getReturnValue());
                       }
              });
          $A.enqueueAction(action);

   

	}
})