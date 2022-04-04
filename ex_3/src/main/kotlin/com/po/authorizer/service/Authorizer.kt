package com.po.authorizer.service

import com.po.authorizer.model.User
import com.po.authorizer.repository.UserRepository
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

@Service
class Authorizer @Autowired constructor(val userRepository: UserRepository) {

    fun register(user: User): User {
        return userRepository.save(user)
    }

    fun login(name: String, password: String): User? {
        return userRepository.findBynameAndPassword(name, password)
    }

    fun logout(name: String): User? {
        return userRepository.findByname(name)
    }
}
