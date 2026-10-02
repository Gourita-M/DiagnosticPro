CREATE DATABASE IF NOT EXISTS medical_system;

USE medical_system;

CREATE TABLE Person (
    id INT NOT NULL AUTO_INCREMENT,
    fullName VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('NURSE', 'PRACTITIONER', 'SPECIALIST') NOT NULL,

    PRIMARY KEY (id),
    UNIQUE KEY uk_person_email (email)
)

CREATE TABLE Patient (
    id INT NOT NULL AUTO_INCREMENT,
    fullName VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phoneNumber VARCHAR(30) DEFAULT NULL,
    socialNumber VARCHAR(100) DEFAULT NULL,
    healthInsurance boolean DEFAULT NULL,

    bloodPressure INT DEFAULT NULL,
    heartRate INT DEFAULT NULL,
    bodyTemperature INT DEFAULT NULL,
    respiratoryRate INT DEFAULT NULL,
    weight INT DEFAULT NULL,
    height INT DEFAULT NULL,

    nurse_id INT NOT NULL,

    PRIMARY KEY (id),
    UNIQUE KEY uk_patient_email (email),

    CONSTRAINT fk_patient_person
        FOREIGN KEY (nurse_id)
        REFERENCES Person(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE

)

CREATE TABLE Consultation (
    id INT NOT NULL AUTO_INCREMENT,
    reason VARCHAR(500) DEFAULT NULL,
    observations TEXT DEFAULT NULL,
    diagnosis TEXT DEFAULT NULL,
    cost DECIMAL(10,2) DEFAULT NULL,

    status ENUM('OPEN', 'PENDING', 'COMPLETED') NOT NULL,

    practitioner_id INT NOT NULL,

    PRIMARY KEY (id),

    CONSTRAINT fk_consultation_person
        FOREIGN KEY (practitioner_id)
        REFERENCES Person(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE

)

CREATE TABLE ExpertiseRequest (
    id INT NOT NULL AUTO_INCREMENT,

    question TEXT NOT NULL,

    priority ENUM(
        'URGENT',
        'NORMAL',
        'NON_URGENT'
    ) NOT NULL,

    status ENUM(
        'PENDING',
        'COMPLETED'
    ) NOT NULL,

    specialist_id INT NOT NULL,

    PRIMARY KEY (id),

    CONSTRAINT fk_expertise_person
        FOREIGN KEY (specialist_id)
        REFERENCES Person(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE

)

CREATE TABLE MedicalHistory (
    id INT NOT NULL AUTO_INCREMENT,

    name VARCHAR(255) NOT NULL,

    currentTreatments TEXT DEFAULT NULL,

    state ENUM('FINISHED') NOT NULL,

    patient_id INT NOT NULL,

    PRIMARY KEY (id),

    CONSTRAINT fk_history_patient
        FOREIGN KEY (patient_id)
        REFERENCES Patient(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE

) 

CREATE TABLE MedicalProcedure (
    id INT NOT NULL AUTO_INCREMENT,

    type ENUM(
        'XRAY',
        'ULTRASOUND',
        'MRI',
        'ECG',
        'BLOOD_TEST',
        'URINE_TEST'
    ) NOT NULL,

    cost DECIMAL(10,2) DEFAULT NULL,

    consultation_id INT NOT NULL,

    PRIMARY KEY (id),

    CONSTRAINT fk_procedure_consultation
        FOREIGN KEY (consultation_id)
        REFERENCES Consultation(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE

)