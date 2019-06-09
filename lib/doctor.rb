require 'pry'
require_relative 'patient.rb'
require_relative 'appointment.rb'

# A doctor has many patients 
# A doctor has many appointments
# A patient has many doctors??
#A paitent has many appointments??
# Appointments only have 1 pt involved
# Appointments only have 1 Dr involved??
# 
#
#



class Doctor

    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end
    
    def self.all
        @@all
    end

    def new_appointment(patient, date) #Appt date(str), pt (pt_inst), Dr(Dr_inst)
        Appointment.new(patient, date, self)
    end

    def appointments #Return list of appointments that doctor(self) has scheduled
        Appointment.all.select {|appt| appt.doctor == self} #Srch all appt_objs, rtrn arr of ones whose @doctor == Dr_inst
    end

    def patients #All patients doctor seeing in appointments today
        appointments.map do |dr_appointment| #Srch all appt_objs with @doctor == self
            dr_appointment.patient #Rtrn new arr of patient objs tied that dr. (via dr_appointments)
        end
    end

end

d1 = Doctor.new("Dr. Mario")
p1 = Patient.new("Toadette")

binding.pry