package com.po.authorizer.model

import javax.persistence.*

@Entity
class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    val id: Long = 0

    @Column(unique = true)
    val email: String = ""

    @Column(unique = true)
    val name: String = ""

    @Column
    val password: String = ""
}
