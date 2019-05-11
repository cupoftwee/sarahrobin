defmodule SarahrobinWeb.PageController do
  use SarahrobinWeb, :controller

  alias Sarahrobin.Content.Blog
  alias Sarahrobin.Content.Post

  
  def home(conn, _) do
    posts = Blog.get_published_posts()
    render(conn, "home.html", posts: posts)
  end

  def work(conn, _) do
    posts = Blog.get_published_work()
    render(conn, "work.html", posts: posts)
  end

  def index(conn, _) do
    posts = Blog.get_published_posts()
    render(conn, "blog.html", posts: posts)
  end

  def show(conn, %{"id" => slug}) do
    with %Post{} = post <- Blog.get(slug, true) do
      render(conn, "show.html", post: post)
    end
  end

end