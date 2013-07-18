From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67051] No nouveau HDMI sound on NVIDIA GT430
Date: Thu, 18 Jul 2013 17:42:17 +0000
Message-ID: <bug-67051-8800-uT7S9D5nTr@http.bugs.freedesktop.org/>
References: <bug-67051-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2097899198=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67051-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2097899198==
Content-Type: multipart/alternative; boundary="1374169336.172aefD81.15877"; charset="us-ascii"


--1374169336.172aefD81.15877
Date: Thu, 18 Jul 2013 17:42:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67051

--- Comment #2 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi Alex
I would assume that your kernel does not have the following patch it can be
found at the nouveau repo [1]

commit bf03d1b293cc556df53545e318110505014d805e
Author: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Date:   Wed Jul 3 03:06:02 2013 -0400

    drm/nva3/disp: Fix HDMI audio regression

    This is the nva3 counterpart to commit beba44b17 (drm/nv84/disp: Fix
    HDMI audio regression). The regression happened as a result of
    refactoring in commit 8e9e3d2de (drm/nv84/disp: move hdmi control into
    core).

    Reported-and-tested-by: Max Baldwin <archerseven-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
    Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
    Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
    Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


Note that HDMI audio is not fully reverse-engineered, thus you may be one of
the "lucky" people where it does a bit of extra in order to work :)

[1] http://cgit.freedesktop.org/nouveau/linux-2.6/

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374169336.172aefD81.15877
Date: Thu, 18 Jul 2013 17:42:16 +0000
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
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051">bug 67051</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Hi Alex
I would assume that your kernel does not have the following patch it can be
found at the nouveau repo [1]

commit bf03d1b293cc556df53545e318110505014d805e
Author: Ilia Mirkin &lt;<a href="mailto:imirkin&#64;alum.mit.edu">imirkin&#64;alum.mit.edu</a>&gt;
Date:   Wed Jul 3 03:06:02 2013 -0400

    drm/nva3/disp: Fix HDMI audio regression

    This is the nva3 counterpart to commit beba44b17 (drm/nv84/disp: Fix
    HDMI audio regression). The regression happened as a result of
    refactoring in commit 8e9e3d2de (drm/nv84/disp: move hdmi control into
    core).

    Reported-and-tested-by: Max Baldwin &lt;<a href="mailto:archerseven&#64;gmail.com">archerseven&#64;gmail.com</a>&gt;
    Signed-off-by: Ilia Mirkin &lt;<a href="mailto:imirkin&#64;alum.mit.edu">imirkin&#64;alum.mit.edu</a>&gt;
    Signed-off-by: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;
    Cc: <a href="mailto:stable&#64;vger.kernel.org">stable&#64;vger.kernel.org</a>


Note that HDMI audio is not fully reverse-engineered, thus you may be one of
the &quot;lucky&quot; people where it does a bit of extra in order to work :)

[1] <a href="http://cgit.freedesktop.org/nouveau/linux-2.6/">http://cgit.freedesktop.org/nouveau/linux-2.6/</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374169336.172aefD81.15877--

--===============2097899198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2097899198==--
