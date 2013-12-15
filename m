From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58378] [NV86] Distorted graphics on NVIDIA GeForce
 8400M G after upgrade the kernel to 3.7.0 version
Date: Sun, 15 Dec 2013 14:42:27 +0000
Message-ID: <bug-58378-8800-N1w1V3iBjK@http.bugs.freedesktop.org/>
References: <bug-58378-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0029132101=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58378-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0029132101==
Content-Type: multipart/alternative; boundary="1387118547.3E6b6.19356"; charset="us-ascii"


--1387118547.3E6b6.19356
Date: Sun, 15 Dec 2013 14:42:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58378

--- Comment #31 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
You really need to figure out how to do things inside the git tree and not do
some sort of crazy export. That will speed things up by an order of magnitude.

To get the list of nouveau changes between 3.4 and 3.5:

git log v3.4..v3.5 -- drivers/gpu/drm/nouveau

To do a bisect between 3.4 and 3.5, same instructions as before, but use v3.5
as the bad tag and v3.4 as the good tag.

Looking through the list of changes, c420b2dc8dc3cdd507214f4df5c5f96f08812cbe
stands out as a big one, as does 5e120f6e4b3f35b741c5445dfc755f50128c3c44 which
actually introduces the nv84+ fence mechanism.

This had actually previously occurred to me, but a quick thing to try out is to
switch to the nv17 fence and see what happens. You can do this by editing the
logic in drivers/gpu/drm/nouveau/nouveau_drm.c:nouveau_accel_init, and just
replace nv84_fence_create with nv50_fence_create (which will make a nv50+
appropriate nv17 fence impl).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1387118547.3E6b6.19356
Date: Sun, 15 Dec 2013 14:42:27 +0000
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
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378#c31">Comment # 31</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378">bug 58378</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>You really need to figure out how to do things inside the git tree and not do
some sort of crazy export. That will speed things up by an order of magnitude.

To get the list of nouveau changes between 3.4 and 3.5:

git log v3.4..v3.5 -- drivers/gpu/drm/nouveau

To do a bisect between 3.4 and 3.5, same instructions as before, but use v3.5
as the bad tag and v3.4 as the good tag.

Looking through the list of changes, c420b2dc8dc3cdd507214f4df5c5f96f08812cbe
stands out as a big one, as does 5e120f6e4b3f35b741c5445dfc755f50128c3c44 which
actually introduces the nv84+ fence mechanism.

This had actually previously occurred to me, but a quick thing to try out is to
switch to the nv17 fence and see what happens. You can do this by editing the
logic in drivers/gpu/drm/nouveau/nouveau_drm.c:nouveau_accel_init, and just
replace nv84_fence_create with nv50_fence_create (which will make a nv50+
appropriate nv17 fence impl).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1387118547.3E6b6.19356--

--===============0029132101==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0029132101==--
