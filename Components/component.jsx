import React from 'react';
import { withComponentFeatures } from 'universal-dashboard';
import Preview from  'preview-url-component';
import './preview.css';

const UDLinkPreview = props => {
  return (
    <a href={props.url} style={{['text-decoration']: "none"}}>
    <Preview
        key={props.id}
        url={props.url}
        loadingText={props.loadingText}
        notFound={props.notFound}
    />
    </a>
);
}

export default withComponentFeatures(UDLinkPreview)