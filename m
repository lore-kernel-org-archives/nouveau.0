From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74164] [NV04] Native monitor resolution missing
Date: Fri, 31 Jan 2014 16:44:45 +0000
Message-ID: <bug-74164-8800-WLx0yOGo7s@http.bugs.freedesktop.org/>
References: <bug-74164-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2135672918=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-74164-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2135672918==
Content-Type: multipart/alternative; boundary="1391186685.c16ceEdC2.4006"; charset="us-ascii"


--1391186685.c16ceEdC2.4006
Date: Fri, 31 Jan 2014 16:44:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74164

--- Comment #17 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
These are the relevant bits:

[    3.230395] nouveau  [     DRM] Setting dpms mode 3 on vga encoder (output
0)
[    3.230410] [drm:drm_helper_probe_single_connector_modes],
[CONNECTOR:10:VGA-1]
[    3.249836] nouveau  [     DRM] Load detected on head A
[    3.249861] nouveau  [     DRM] native mode from largest: 0x0@0

You'll have to throw in a bunch of extra prints to figure out what's going on,
I'm afraid.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391186685.c16ceEdC2.4006
Date: Fri, 31 Jan 2014 16:44:45 +0000
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
   title="NEW --- - [NV04] Native monitor resolution missing"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74164#c17">Comment # 17</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV04] Native monitor resolution missing"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74164">bug 74164</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>These are the relevant bits:

[    3.230395] nouveau  [     DRM] Setting dpms mode 3 on vga encoder (output
0)
[    3.230410] [drm:drm_helper_probe_single_connector_modes],
[CONNECTOR:10:VGA-1]
[    3.249836] nouveau  [     DRM] Load detected on head A
[    3.249861] nouveau  [     DRM] native mode from largest: 0x0&#64;0

You'll have to throw in a bunch of extra prints to figure out what's going on,
I'm afraid.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391186685.c16ceEdC2.4006--

--===============2135672918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2135672918==--
