package com.po.authorizer.repository

import com.po.authorizer.model.User
import org.springframework.data.repository.CrudRepository
import org.springframework.lang.Nullable

interface UserRepository : CrudRepository<User, Int> {
    @Nullable
    fun findBynameAndPassword(name: String, password: String): User

    @Nullable
    fun findByname(name: String): User
}
