package com.po.authorizer.api

import com.po.authorizer.model.User
import com.po.authorizer.model.UserNotFoundException
import com.po.authorizer.service.Authorizer
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/authorizer")
class AuthorizerController @Autowired constructor(val authorizer: Authorizer) {

    @PostMapping("/register")
    fun register(@RequestBody user: User): User {
        return authorizer.register(user)
    }

    @GetMapping("/login")
    fun login(@RequestParam("name") name: String, @RequestParam("password") password: String): User {
        return authorizer.login(name, password) ?: throw UserNotFoundException()
    }

    @GetMapping("/logout")
    fun logout(@RequestParam("name") name: String): User {
        return authorizer.logout(name) ?: throw UserNotFoundException()
    }
}
