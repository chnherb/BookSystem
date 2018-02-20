/**
 * 入口JS
 *
 */
require(['jquery', 'app/structure'], function($, structure){
    structure.initialize();
    $(window).resize(function() {
        structure.adjustment();
    });
});


require(['app/splitButton'], function(splitButton){
    //console.log(splitButton);
    splitButton.setAlign('right');
});

require(['app/groupButton'], function(groupButton){
    groupButton.tabs({
        callback: function(index){
            console.log(index);
        }
    });
});
