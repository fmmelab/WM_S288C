% Defines a tRNA polymer
%
% Author: Jonathan Karr
% Affilitation: Covert Lab, Department of Bioengineering, Stanford University
% Last updated: 5/7/2009
classdef tRNA < edu.jiangnan.fmme.cell.kb.ssRNA
    methods
        function this = tRNA(knowledgeBase, wid,wholeCellModelID, name, ...
                sequence, ...
                comments, crossReferences)

            if nargin == 0; return; end;

            this = edu.jiangnan.fmme.cell.kb.tRNA.empty(size(wid,1),0);
            this(size(wid,1),1) = edu.jiangnan.fmme.cell.kb.ssRNA;
            for i = 1:size(wid,1)
                this(i,1).idx = i;
                this(i,1).knowledgeBase = knowledgeBase;
                this(i,1).wid = wid(i);
                this(i,1).wholeCellModelID = wholeCellModelID{i};
                this(i,1).name = name{i};
                if exist('comments','var') && ~isempty(comments); this(i,1).comments = comments{i}; end;
                if exist('crossReferences','var')
                    if size(crossReferences,1)>1
                        this(i,1).crossReferences = crossReferences(i);
                    else
                        this(i,1).crossReferences = struct;
                        fields = fieldnames(crossReferences);
                        for j = 1:size(fields,1)
                            values = crossReferences.(fields{j});
                            this(i,1).crossReferences.(fields{j}) = values(i);
                        end
                    end
                end

                this(i,1).sequence = sequence(i);
            end
        end
    end
end