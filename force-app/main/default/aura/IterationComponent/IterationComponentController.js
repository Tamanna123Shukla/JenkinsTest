({
    init: function(component, event, helper) {
        debugger;
        $A.createComponents(
        [
            [
                "lightning:select", { label: "Select List", name: "list1"}
            ],
            [
                "option", { value: "Option 1", label: "Option 1" }
            ],
            [
                "option", { value: "Option 2", label: "Option 2" }
            ]
        ],
            function(components) {
                var body = component.get("v.body");  
               // body.push(newButton);
               components[0].set("v.body", [components[1], components[2]]);
               // component.set("v.body", components[0]);
               body.push(components[0]);
                component.set("v.body", body);

            }

        );
    }
})