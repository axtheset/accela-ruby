module Accela
  class RecordRepository < Repository

    # def persist
    # end

    def self.find(id)
      new.find(id)
    end

    def find(id)
      payload = Accela::API::V4::GetRecords.call(id)
      record_hash = payload["result"].first
      record = Record.new
      update_from_hash(record, record_hash)
      record
    end

    private

    def prop_map
      {
        actualProductionUnit: :double,
        appearanceDate: :dateTime,
        appearanceDayOfWeek: :string,
        assignedDate: :dateTime,
        assignedToDepartment: :string,
        assignedUser: :string,
        balance: :double,
        booking: :boolean,
        closedByDepartment: :string,
        closedByUser: :string,
        closedDate: :dateTime,
        completeDate: :dateTime,
        completedByDepartment: :string,
        completedByUser: :string,
        completedDate: :dateTime,
        costPerUnit: :double,
        createdBy: :string,
        customId: :string,
        defendantSignature: :boolean,
        description: :string,
        enforceDepartment: :string,
        enforceUser: :string,
        enforceUserId: :string,
        estimatedCostPerUnit: :double,
        estimatedDueDate: :dateTime,
        estimatedProductionUnit: :double,
        estimatedTotalJobCost: :double,
        firstIssuedDate: :dateTime,
        housingUnits: :integer,
        id: :string,
        infraction: :boolean,
        initiatedProduct: :string,
        inPossessionTime: :double,
        inspectorDepartment: :string,
        inspectorId: :string,
        inspectorName: :string,
        jobValue: :double,
        misdemeanor: :boolean,
        module: :string,
        name: :string,
        numberOfBuildings: :integer,
        offenseWitnessed: :boolean,
        openedDate: :dateTime,
        overallApplicationTime: :double,
        publicOwned: :boolean,
        recordClass: :string,
        reportedDate: :dateTime,
        scheduledDate: :dateTime,
        serviceProviderCode: :string,
        shortNotes: :string,
        statusDate: :dateTime,
        totalFee: :double,
        totalJobCost: :double,
        totalPay: :double,
        trackingId: :integer,
        undistributedCost: :double,
        value: :string
      }
    end

  end
end
