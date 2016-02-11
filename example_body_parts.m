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

%% Some muscles of the leg
%
% Chosen and coloured somewhat at random.

figure(3); clf; hold on
set(gcf,'color','white')

patchlights = {'edgealpha',0,'AmbientStrength',0,'SpecularStrength',0};

l = find_body_parts('bone.*(femur|patella|tibia|fibula|hip).*left');
displ_body_parts(l,'facecolor',[0.9 0.9 0.9],patchlights{:})

l = find_body_parts('muscle organ.*(adductor|quadratus femoris).*left');
displ_body_parts(l,'facecolor',[1 0.5 0.5],'facealpha',0.5,patchlights{:})

l = find_body_parts('muscle organ.*(sartorius|gracilis).*left');
displ_body_parts(l,'facecolor',[0.5 1 0.5],'facealpha',0.5,patchlights{:})

l = find_body_parts('(biceps femoris|semitend|semimem).*left');
displ_body_parts(l,'facecolor',[0.5 0.5 1],'facealpha',0.5,patchlights{:})

l = find_body_parts('(vastus).*left');
displ_body_parts(l,'facecolor',[0.5 1 1],'facealpha',0.5,patchlights{:})

axis equal
axis tight
axis off

lighting gouraud
for a = 0:90:270
  view(a,0)
  camlight headlight
end
for el = [-90 90]
  view(0,el)
  camlight headlight
end
