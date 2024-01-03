package com.example.springdatajpasample.controller

import com.example.springdatajpasample.entity.User
import com.example.springdatajpasample.repository.ArticleRepository
import com.example.springdatajpasample.repository.UserRepository
import org.springframework.transaction.annotation.Transactional
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@RestController
class TestController(
    val userRepository: UserRepository,
    val articleRepository: ArticleRepository
) {
    @GetMapping("/")
    @Transactional
    fun test(): List<User> {
        val user = userRepository.findByIdForUpdate(100)
        println(user)
        if (user != null) {
            user.bio += "1"
            userRepository.save(user)
        }
        return userRepository.findAll()
    }

    @GetMapping("/article")
    @Transactional
    fun article(): List<ArticleResponse> {
        val articles = articleRepository.findAll()
        val authorIds = articles.map { it.authorId }
        val users = userRepository.findAllById(authorIds).associateBy { it.id }
        return articles.map {
            ArticleResponse(
                id = it.id,
                title = it.title,
                username = users.getValue(it.authorId).username
            )
        }
    }
}

data class ArticleResponse(
    val id: Long,
    val title: String,
    val username: String
)