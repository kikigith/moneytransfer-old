package com.pmb.moneytransfer.model;

import lombok.Data;
import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import java.util.List;

@Entity
@Data
public class User extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private String id;
    @NotBlank(message = "the field firstname is mandatory")
    private String firstname;
    @NotBlank(message = "field lastname is mandatory")
    private String lastname;
    @Email(message = "please enter a valid email address")
    private String email;
    private String password;
    @OneToMany(
            mappedBy = "connection",
            cascade = CascadeType.ALL,
            fetch = FetchType.LAZY
    )
    List<User> connections;

    @OneToMany(
            mappedBy = "sender",
            cascade = CascadeType.ALL,
            fetch = FetchType.LAZY
    )
    private List<Transaction> transactionsSent;

    @OneToMany(
            mappedBy = "beneficiary",
            cascade = CascadeType.ALL,
            fetch =FetchType.LAZY
    )
    private List<Transaction> transactionsReceived;
    @ManyToOne @JoinColumn(name = "connection_id")
    private User connection;

}
