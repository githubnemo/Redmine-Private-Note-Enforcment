module RedmineComments
  class Hooks < Redmine::Hook::ViewListener

    # Issue edited / post added
    #
    # Editing of post is handled in controller_journals_edit_post,
    # so we can be sure that we have a change here. What we're
    # not sure of is whether there is a new note or not.
    #
    # Force note to be private if the user can't create public notes.
    #
    def controller_issues_edit_before_save(context)
    	#context: { :params => params, :issue => self, :time_entry => @time_entry, :journal => @current_journal}
        return if context[:journal][:notes].blank?
        return if User.current.allowed_to?(:create_public_notes, context[:issue].project)

        context[:journal].private_notes = true
    end
  end
end

