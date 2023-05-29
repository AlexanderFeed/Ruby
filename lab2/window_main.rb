require "fox16"
include Fox

class WindowMain < FXMainWindow
    def initialize(app)
        super(app, "Appa", width:500, height:500)
        tabber = FXTabBar.new(self)
        tab1 = FXTabItem.new(tabber, "Tab 1")
        tab2 = FXTabItem.new(tabber, "Tab 2")
        tab3 = FXTabItem.new(tabber, "Tab 3")
    end
    def create()
        super
        show(PLACEMENT_SCREEN)
    end
end