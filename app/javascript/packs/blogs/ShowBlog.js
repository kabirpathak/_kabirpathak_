import React, { useEffect } from 'react';

const ShowBlog = (blog) =>{

  useEffect(() => {
    /* eslint-disable no-undef */
    console.log('here!');
    Rails.ajax(
      {
        url: `/api/v1/blog/${blog.id}`,
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
    <div className="p-1 center">
      {
        blogs.map((blog) => {
          return (
            <div className="row" key={blog.id}>
              {(blog.tags.map((tag) => {
                return (
                  <div className="row">
                    {tag}
                  </div>
                )
              }))}

            </div>
          )
        })}
    </div>
  );
}

export default ShowBlog;
