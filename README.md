# e-DiagnosticPro

A Java web application for managing patient intake and clinical record handling in a healthcare environment. The project is designed around a nurse-led workflow where medical staff can log in, register patients, record baseline vital signs, and organize patient information in a simple dashboard.

## Project overview

This system was built as a hospital management prototype using Java EE, JSP, Servlets, Hibernate, and MySQL. It focuses on the early stages of patient management, especially the intake process and the patient list used by nurses.

The application includes:

- Nurse login and session-based access
- Patient registration form with personal information
- Vital sign collection such as blood pressure, heart rate, temperature, respiratory rate, height, and weight
- Patient dashboard for viewing registered patients
- Persistence layer with JPA/Hibernate models mapped to a MySQL database
- Role-based entity structure for medical staff and patient-related records

## Technology stack

- Java 17
- Maven
- Jakarta Servlet / JSP
- Hibernate ORM
- MySQL
- JPA
- BCrypt for password validation

## Project structure

```text
.
├── pom.xml
├── README.md
├── SQLCode/
│   └── sql.sql
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── org/example/
│   │   │       ├── Controllers/
│   │   │       ├── Models/
│   │   │       ├── dao/
│   │   │       ├── database/
│   │   │       └── enums/
│   │   ├── resources/
│   │   │   └── META-INF/
│   │   └── webapp/
│   └── test/
└── target/
```

## Main features

### Nurse workflow
The application starts with a login page. After authentication, the nurse can proceed to a patient intake form and create a new patient record.

### Patient intake form
The intake form collects:

- Full name
- Email
- Phone number
- Social ID / national identifier
- Health insurance detail
- Blood pressure
- Heart rate
- Body temperature
- Respiratory rate
- Weight
- Height

This information is attached to the nurse who created the record.

### Patient management view
The application includes a patient listing page for reviewing registered patients, which is the core dashboard for medical staff.

### Data model
The database schema includes entities for:

- Person
- Patient
- Consultation
- ExpertiseRequest
- MedicalHistory
- MedicalProcedure

## Database setup

1. Create a MySQL database.
2. Import the SQL script from `SQLCode/sql.sql`.
3. Make sure your database connection credentials match the configuration in `src/main/resources/META-INF/persistence.xml`.

The default configuration uses:

- URL: jdbc:mysql://localhost:3306/medical_system
- User: root
- Password: empty string

If your local MySQL setup uses different credentials, update the persistence configuration before running the app.

## Running the project

### Prerequisites

- JDK 17 or newer
- Maven
- MySQL server
- A Java web server such as Tomcat

### Build the project

```bash
mvn clean package
```

### Deploy locally

Deploy the generated WAR file to your servlet container, or run it in a local Tomcat environment configured for Java web applications.

## Example workflow

1. Open the application in the browser.
2. Log in as a nurse.
3. Access the patient intake page.
4. Fill in the patient information and vital signs.
5. Submit the form.
6. Review the patient list in the dashboard.

## Notes

This project is a functional academic / prototype healthcare management application. It demonstrates how a Java-based medical information system can be structured around JPA entities, servlet controllers, and JSP pages.

## License

This project is for educational and demonstration purposes.

