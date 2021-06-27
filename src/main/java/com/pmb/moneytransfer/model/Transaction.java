package com.pmb.moneytransfer.model;

import com.pmb.moneytransfer.constants.TransactionType;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Data
public class Transaction {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer transactionId;
    private String description;
    private TransactionType transactionType;
    private Double amount;
    @ManyToOne (fetch = FetchType.LAZY)
    @JoinColumn(name="sender",nullable = false)
    private User sender;
    @ManyToOne (fetch = FetchType.LAZY)
    @JoinColumn(name="beneficiary",nullable = false)
    private User beneficiary;
}
