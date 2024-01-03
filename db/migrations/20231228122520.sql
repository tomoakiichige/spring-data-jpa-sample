-- user
INSERT INTO user (id, email, password, username, bio, image)
    VALUES (1, "a@example.com", "jbnsurt", "user_a", "foo", null);
INSERT INTO user (id, email, password, username, bio, image)
    VALUES (2, "b@example.com", "jbnsurt", "user_b", "foo", "https://example.com");
INSERT INTO user (id, email, password, username, bio, image)
    VALUES (3, "c@example.com", "jbnsurt", "user_c", "foo", null);
INSERT INTO user (id, email, password, username, bio, image)
    VALUES (4, "d@example.com", "jbnsurt", "user_d", "foo", "https://example.com");
    
-- article
INSERT INTO article (id, slug, title, description, body, author_id, is_published)
    VALUES (1, "aaaa", "title1", "", "", 1, 1);
INSERT INTO article (id, slug, title, description, body, author_id, is_published)
    VALUES (2, "bbbb", "title2", "", "", 1, 1);
INSERT INTO article (id, slug, title, description, body, author_id, is_published)
    VALUES (3, "cccc", "title3", "", "", 1, 0);
INSERT INTO article (id, slug, title, description, body, author_id, is_published)
    VALUES (4, "dddd", "title4", "", "", 1, 0);
INSERT INTO article (id, slug, title, description, body, author_id, is_published)
    VALUES (5, "eeee", "title5", "", "", 2, 1);
INSERT INTO article (id, slug, title, description, body, author_id, is_published)
    VALUES (6, "ffff", "title6", "", "", 2, 1);
INSERT INTO article (id, slug, title, description, body, author_id, is_published)
    VALUES (7, "gggg", "title7", "", "", 2, 0);
INSERT INTO article (id, slug, title, description, body, author_id, is_published)
    VALUES (8, "hhhh", "title8", "", "", 2, 0);

-- comment
INSERT INTO comment (id, body, author_id, article_id)
    VALUES (1, "comment1", 3, 1);
INSERT INTO comment (id, body, author_id, article_id)
    VALUES (2, "comment2", 3, 1);

-- tag
INSERT INTO tag (id, name)
    VALUES (1, "tag1");
INSERT INTO tag (id, name)
    VALUES (2, "tag2");
INSERT INTO tag (id, name)
    VALUES (3, "tag3");
INSERT INTO tag (id, name)
    VALUES (4, "tag4");
    
-- article_tag
INSERT INTO article_tag (article_id, tag_id)
    VALUES (1, 1);
INSERT INTO article_tag (article_id, tag_id)
    VALUES (1, 2);
INSERT INTO article_tag (article_id, tag_id)
    VALUES (2, 3);
INSERT INTO article_tag (article_id, tag_id)
    VALUES (2, 4);
    
-- article_favorite
INSERT INTO article_favorite (article_id, user_id)
    VALUES (1, 3);
INSERT INTO article_favorite (article_id, user_id)
    VALUES (1, 4);
INSERT INTO article_favorite (article_id, user_id)
    VALUES (3, 2);
INSERT INTO article_favorite (article_id, user_id)
    VALUES (3, 4);

-- follow
INSERT INTO follow (follower_id, followed_id)
    VALUES (1, 2);
INSERT INTO follow (follower_id, followed_id)
    VALUES (3, 2);
