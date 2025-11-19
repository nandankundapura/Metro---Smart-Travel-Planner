package com.xworkz.metro.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import javax.persistence.*;

@Entity
@Table(name = "smart_cards_info")
@Data
@NoArgsConstructor
@AllArgsConstructor
@NamedQuery(name = "getAllSmartCardEntity",query = "Select a from SmartCardEntity a")
// Add this NamedQuery to your SmartCardEntity
@NamedQuery(name = "getCardByEmail", query = "SELECT s FROM SmartCardEntity s WHERE s.email = :email")
public class SmartCardEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "cardId")
    private Long cardId;

    @Column(name = "email")
    private String email;

    @Column(name = "full_name")
    private String fullName;

    @Column(name = "phone_number")
    private String phone;

    @Column(name = "card_type")
    private String cardType;

    @Column(name = "id_proof_type")
    private String idProofType;

    @Column(name = "id_proof_number")
    private String idProofNumber;

    @Column(name = "status")
    private String status = "PENDING"; // PENDING, APPROVED, REJECTED

}