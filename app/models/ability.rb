# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user) 
    return unless user.present?

    if user.admin?
      can :read, Patient
      can :manage, Doctor
      can :manage, Admin
      can :manage, Category
      can :read, Appointment
    end

    if user.doctor?
      can :read, Patient
      can [:read, :update], Doctor
      can :read, Category
      can [:read, :update], Appointment

      cannot :manage, Admin
    end

    if user.patient?
      can :read, Patient
      can :read, Doctor
      can :read, Category
      can [:create, :read], Appointment

      cannot :manage, Admin
    end
  end
end
