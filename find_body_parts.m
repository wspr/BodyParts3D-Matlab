function parts = find_body_parts(s)
%% FIND_BODY_PART
% Uses a processed version of the BodyParts3D parts list to search for a
% specified body part.
%
% Usage:
%
%        find_body_parts(REGEX)
% Search for part with REGEX and print a list of IDs and descriptions to screen.
%
%        LIST = find_body_pars(REGEX)
% Search as above and save a list of the IDs only in cell array LIST.
%
% E.g., search for all lower left (pre)molars:
%       find_body_parts('molar.*left.*lower')
%
% To record the ID strings:
%       molars = find_body_parts('molar.*left.*lower')

if nargin<1
  help find_body_parts
  return
end

parts_list = load_parts_list();
    
search_bool   = cellfun(@(x) ~isempty(regexpi(x,s)),parts_list.desc);
search_result = find(search_bool);

if nargout == 0
  
  arrayfun(@(ii) ...
    fprintf('%s : %s\n',parts_list.ID{ii},parts_list.desc{ii}),...
    search_result);
  
else  

  parts = parts_list.ID(search_result);

end

end

