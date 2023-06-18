require "fox16"
include Fox

class FXBButtonsRegion
    ### GENERATED
    private attr_writer :btn_create, :btn_change, :btn_delete, :btn_update
    public attr_reader :btn_create, :btn_change, :btn_delete, :btn_update

    public attr_accessor :parent

    ### INITIALIZE
    private

    def initialize(column, par)
        self.parent = par
        self.btn_create = FXButton.new(column, "Добавить", opts:LAYOUT_FILL_X|FRAME_SUNKEN|FRAME_THICK)
        self.btn_change = FXButton.new(column, "Изменить", opts:LAYOUT_FILL_X|FRAME_SUNKEN|FRAME_THICK)
        self.btn_delete = FXButton.new(column, "Удалить", opts:LAYOUT_FILL_X|FRAME_SUNKEN|FRAME_THICK)
        self.btn_update = FXButton.new(column, "Обновить", opts:LAYOUT_FILL_X|FRAME_SUNKEN|FRAME_THICK)
        self.btn_change.disable()
        self.btn_delete.disable()
    end

    ### PUBLIC OBJECT METHODS
    public

    def table_selection_reaction(table)
        table.connect(SEL_COMMAND) { |sender, sel, data|
            dist = table.selEndRow - table.selStartRow
            if table.selStartRow == -1
                self.btn_change.disable()
                self.btn_delete.disable()
            elsif dist > 0
                self.btn_change.disable()
                self.btn_delete.enable()
            elsif dist == 0
                self.btn_change.enable()
                self.btn_delete.enable()
            end

            self.parent.parent.controller.update_selection(table.selStartRow, table.selEndRow)
        }
    end
end