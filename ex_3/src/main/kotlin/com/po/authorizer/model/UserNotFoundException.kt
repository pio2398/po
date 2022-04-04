package com.po.authorizer.model

import org.springframework.http.HttpStatus
import org.springframework.web.bind.annotation.ResponseStatus

@ResponseStatus(code = HttpStatus.NOT_FOUND, reason = "user_not_found")
class UserNotFoundException : RuntimeException()
