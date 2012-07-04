Array.prototype.collect = function(method){
    var index = this.length;
    var new_array = [];
    for(i=0 ; i<index ; i++){
        new_array[i] = method(this[i]);
    };
    return new_array;
};


names = ['oleg', 'anton', 'ivan', 'ryan', 'natasha']

funkify = function() {
    this+"io"
}

funky_names = names.collect(funkify)