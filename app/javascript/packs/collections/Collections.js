import React, { useEffect, useState } from 'react';
import ReactDOM from 'react-dom';
import Rails from '@rails/ujs';

const Collections = () =>{
  const [collections, setCollections] = useState([]);

  const handleClick = collection => {
    
    console.log(collection.tags);
    return (
      <ShowCollection id={collection} />
    );  
  }

  const summarize = text => text;

  useEffect(() => {
    Rails.ajax(
      {
        url: '/api/v1/collections',
        type: 'GET',
        dataType: 'json',
        success: (data) => {
          setCollections(data);
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
      <h3>Collections</h3>
      <hr />
      <ul>
      {
        collections.map((collection) => {
          return (
            <li>
              <div onClick={() => handleClick(collection)} className="py-2 px-3" key={collection.id}>
                <div className="row">
                  <div className="row collection-heading">
                    {collection.title}
                  </div>
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
    <Collections />,
    document.getElementById('collections'),
  )
})

