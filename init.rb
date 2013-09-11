require 'redmine'
require 'private_note_enforcement/hooks'

Redmine::Plugin.register :private_note_enforcement do
  name 'Private Note Enforcement'
  description 'Add support for private note enforcement using roles.'
  author 'Marian'
  author_url 'mailto:marian@gosign.de'
  version '0.0.1'
  #url ''
  requires_redmine :version_or_higher => '2.2.0'

  project_module :issue_tracking do
    permission :create_public_notes, { }
  end
end
