function [err] = lsq_test2 (x)
    t_data = linspace(1,100);
    y_data = [7.34944737278636,7.69984833696116,6.31248602928123,8.05749551393093,7.66967717013677,6.77623783479221,7.31633528070930,8.03326717064137,9.03666656343058,9.23556219436550,7.80712698980138,9.62118556352123,9.78441654111399,9.03290005777626,9.85675928488504,8.73600408221311,9.49377049913685,10.6817189842624,10.6366460640778,11.1751831998932,10.7736301586438,9.74150600177648,11.5782586117376,11.9598873219614,11.6632554336825,12.0371331537187,12.2257690684812,11.7437928820435,12.4921128051485,11.7473320533091,13.0428359776921,11.9221780894491,12.6421104327317,12.4123427812623,12.7479825707362,14.4363371442579,14.4167646839682,13.9009758196259,15.4088738497428,13.8209582767083,14.8751746697260,15.0084061703844,16.0259096093559,16.3368460832659,15.3737452091088,16.2350659816591,16.4042302526615,17.0651880036936,17.4527792484930,17.8068940251217,17.1150253606087,18.1898185768478,18.4100307186915,17.6964631398108,17.8826234622903,18.9167281039643,20.1168432889330,19.1574656682083,19.9285520308852,19.4889461930319,20.8291456888592,20.1240745284392,20.9150545991981,21.5925336106026,22.2694098108567,22.7013927677663,22.1744310599276,21.6564224393764,21.9789185896305,22.4984875826276,23.9700295532896,23.1042668372819,24.5333630405674,23.7029177060450,25.3874528662092,24.5439344741184,24.5541822363996,24.9821677159521,26.0330810878305,26.0705446399542,26.1522446339607,27.4375250243876,27.2753215707352,27.5351496959211,28.6029823689819,27.6751491120209,28.9547310367338,29.2866317422760,28.8808916939507,29.5984531988058,28.9593118849112,29.2622804026225,30.5647356018857,31.4122187577247,32.0746329387063,30.8211347309971,32.0556638506700,32.2154754969924,31.6611595109033,32.6742452887978];
    y = lsq_test_f2(t_data, x(1), x(2), x(3));
    err = y - y_data;
    
    function y = lsq_test_f2(t, x1, x2, x3)
    y = x1 +x2*t + x3*t.^2;
    end
end