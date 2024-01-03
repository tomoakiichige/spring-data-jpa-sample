package com.example.springdatajpasample.entity

import com.fasterxml.jackson.annotation.JsonIgnore
import jakarta.persistence.*
import java.lang.Exception
import java.time.Instant

@Entity
data class Article(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Long = 0,
    var slug: String,
    var title: String,
    var description: String,
    var body: String,
    @Column(name = "author_id")
    var authorId: Long,
    var isPublished: Boolean,
    val createdAt: Instant = Instant.now(),
    val updatedAt: Instant = Instant.now(),
) {
    // プロパティアクセスがなくても、なぜかUser取得のSQL文が発行されてしまう
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "author_id", insertable = false, updatable = false)
    private val _author: User? = null
    val author: User
        @JsonIgnore
        get() = _author ?: throw Exception()
}
