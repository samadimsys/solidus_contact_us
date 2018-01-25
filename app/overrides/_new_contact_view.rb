Deface::Override.new(:virtual_path => 'spree/contact_us/contacts/new',
                     :name => 'new_contact_view_if_name',
                     :sequence => 1,
                     :remove => "erb[silent]:contains('if SolidusContactUs.require_name')",
                     :closing_selector => "erb[silent]:contains('end')"
)

Deface::Override.new(:virtual_path => 'spree/contact_us/contacts/new',
                     :name => 'new_contact_view_if_subject',
                     :sequence => 2,
                     :remove => "erb[silent]:contains('if SolidusContactUs.require_subject')",
                     :closing_selector => "erb[silent]:contains('end')"
)

Deface::Override.new(:virtual_path => 'spree/contact_us/contacts/new',
                     :name => 'new_contact_view_form',
                     :sequence => 3,
                     :replace => "erb[loud]:contains('form_for')",
                     :closing_selector => "erb[silent]:contains('end')",
                     :partial => 'spree/shared/contact_us'
)
