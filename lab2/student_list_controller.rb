require_relative "student_list"
class StudentsListController
    ### GENERATED
    private attr_reader :window, :list

    ### INITIALIZE
    private

    def initialize(view)
        @window = view
        @list = StudentsList.new_db()
    end
end