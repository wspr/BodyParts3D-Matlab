function parts_list = load_parts_list(parts_filename)
%% Load parts list and sort into unique entries
%
% This is a bit slow.
%
% The results of this part could be saved in a text file, which
% can be easily searched in Excel or any other program that deals with
% plain text:
%
%     fid = fopen('fj_list.txt','w');
%     for ii = 1:N
%         fprintf(fid,'%s\t%s\n',uniq{ii},uniq_desc{ii});
%     end
%     fclose(fid);

if nargin<1
   parts_filename = 'isa_element_parts.txt';
end

if exist('parts_list.mat','file')
    parts_list = load('parts_list.mat');
    return
end

fid = fopen(parts_filename);
x = textscan(fid,'%s\t%s\t%s','Delimiter','\t');
fclose(fid);
literal_names = x{2}(2:end);
file_names    = x{3}(2:end);

ID = unique(file_names);
desc = cell(size(ID));
N = numel(ID);

for ii = 1:N
   
    uind = find(strcmp(ID(ii),file_names));
    names = cell(2*numel(uind)-1,1);
    for jj = 1:(numel(uind)-1)
        names{2*jj-1} = literal_names{uind(jj)};
        names{2*jj} = sprintf(' / ');
    end
    for jj = numel(uind)
        names{2*jj-1} = literal_names{uind(jj)};
    end
    desc{ii} = cell2mat(names');
    
end

save parts_list.mat ID desc
parts_list = load('parts_list');

end

