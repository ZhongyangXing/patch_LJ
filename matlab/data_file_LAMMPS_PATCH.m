clear all
close all

%% initialize the parameters.
atom_num     = 14;
bond_num     = 12; 
angle_num    = 12;
dihedral_num = 0; 
improper_num = 0;
% ----------  initialize the TYPE paramters  -----------%
atom_typ     = 3;  % atome_type 1,2,3 = ddDNA,ssDNA1,ssDNA2
bond_typ     = 2;  % FENE & NONE
angle_typ    = 2;  % 120 degrees, 180 degrees
dihedral_typ = 0;
improper_typ = 0;

% ----------  define the BOX SIZE --------------------%
xlo = -5;  xhi = 5;
ylo = -3;  yhi = 3;
zlo = -3;  zhi = 3;

%-----------  define Mass  ---------------------------% 
%  mass types = atom_types
mass_1 = 1.0;
mass_2 = 1.0;
mass_3 = 1.0;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     write the HEADER to the data.file.      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fileID = fopen('data.file','w');
fprintf(fileID,'LAMMPS FENE chain data file\n\n');
fileID = fopen('data.file','a');
fprintf(fileID,'\t\t %d\tatoms\n',atom_num);
fprintf(fileID,'\t\t %d\tbonds\n',bond_num);
fprintf(fileID,'\t\t %d\tangles\n',angle_num);
fprintf(fileID,'\t\t %d\timpropers\n\n',improper_num);
fprintf(fileID,'\t\t %d\tatom types\n',atom_typ);
fprintf(fileID,'\t\t %d\tbond types\n',bond_typ);
fprintf(fileID,'\t\t %d\tangle types\n',angle_typ);
fprintf(fileID,'\t\t %d\tdihedral types\n',dihedral_typ);
fprintf(fileID,'\t\t %d\timproper types\n\n',improper_typ);

% to define the box size
fprintf(fileID,'\t %f \t %f \t xlo xhi\n',xlo,xhi);
fprintf(fileID,'\t %f \t %f \t ylo yhi\n',xlo,xhi);
fprintf(fileID,'\t %f \t %f \t zlo zhi\n\n',xlo,xhi);

% to define Masses
fprintf(fileID,'Masses\n\n');
fprintf(fileID,'\t 1 \t %f\n',mass_1);
fprintf(fileID,'\t 2 \t %f\n',mass_2);
fprintf(fileID,'\t 3 \t %f\n\n',mass_3);

%% ATOMS
% read the initial configuration of two Ys from atom.txt
fprintf(fileID,'Atoms\n\n');
M = dlmread('atom1','\t');
fmt='%d\t%d\t%d\t%f\t%f\t%f\t%f\t%f\t%f\n';
[Mrows,Mcols] = size(M);
for row = 1:Mrows
    fprintf(fileID,fmt,M(row,:));
end

M = dlmread('atom2','\t');
fmt='%d\t%d\t%d\t%f\t%f\t%f\t%f\t%f\t%f\n';
[Mrows,Mcols] = size(M);
for row = 1:Mrows
    fprintf(fileID,fmt,M(row,:));
end

fprintf(fileID,'\n');
%% BONDS
fprintf(fileID,'Bonds\n\n');
M = dlmread('bond1','\t');
fmt='%d\t%d\t%d\t%d \n';
[Mrows,Mcols] = size(M);
for row = 1:Mrows
    fprintf(fileID,fmt,M(row,:));
end

M = dlmread('bond2','\t');
fmt='%d\t%d\t%d\t%d \n';
[Mrows,Mcols] = size(M);
for row = 1:Mrows
    fprintf(fileID,fmt,M(row,:));
end

fprintf(fileID,'\n');
%% ANGLES 
fprintf(fileID,'Angles\n\n');
M = dlmread('angle1','\t');
fmt='%d\t%d\t%d\t%d\t%d\n';
[Mrows,Mcols] = size(M);
for row = 1:Mrows
    fprintf(fileID,fmt,M(row,:));
end

M = dlmread('angle2','\t');
fmt='%d\t%d\t%d\t%d\t%d\n';
[Mrows,Mcols] = size(M);
for row = 1:Mrows
    fprintf(fileID,fmt,M(row,:));
end

fprintf(fileID,'\n');
