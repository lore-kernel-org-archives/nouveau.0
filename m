From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61321] [regression][NV4c] System hang while loading
 gdm on 3.7 kernel (works on 3.6)
Date: Sat, 23 Feb 2013 18:27:36 +0000
Message-ID: <bug-61321-8800-4zCpw5vilL@http.bugs.freedesktop.org/>
References: <bug-61321-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0074450828=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-61321-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0074450828==
Content-Type: multipart/alternative; boundary="1361644056.7d25e61.12695"; charset="us-ascii"


--1361644056.7d25e61.12695
Date: Sat, 23 Feb 2013 18:27:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61321

--- Comment #6 from Cesar Eduardo Barros <cesarb-PWySMVKUnqmsTnJN9+BGXg@public.gmane.org> ---
I just did a bisect.

The symptoms change mid bisect (losing video at the initial modeset, instead of
hanging completely at gdm), so I am not completely sure, but here are the
results:

70ee6f1cd6911098ddd4c11ee21b69dbe51fb3f9 is the first bad commit
commit 70ee6f1cd6911098ddd4c11ee21b69dbe51fb3f9
Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Fri Jul 13 16:49:49 2012 +1000

    drm/nv04-nv40/fifo: remove use of nouveau_gpuobj_new_fake()

    Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

:040000 040000 29a991b723d037cfe7fb7a5dd3a34b8321e489d1
cb531c96db341f2340f62511cb7dc1c2b84cefc5 M    drivers

And the bisect log:

# bad: [29594404d7fe73cd80eaa4ee8c43dcc53970c60e] Linux 3.7
# good: [a0d271cbfed1dd50278c6b06bead3d00ba0a88f9] Linux 3.6
git bisect start 'v3.7' 'v3.6' '--' 'drivers/gpu/drm/nouveau/'
# bad: [cd8c14b407d59ac4b8d324f5f9cdf223a2079c88] drm/nvc0/ltcg: read LTS count
at startup
git bisect bad cd8c14b407d59ac4b8d324f5f9cdf223a2079c88
# bad: [c4afbe74cebf887d3d8e7a11aa93bebcb6a3e2e1] drm/nvc0-/gr: share headers
between fermi and kepler graphics code
git bisect bad c4afbe74cebf887d3d8e7a11aa93bebcb6a3e2e1
# good: [0134a97979a0abc1c756b0fe491e074693c2bdf5] drm/nv50-/instmem: allocate
vram for kernel objects from end of vram
git bisect good 0134a97979a0abc1c756b0fe491e074693c2bdf5
# bad: [8a9b889e668a5bc2f4031015fe4893005c43403d] drm/nouveau: remove last use
of nouveau_gpuobj_new_fake()
git bisect bad 8a9b889e668a5bc2f4031015fe4893005c43403d
# bad: [70ee6f1cd6911098ddd4c11ee21b69dbe51fb3f9] drm/nv04-nv40/fifo: remove
use of nouveau_gpuobj_new_fake()
git bisect bad 70ee6f1cd6911098ddd4c11ee21b69dbe51fb3f9
# good: [af7afbd2e1409168698bde2f2846848b07d05d12] drm/nv04-nv40/instmem:
duplicate nv04 code as nv40, remove alternate paths
git bisect good af7afbd2e1409168698bde2f2846848b07d05d12
# good: [5787640db6ae722aeadb394d480c7ca21b603e34] drm/nv04-nv40/instmem:
remove use of nouveau_gpuobj_new_fake()
git bisect good 5787640db6ae722aeadb394d480c7ca21b603e34

And my notes on the bisect kernels:

cd8c14b407d59ac4b8d324f5f9cdf223a2079c88 hangs at gdm
c4afbe74cebf887d3d8e7a11aa93bebcb6a3e2e1 hangs at initial modeset
0134a97979a0abc1c756b0fe491e074693c2bdf5 works
8a9b889e668a5bc2f4031015fe4893005c43403d initial modeset: blank screen followed
by dpms off, keyboard still works
70ee6f1cd6911098ddd4c11ee21b69dbe51fb3f9 again blank screen/dpms off at initial
modeset
af7afbd2e1409168698bde2f2846848b07d05d12 works
5787640db6ae722aeadb394d480c7ca21b603e34 works

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1361644056.7d25e61.12695
Date: Sat, 23 Feb 2013 18:27:36 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [regression][NV4c] System hang while loading gdm on 3.7 kernel (works on 3.6)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61321#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [regression][NV4c] System hang while loading gdm on 3.7 kernel (works on 3.6)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61321">bug 61321</a>
              from <span class="vcard"><a class="email" href="mailto:cesarb&#64;cesarb.net" title="Cesar Eduardo Barros &lt;cesarb&#64;cesarb.net&gt;"> <span class="fn">Cesar Eduardo Barros</span></a>
