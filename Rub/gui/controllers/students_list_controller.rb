require_relative "../../collections/students_list.rb"
require_relative "../../collections/data_list_student_short.rb"
require_relative "../windows/window_main.rb"

class StudentsListController
    ### GENERATED
    private attr_reader :window
    private attr_accessor :list_short
    public attr_reader :list

    ### INITIALIZE
    private

    def initialize(view)
        @window = view
        @list = StudentsList.new_db()
    end

    ### PUBLIC OBJECT METHODS
    public

    def refresh_data()
        if self.list_short == nil
            self.list_short = self.list.get_k_n_student_short_list(window.page, window.elements_by_page)
        else
            self.list.get_k_n_student_short_list(window.page, window.elements_by_page, self.list_short)
        end

        self.list_short.notify(window.students_list_view.table_region.table)

        self.list.notify(window.students_list_view.table_region)
    end

    def create_student_window()
        win = FXBWindowStudent.new(window.app, window)
        win.create
    end

    def update_selection(start, finish)
        self.list_short.clear_selection()
        if start != -1
            (start..finish).each { |index|
                self.list_short.select(index)
            }
        end
    end

    def delete_selected_students()
        ids = self.list_short.get_selected()
        ids.each { |id|
            self.list.remove_student(id)
        }
        self.list_short.clear_selection()
        refresh_data()
    end
end