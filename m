From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 49736] [NV43] piglit quick.driver tests kill X server
Date: Thu, 19 Sep 2013 14:34:19 +0000
Message-ID: <bug-49736-8800-m8FDrO6XNX@http.bugs.freedesktop.org/>
References: <bug-49736-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1109820424=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-49736-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1109820424==
Content-Type: multipart/alternative; boundary="1379601259.D7a3E1B1.28479"; charset="us-ascii"


--1379601259.D7a3E1B1.28479
Date: Thu, 19 Sep 2013 14:34:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=49736

--- Comment #10 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
There's still a segfault, but the timing corresponds nicely to the GPU lockup.
The segfault happens in libexa, without direct nouveau involvement though. You
might try to also upgrade Xorg and see if that helps, although a bit unlikely.

BTW, you should grab my patch at
http://lists.freedesktop.org/archives/mesa-dev/2013-September/044399.html (and
the 2/2). Although it won't apply without a bit of massaging (nv30 dir got
moved, should be able to just hand-edit the patch). This disables
ARB_framebuffer_object on nv30. There's another patch I need to write that will
disallow incompatible color/zeta settings too.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1379601259.D7a3E1B1.28479
Date: Thu, 19 Sep 2013 14:34:19 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - [NV43] piglit quick.driver tests kill X server"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=49736#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NV43] piglit quick.driver tests kill X server"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=49736">bug 49736</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>There's still a segfault, but the timing corresponds nicely to the GPU lockup.
The segfault happens in libexa, without direct nouveau involvement though. You
might try to also upgrade Xorg and see if that helps, although a bit unlikely.

BTW, you should grab my patch at
<a href="http://lists.freedesktop.org/archives/mesa-dev/2013-September/044399.html">http://lists.freedesktop.org/archives/mesa-dev/2013-September/044399.html</a> (and
the 2/2). Although it won't apply without a bit of massaging (nv30 dir got
moved, should be able to just hand-edit the patch). This disables
ARB_framebuffer_object on nv30. There's another patch I need to write that will
disallow incompatible color/zeta settings too.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1379601259.D7a3E1B1.28479--

--===============1109820424==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1109820424==--
