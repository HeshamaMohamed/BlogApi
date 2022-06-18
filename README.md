## Creating a simple API for a blog application.

A brief explanation:  
We want to be able to register an account and sign in. (Users authenticated via JWT)  
We shall provide RESTful API for posts/comments/tags  
Users will be able to create their own posts, comment on any other post.  
Only post/comment author is able to delete/edit his own post.  
Users need to sign-in to see any content on the blog.



# Environment:
- Ruby v2.5.1
- Rails v5.2.3
- Mysql v8.0
- Redis v4.2
- Sidekiq v6.4.1
- Docker v20.10.14














## Run Locally

Clone the project

```bash
git clone https://github.com/HeshamaMohamed/BlogApi
```

Go to the project directory

```bash
cd BlogApi
```

Start docker container

```bash
docker-compose up
```
# API Reference

## Posts API

#### Get all posts

```http
GET /api/v1/posts
```

#### Show a specific post

```http
GET /api/v1/posts/:id
```
#### Create a post

```http
POST /api/v1/posts?title=NewPostTitle&body=NewPostBody
```

#### Update a specific post

```http
PATCH /api/v1/posts/:id?body=ModifiedPostBody
```
## Comments API

#### Get all Comments in a post

```http
GET /api/v1/posts/:post_id/comments
```

#### Show a specific comment in a post

```http
GET /api/v1/posts/:post_id/comments/:id
```

#### Create a comment in a post

```http
POST /api/v1/posts/:post_id/comments?body=NewCommentBody
```

#### Update a specific comment in a post

```http
PATCH /api/v1/posts/:post_id/comments/:id?body=ModifiedCommentBody
```






## Running Tests

To run tests, run the following command

```bash
docker-compose exec app bundle exec rspec
```

