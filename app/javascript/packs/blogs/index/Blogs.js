import React, { useEffect, useState } from 'react';
import ReactDOM from 'react-dom';
import Rails from '@rails/ujs';

const Blogs = () =>{
  const [blogs, setBlogs] = useState([]);

  const handleClick = blog => {
    
    console.log(blog.tags);
    return (
      <ShowBlog id={blog} />
    );  
  }

  const summarize = text => text;

  useEffect(() => {
    Rails.ajax(
      {
        url: '/api/v1/blogs',
        type: 'GET',
        dataType: 'json',
        success: (data) => {
          setBlogs(data);
          console.log(data);
        },
        error: (error) => {
          console.log(error);
        }
      }
    )
  }, []);

  return (
    <div className="pr-1">
      <h3>Blogs</h3>
      <hr />
      <ul>
      {
        blogs.map((blog) => {
          return (
            <li>
              <div onClick={() => handleClick(blog)} className="py-2 px-3" key={blog.id}>
                <div className="row">
                  <div className="row blog-heading">
                    {blog.title}
                  </div>
                  <div className="row">
                    {(blog.tags.map((tag) => {
                      return (
                        // remember to pass tag id in blogs_controller api/v1 and use it here as key for optimization
                        <div className="tag" key={tag}>
                          {tag}
                        </div>
                      )
                    }))}
                  </div>
                  <div className="row mt-1">{blog.body}</div>
                </div>
              </div>
              <hr />
            </li>
            
          )
        })
      }
      </ul>
    </div>
  );
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Blogs />,
    document.getElementById('blogs'),
  )
})

// const rootEl = document.getElementById('blogs');
// const root = createRoot(rootEl);
// root.render(
//   <StrictMode>
//     <Blogs />
//   </StrictMode>
// );
