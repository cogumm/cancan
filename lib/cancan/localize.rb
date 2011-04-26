# localize.rb modified 3Reis.com.br
#
# localize will pick up custom messages from here e.g.
# en:
#   cancan:
#     not_allowed: "Youre not welcome here!"
#     person: "You can not access this person!"
#     profile:
#       update: "You can not edit this profile."
#       show: "You cannot view this profile."
#       index: "You are not authorised to see peoples profiles"
#
# 
# @person = Person.find(params[:id])
# @profile = Profile.first
# 
# CanCan::AccessDenied.new('not_allowed') => "Youre not welcome here!"
# CanCan::AccessDenied.new(nil, nil, @person) => "You can not access this person!"
# CanCan::AccessDenied.new(nil, :show, @profile) => "You cannot view this profile."
# CanCan::AccessDenied.new(nil, :index, Profile) => "You are not authorised to see peoples profiles"
# 
module CanCan
  module Localize
    module AccessDenied
 
      def self.included(base)
        
        I18n.load_path = I18n.load_path + Dir[ File.expand_path( File.dirname(__FILE__) + '/../../locales') + '/*.{rb,yml}' ] 
        base.class_eval do

          def initialize_with_i18n(message = nil, action = nil, subject = nil)
            
            if subject.is_a?(ActiveRecord::Base)
              i18n_subject = subject.class.name.underscore
            elsif subject.is_a?(Class)
              i18n_subject = subject.name.underscore
            elsif subject.is_a?(String) || subject.is_a?(Symbol)
              i18n_subject = subject
            end

            @default_message = I18n.translate( :default, :default => 'You are not authorized to access that page.', :scope => 'cancan' )
            
            #default_lookup = [i18n_subject, action].compact.join('.')
            #default = default_lookup.empty? ? nil : [default_lookup.to_sym]
            
            begin
              #message = I18n.translate( message , :default => default, :scope => 'cancan' )
              message = I18n.translate( action , :default => @default_message, :scope => 'cancan', :model => I18n.translate("activerecord.models.#{i18n_subject}.other").downcase)
            rescue I18n::MissingTranslationData
            ensure
              initialize_without_i18n(message, action, subject)
            end
          end
          alias_method_chain :initialize, :i18n
        end
      end
    end
  end

  AccessDenied.send(:include, Localize::AccessDenied)
end


