% Measurement model function for the random sine signal demo

% Copyright (C) 2007 Jouni Hartikainen
%
% This software is distributed under the GNU General Public 
% Licence (version 2 or later); please refer to the file 
% Licence.txt, included with the software, for details.

% Y: 根据当前位置和UWB基站坐标预测出来的伪距， H量测矩阵
function [Y,H] = ekf_uwb_h(x, uwb)
    
    position = x(1:3);	
    n = uwb.cnt;
	Zpred = [];
	TM = repmat(position,1,n) - uwb.anchor(:,1:n);
	for ki=1:n
	    Zpred = [Zpred ;norm(TM(:,ki))];
	end
	   Y = Zpred;
	

