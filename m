From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58378] [NV86] Distorted graphics on NVIDIA GeForce
 8400M G after upgrade the kernel to 3.7.0 version
Date: Sun, 15 Dec 2013 15:19:35 +0000
Message-ID: <bug-58378-8800-uyqoAHUQIK@http.bugs.freedesktop.org/>
References: <bug-58378-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1177170240=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58378-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1177170240==
Content-Type: multipart/alternative; boundary="1387120775.a82D5.25164"; charset="us-ascii"


--1387120775.a82D5.25164
Date: Sun, 15 Dec 2013 15:19:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58378

--- Comment #32 from Andreas Loew <awl1-hi6Y0CQ0nG0@public.gmane.org> ---
Many thanks for your quick reply - even on a Sunday! :-)


Regarding:

"You really need to figure out how to do things inside the git tree and not do
some sort of crazy export. That will speed things up by an order of magnitude."

the main issue is that I need to build a RHEL6/OL6 compliant kernel on my
machine, and I simply don't have a spec file which properly builds such a
kernel from git, so I need to export the git snapshot to a tarball.

In case you have such an RHEL6/OL6 spec file (or know where to get one from),
please let me know...


I'm just in the process of trying whether moving from nv84_fence_create to
nv50_fence_create will make a difference with 3.6.11 and will report back
later.

BR,
Andreas

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1387120775.a82D5.25164
Date: Sun, 15 Dec 2013 15:19:35 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378#c32">Comment # 32</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378">bug 58378</a>
              from <span class="vcard"><a class="email" href="mailto:awl1&#64;gmx.net" title="Andreas Loew &lt;awl1&#64;gmx.net&gt;"> <span class="fn">Andreas Loew</span></a>
</span></b>
        <pre>Many thanks for your quick reply - even on a Sunday! :-)


Regarding:

&quot;You really need to figure out how to do things inside the git tree and not do
some sort of crazy export. That will speed things up by an order of magnitude.&quot;

the main issue is that I need to build a RHEL6/OL6 compliant kernel on my
machine, and I simply don't have a spec file which properly builds such a
kernel from git, so I need to export the git snapshot to a tarball.

In case you have such an RHEL6/OL6 spec file (or know where to get one from),
please let me know...


I'm just in the process of trying whether moving from nv84_fence_create to
nv50_fence_create will make a difference with 3.6.11 and will report back
later.

BR,
Andreas</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1387120775.a82D5.25164--

--===============1177170240==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1177170240==--
