
clear
close all

waveletNames = strings( 0, 1);

for ii = 5:35

    waveletNames(end+1) = "db" + num2str(ii);
end

for ii = 5:25

    waveletNames(end+1) = "sym" + num2str(ii);
end

for ii = 1:5

    waveletNames(end+1) = "coif" + num2str(ii);
end

nFilters = length( waveletNames );
waveletStruct = {};

for ii = 1:nFilters

    wname_ii = waveletNames(ii);
    [LoD, HiD, LoR, HiR] = wfilters( wname_ii );

    waveletStruct.(wname_ii) = {};
    waveletStruct.(wname_ii).LoD = LoD;
    waveletStruct.(wname_ii).HiD = HiD;

    waveletStruct.(wname_ii).LoR = LoR;
    waveletStruct.(wname_ii).HiR = HiR;
end

save('prefilters.mat', 'waveletStruct')