</span></b>
        <pre>I just did a bisect.

The symptoms change mid bisect (losing video at the initial modeset, instead of
hanging completely at gdm), so I am not completely sure, but here are the
results:

70ee6f1cd6911098ddd4c11ee21b69dbe51fb3f9 is the first bad commit
commit 70ee6f1cd6911098ddd4c11ee21b69dbe51fb3f9
Author: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;
Date:   Fri Jul 13 16:49:49 2012 +1000

    drm/nv04-nv40/fifo: remove use of nouveau_gpuobj_new_fake()

    Signed-off-by: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;

:040000 040000 29a991b723d037cfe7fb7a5dd3a34b8321e489d1
cb531c96db341f2340f62511cb7dc1c2b84cefc5 M    drivers

And the bisect log:

# bad: [29594404d7fe73cd80eaa4ee8c43dcc53970c60e] Linux 3.7
# good: [a0d271cbfed1dd50278c6b06bead3d00ba0a88f9] Linux 3.6
git bisect start 'v3.7' 'v3.6' '--' 'drivers/gpu/drm/nouveau/'
# bad: [cd8c14b407d59ac4b8d324f5f9cdf223a2079c88] drm/nvc0/ltcg: read LTS count
at startup
git bisect bad cd8c14b407d59ac4b8d324f5f9cdf223a2079c88
# bad: [c4afbe74cebf887d3d8e7a11aa93bebcb6a3e2e1] drm/nvc0-/gr: share headers
between fermi and kepler graphics code
git bisect bad c4afbe74cebf887d3d8e7a11aa93bebcb6a3e2e1
# good: [0134a97979a0abc1c756b0fe491e074693c2bdf5] drm/nv50-/instmem: allocate
vram for kernel objects from end of vram
git bisect good 0134a97979a0abc1c756b0fe491e074693c2bdf5
# bad: [8a9b889e668a5bc2f4031015fe4893005c43403d] drm/nouveau: remove last use
of nouveau_gpuobj_new_fake()
git bisect bad 8a9b889e668a5bc2f4031015fe4893005c43403d
# bad: [70ee6f1cd6911098ddd4c11ee21b69dbe51fb3f9] drm/nv04-nv40/fifo: remove
use of nouveau_gpuobj_new_fake()
git bisect bad 70ee6f1cd6911098ddd4c11ee21b69dbe51fb3f9
# good: [af7afbd2e1409168698bde2f2846848b07d05d12] drm/nv04-nv40/instmem:
duplicate nv04 code as nv40, remove alternate paths
git bisect good af7afbd2e1409168698bde2f2846848b07d05d12
# good: [5787640db6ae722aeadb394d480c7ca21b603e34] drm/nv04-nv40/instmem:
remove use of nouveau_gpuobj_new_fake()
git bisect good 5787640db6ae722aeadb394d480c7ca21b603e34

And my notes on the bisect kernels:

cd8c14b407d59ac4b8d324f5f9cdf223a2079c88 hangs at gdm
c4afbe74cebf887d3d8e7a11aa93bebcb6a3e2e1 hangs at initial modeset
0134a97979a0abc1c756b0fe491e074693c2bdf5 works
8a9b889e668a5bc2f4031015fe4893005c43403d initial modeset: blank screen followed
by dpms off, keyboard still works
70ee6f1cd6911098ddd4c11ee21b69dbe51fb3f9 again blank screen/dpms off at initial
modeset
af7afbd2e1409168698bde2f2846848b07d05d12 works
5787640db6ae722aeadb394d480c7ca21b603e34 works</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1361644056.7d25e61.12695--

--===============0074450828==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0074450828==--
