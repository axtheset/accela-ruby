module Accela
  class RecordTranslator < Translator

    def translation
      [
        [:addresses, :addresses, [:Address]],
        [:parcels, :parcels, [:Parcel]],
        [:owners, :owners, [:Owner]],
        [:actual_production_unit, :actualProductionUnit, :double],
        [:appearance_date, :appearanceDate, :dateTime],
        [:appearance_day_of_week, :appearanceDayOfWeek, :string],
        [:assigned_date, :assignedDate, :dateTime],
        [:assigned_to_department, :assignedToDepartment, :string],
        [:assigned_user, :assignedUser, :string],
        [:balance, :balance, :double],
        [:booking, :booking, :boolean],
        [:closed_by_department, :closedByDepartment, :string],
        [:closed_by_user, :closedByUser, :string],
        [:closed_date, :closedDate, :dateTime],
        [:complete_date, :completeDate, :dateTime],
        [:completed_by_department, :completedByDepartment, :string],
        [:completed_by_user, :completedByUser, :string],
        [:completed_date, :completedDate, :dateTime],
        [:contacts, :contacts, [:Contact]],
        [:cost_per_unit, :costPerUnit, :double],
        [:created_by, :createdBy, :string],
        [:custom_id, :customId, :string],
        [:defendant_signature, :defendantSignature, :boolean],
        [:description, :description, :string],
        [:enforce_department, :enforceDepartment, :string],
        [:enforce_user, :enforceUser, :string],
        [:enforce_user_id, :enforceUserId, :string],
        [:estimated_cost_per_unit, :estimatedCostPerUnit, :double],
        [:estimated_due_date, :estimatedDueDate, :dateTime],
        [:estimated_production_unit, :estimatedProductionUnit, :double],
        [:estimated_total_job_cost, :estimatedTotalJobCost, :double],
        [:first_issued_date, :firstIssuedDate, :dateTime],
        [:housing_units, :housingUnits, :integer],
        [:id, :id, :string],
        [:infraction, :infraction, :boolean],
        [:initiated_product, :initiatedProduct, :string],
        [:in_possession_time, :inPossessionTime, :double],
        [:inspector_department, :inspectorDepartment, :string],
        [:inspector_id, :inspectorId, :string],
        [:inspector_name, :inspectorName, :string],
        [:job_value, :jobValue, :double],
        [:misdemeanor, :misdemeanor, :boolean],
        [:module, :module, :string],
        [:name, :name, :string],
        [:number_of_buildings, :numberOfBuildings, :integer],
        [:offense_witnessed, :offenseWitnessed, :boolean],
        [:opened_date, :openedDate, :dateTime],
        [:overall_application_time, :overallApplicationTime, :double],
        [:public_owned, :publicOwned, :boolean],
        [:record_class, :recordClass, :string],
        [:reported_date, :reportedDate, :dateTime],
        [:scheduled_date, :scheduledDate, :dateTime],
        [:service_provider_code, :serviceProviderCode, :string],
        [:short_notes, :shortNotes, :string],
        [:status_date, :statusDate, :dateTime],
        [:total_fee, :totalFee, :double],
        [:total_job_cost, :totalJobCost, :double],
        [:total_pay, :totalPay, :double],
        [:tracking_id, :trackingId, :integer],
        [:type, :type, :Type],
        [:undistributed_cost, :undistributedCost, :double],
        [:value, :value, :string]
      ]
    end

  end
end
