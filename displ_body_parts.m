function displ_body_parts(id_list,colour,opacity)

% I don't know the best way to "localise" this. Edit as appropriate:

OBJ_PATH   = '/Users/will/Local/Biomech/BodyParts3D/v4obj/';
CACHE_PATH = '/Users/will/Local/Biomech/BodyParts3D/v4cache/';


%% Sanity check

if ~exist(OBJ_PATH,'dir'), error('OBJ_PATH does not exist.'); end
if ~exist(CACHE_PATH,'dir')
  st = mkdir(CACHE_PATH);
  if ~st, error('CACHE_PATH does not exist and cannot be created.)'); end
end


%% Inputs

if nargin < 3
  opacity = 1;
end
if nargin < 2
  colour = [1 0 0];
end
if ischar(id_list)
  id_list = {id_list};
end

%% Display loop
%
% Or rather, "fun"!

cellfun( displ_part , id_list )


%% Display function
%
% A nested function so we don't have to pass data around.

  function displ_part(id)
    
    filename  = [OBJ_PATH,id,'.obj'];
    cachename = [CACHE_PATH,id,'.mat'];
    
    if exist(cachename,'file')
      load(cachename);
    else
      if ~exist(filename,'file')
        error(['Can''t find body part: ',id])
      end
      OBJ = read_wobj(filename);
      save(cachename,'OBJ');
    end
    
    FV.vertices = OBJ.vertices;
    FV.faces    = OBJ.objects(3).data.vertices;
    
    patch(FV,'facecolor',colour,'facealpha',opacity,'edgealpha',0)
    
  end

end
