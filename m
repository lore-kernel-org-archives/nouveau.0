From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 63263] X server crash in nouveau_xv.c:NVPutImage
 (NVCopyNV12ColorPlanes)
Date: Wed, 10 Apr 2013 16:57:17 +0000
Message-ID: <bug-63263-8800-GWhLiP5irm@http.bugs.freedesktop.org/>
References: <bug-63263-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1766431996=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-63263-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1766431996==
Content-Type: multipart/alternative; boundary="1365613037.e5751.13796"; charset="us-ascii"


--1365613037.e5751.13796
Date: Wed, 10 Apr 2013 16:57:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=63263

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Reading the code some more, higher up in the call chain (ProcXv{Shm,}PutImage),
a call to NVQueryImageAttributes is made to determine how many bytes the source
image needs to be, and if there aren't enough bytes, we never even make it to
NVPutImage.

So this means that we're looking for some sort of inconsistency between
NVQueryImageAttributes and how far into the source buffer NVPutImage reads.
Sadly the logic in NVPutImage is separate, and is much more complex.

By the way, it occurs to me that I didn't mention what hardware I'm using, in
case it matters:

02:00.0 VGA compatible controller: NVIDIA Corporation G96 [GeForce 9500 GT]
(rev a1)

And I'm using x11-libs/libdrm-2.4.40 (which nouveau_xv.c depends on via
nouveau_bo_*)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1365613037.e5751.13796
Date: Wed, 10 Apr 2013 16:57:17 +0000
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
   title="NEW --- - X server crash in nouveau_xv.c:NVPutImage (NVCopyNV12ColorPlanes)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63263#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - X server crash in nouveau_xv.c:NVPutImage (NVCopyNV12ColorPlanes)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63263">bug 63263</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Reading the code some more, higher up in the call chain (ProcXv{Shm,}PutImage),
a call to NVQueryImageAttributes is made to determine how many bytes the source
image needs to be, and if there aren't enough bytes, we never even make it to
NVPutImage.

So this means that we're looking for some sort of inconsistency between
NVQueryImageAttributes and how far into the source buffer NVPutImage reads.
Sadly the logic in NVPutImage is separate, and is much more complex.

By the way, it occurs to me that I didn't mention what hardware I'm using, in
case it matters:

02:00.0 VGA compatible controller: NVIDIA Corporation G96 [GeForce 9500 GT]
(rev a1)

And I'm using x11-libs/libdrm-2.4.40 (which nouveau_xv.c depends on via
nouveau_bo_*)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1365613037.e5751.13796--

--===============1766431996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1766431996==--
