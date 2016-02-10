%% Using BodyParts3D to display the spine

figure(2); clf; hold on
set(gcf,'color','white')

Ncol = 4;
hsv = ones(Ncol,3);
hsv(:,1) = ((1:Ncol)-1)'/Ncol;
hsv(:,2) = 0.5;
hsv(:,3) = 1;
col = hsv2rgb(hsv);
opa = 1;

l = find_body_parts('/ cervical vertebra /');
displ_body_parts(l,col(1,:),opa)

l = find_body_parts('/ thoracic vertebra /');
displ_body_parts(l,col(2,:),opa)

l = find_body_parts('/ lumbar vertebra /');
displ_body_parts(l,col(3,:),opa)

l = find_body_parts('sacrum');
displ_body_parts(l,col(4,:),opa)

axis equal
axis tight
axis off

view(-90,0)
camlight
