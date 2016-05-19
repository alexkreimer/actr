classdef GeomFeatures
    % implementation of geometric features used in this work
    % www.iai.uni-bonn.de/~gall/download/jgall_poseAR_bmvc11.pdf
    properties
        traj
    end
    methods
        function obj = GeomFeatures(traj)
            if nargin>0
                obj.traj = traj;
            end
        end
        
        function val = F_jd(obj, j1, j2, t1, t2)
            % joint distance feature
            p1 = obj.traj(:,j1,t1);
            p2 = obj.traj(:,j2,t2);
            
            val = norm(p1-p2);
        end
        
        function val = F_jd_bin(obj, j1, j2, t1, t2, thresh)
            val = obj.F_jd(j1, j2, t1, t2) < thresh;
        end
        
        function val = F_pl(obj, j1, j2, j3, j4, t1, t2)
            % plane feature

            p1 = obj.traj(:,j1,t1);
            p2 = obj.traj(:,j2,t2);
            p3 = obj.traj(:,j3,t2);
            p4 = obj.traj(:,j4,t2);
            
            n = cross(p2-p3, p2-p4);
            n = n/norm(n);

            d = -n'*p2;
            val = [n;d]'*[p1;1];
        end

        function val = F_pl_bin(obj, j1, j2, j3, j4, t1, t2, thresh)
            val = obj.F_pl(j1,j2,j3,j4,t1,t2) < thresh;
        end
            
        function val = F_np(obj, j1, j2, j3, j4, t1, t2)
            % normal plane feature
            p1 = obj.traj(:,j1,t1);
            p2 = obj.traj(:,j2,t2);
            p3 = obj.traj(:,j3,t2);
            p4 = obj.traj(:,j4,t2);

            n = (p2-p3)/norm(p2-p3);
            d = -n'*p4;
            
            val = [n;d]'*[p1;1];
        end
        
        function val = F_np_bin(obj, j1, j2, j3, j4, t1, t2, thresh)
            val = obj.F_np(j1, j2, j3, j4, t1, t2) < thresh;
        end

    end
end
