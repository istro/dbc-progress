Array.prototype.each = function(callbyname){
    var length = this.length;
    for (var i=0; i<length; i++) {
        callbyname(this[i]);
    }
};

say_hi = function(item) {
    alert("hi "+item);
};

at_this_table = ['oleg', 'ivan', 'ryan', 'natasha'];

at_this_table.each(say_hi);