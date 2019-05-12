defmodule SarahrobinWeb.PageController do
  use SarahrobinWeb, :controller

  alias Sarahrobin.Content.Blog
  alias Sarahrobin.Content.Post

  
  def home(conn, _) do
    posts = Blog.get_published_posts()
    conn
      |> render("home.html", posts: posts)
  end

  def work(conn, _) do
    posts = Blog.get_published_work()
    conn
      |> assign(:navbar, true)
      |> render("work.html", posts: posts)
  end

  def index(conn, _) do
    posts = Blog.get_published_posts()
    conn
      |> assign(:navbar, true)
      |> render("blog.html", posts: posts)
  end

  def show(conn, %{"id" => slug}) do
    with %Post{} = post <- Blog.get(slug, true) do
      conn
        |> assign(:navbar, true)
        |> render("show.html", post: post)
    end
  end

end