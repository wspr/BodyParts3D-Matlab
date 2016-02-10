%% Using BodyParts3D to display the spine

figure(2); clf; hold on
set(gcf,'color','white')

Ncol = 4;
hsv = ones(Ncol,3);
hsv(:,1) = ((1:Ncol)-1)'/Ncol;
hsv(:,2) = 0.5;
hsv(:,3) = 1;
col = hsv2rgb(hsv);

patchlights = {'edgealpha',0,'facealpha',1,'AmbientStrength',0.1,'SpecularStrength',0.1};

l = find_body_parts('/ cervical vertebra /');
displ_body_parts(l,'facecolor',col(1,:),patchlights{:})

l = find_body_parts('/ thoracic vertebra /');
displ_body_parts(l,'facecolor',col(2,:),patchlights{:})

l = find_body_parts('/ lumbar vertebra /');
displ_body_parts(l,'facecolor',col(3,:),patchlights{:})

l = find_body_parts('sacrum');
displ_body_parts(l,'facecolor',col(4,:),patchlights{:})

l = find_body_parts('intervertebral disk');
displ_body_parts(l,'facecolor',0.5*[1 1 1],patchlights{:})

axis equal
axis tight
axis off

view(-90,0)
lighting gouraud
camlight('headlight')
