Array.prototype.count = function(countselected) {
    length = this.length;
    var counter = 0;
    if (typeof countselected == "function") {
        for (var i=0; i<length; i++) {
            if (countselected(this[i])) {
                counter++
            };
        }
    }
    return counter;
};

countevens = function(number) {
    return number%2 === 0;
};

var test1 = [1, 2, 3, 4, -1];

var test2 = [1,2,3,4,'foo'];

var test3 = [];

var test4 = [1, 2, 3, 4];

console.log('TEST 1');
console.log(test1.count(countevens));

console.log('TEST 2');
console.log(test2.count(countevens));

console.log('TEST 3');
console.log(test3.count(countevens));

console.log('TEST 4');
console.log(test4.count());