require 'pry'
require_relative 'doctor.rb'
require_relative 'appointment.rb'

class Patient

    attr_reader :name
    
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all 
    end

    def new_appointment(date, doctor) #Make new Appt inst with patient = self, choose date and doctor
        Appointment.new(self, date, doctor)
    end

    def appointments #Return appointments that are tied to that patient
        Appointment.all.select do |appt| #Go through Appt.all, get ones where @patient = self via SELECT
            appt.patient == self
        end
    end

    def doctors #return doctors tied to that patient VIA the appointments they have scheduled (use the :appointments method), remember you are not going to see the same doctor all the time (ex. ER, gyno, derm)
        appointments.map do |appt| #Go thru all self-tied appts, return new arr of Drs from it 
            appt.doctor 
        end
    end
end

binding.pry