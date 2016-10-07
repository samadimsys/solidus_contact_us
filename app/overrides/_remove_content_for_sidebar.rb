Deface::Override.new(:virtual_path => 'spree/contact_us/contacts/new',
                     :name => 'remove_content_for_sidebar',
                     :sequence => 1,
                     :remove => "erb[silent]:contains('if')",
                     :original => "if 'products' == @current_controller && @taxon ') %>",
                     :closing_selector => "erb[silent]:contains('end')")

Deface::Override.new(:virtual_path => 'spree/contact_us/contacts/new',
                     :name => 'remove_content_for_sidebar_2',
                     :sequence => 2,
                     :remove => "erb[silent]:contains('content_for :sidebar')",
                     :closing_selector => "erb[silent]:contains('end')")