require 'cancan/ability'
require 'cancan/can_definition'
require 'cancan/controller_resource'
require 'cancan/controller_additions'
require 'cancan/active_record_additions'
require 'cancan/exceptions'
require 'cancan/query'
require 'cancan/inherited_resource'
# i18n
require 'cancan/localize' if Object.const_defined?('I18n')
