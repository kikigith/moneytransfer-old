package com.pmb.moneytransfer.model;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
public class Connection {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="main_user", nullable=false)
    private User mainUser;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="connecte_user", nullable=false)
    private User connectedUser;

}
