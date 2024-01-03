package com.example.springdatajpasample.repository

import com.example.springdatajpasample.entity.Article
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.stereotype.Repository

@Repository
interface ArticleRepository : JpaRepository<Article, Long> {
    @Query("SELECT a from Article a LEFT JOIN FETCH a._author")
    fun findAllByIdWithRelatedEntity(): List<Article>
}