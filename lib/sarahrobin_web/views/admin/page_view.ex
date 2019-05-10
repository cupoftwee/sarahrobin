defmodule SarahrobinWeb.Admin.PageView do
  use SarahrobinWeb, :view

  def published_status(post) do
    case post.published do
      true -> "Yes"
      false -> "No"
    end
  end

end