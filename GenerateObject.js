var component;
var sprite;

function createObject(parent,file,properties) {
    component = Qt.createComponent(file);
    if(component.status === Component.Ready)
        finishCreation(parent,properties);
    else
        component.statusChanged.connect(finishCreation(parent,properties));
    return sprite;
}

function finishCreation(parent,properties) {
    if(component.status=== Component.Ready) {
        sprite = component.createObject(parent,properties);
        if(sprite === null)
            console.log("Error in creating Object");
    }
    else if(component.status === Component.Error) {
        console.log("Error during component creation: "+component.errorString());
    }
}
