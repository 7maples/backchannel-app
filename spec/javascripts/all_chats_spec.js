describe("AllChats", function() {
  it("retrieves all chat items", function() {
    spyOn($, 'getJSON');

    var itemId = 1;
    BackchannelApp.displayItem(itemId);

    expect($.getJSON).toHaveBeenCalledWith('/Chats/' + itemId, jasmine.any(Function));
  });
});
