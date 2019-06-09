require_relative 'patient.rb'
require_relative 'doctor.rb'

class Appointment

    @@all = []

    attr_accessor :date, :patient, :doctor

    def initialize(patient, date, doctor)
        @patient, @date, @doctor = patient, date, doctor
        @@all << self #Add any new instances to list of ALL Appt insts
    end

    def self.all
        @@all
    end

end

binding.pry