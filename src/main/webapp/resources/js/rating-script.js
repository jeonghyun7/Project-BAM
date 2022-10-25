// Star Raiting
function itemRatting() {
    $.fn.duplicate = function (a, b) {
        var c = [];
        for (var d = 0; d < a; d++) $.merge(c, this.clone(b).get());
        return this.pushStack(c);
    };
    var cr = $(".item-ratting");
    cr.each(function (cr) {
        var starCount = $(this).attr("data-star-rating");
        $("<i class='la la-star'></i>").duplicate(starCount).prependTo(this);
    });
}