package vn.edu.hcmute.fit.web.web_t3;

public class Users {
    private String firstName;
    private String lastName;
    private String email;
    private String dob;
    private String hearAbout;
    private boolean receiveCds;
    private boolean receiveEmails;
    private String contactBy;

    // Constructor mặc định
    public Users() {}

    // Getter & Setter cho firstName
    public String getFirstName() {
        return firstName;
    }
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    // Getter & Setter cho lastName
    public String getLastName() {
        return lastName;
    }
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    // Getter & Setter cho email
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    // Getter & Setter cho dob
    public String getDob() {
        return dob;
    }
    public void setDob(String dob) {
        this.dob = dob;
    }

    // Getter & Setter cho hearAbout
    public String getHearAbout() {
        return hearAbout;
    }
    public void setHearAbout(String hearAbout) {
        this.hearAbout = hearAbout;
    }

    // Getter & Setter cho receiveCds
    public boolean isReceiveCds() {
        return receiveCds;
    }
    public void setReceiveCds(boolean receiveCds) {
        this.receiveCds = receiveCds;
    }

    // Getter & Setter cho receiveEmails
    public boolean isReceiveEmails() {
        return receiveEmails;
    }
    public void setReceiveEmails(boolean receiveEmails) {
        this.receiveEmails = receiveEmails;
    }

    // Getter & Setter cho contactBy
    public String getContactBy() {
        return contactBy;
    }
    public void setContactBy(String contactBy) {
        this.contactBy = contactBy;
    }
}

