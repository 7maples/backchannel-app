BackchannelApp = {
  displayItem : function(itemId) {
    $.getJSON('/Item/' + itemID, BackchannelApp.renderItem);
  },
};
