From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 63263] X server crash in nouveau_xv.c:NVPutImage
 (NVCopyNV12ColorPlanes)
Date: Thu, 11 Apr 2013 00:00:26 +0000
Message-ID: <bug-63263-8800-OpJQQ4Xfh8@http.bugs.freedesktop.org/>
References: <bug-63263-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0866282920=="
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


--===============0866282920==
Content-Type: multipart/alternative; boundary="1365638426.3cFEBde1.26259"; charset="us-ascii"


--1365638426.3cFEBde1.26259
Date: Thu, 11 Apr 2013 00:00:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=63263

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
A little more info:

I added code to call NVQueryImageAttributes inside of NVPutImage, compute an
end pointer (buf + size), and then check inside of NVCopyNV12ColorPlanes at the
end of every loop iteration whether either us or vs have gone off the end.

And it seems like they do! When I move the mplayer window s.t. part of it is
off-screen (on the left), the code ends up accessing 2 bytes further than the
end of the array! There happens to be another mapping afterwards which means
that there's no segfault, but if that mapping isn't there, a segfault would
have occurred.

Now, it only ever goes over by 1-3 bytes, never more. One thing that I noticed
is that we pass in line_len to NVCopyNV12ColorPlanes as the width (which is
rounded up to 8 on NV_50 and up) rather than npixels (which is rounded up to
4). I also wonder if there's some issue in how left is computed (and then
applied to the s2/3 offsets)...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1365638426.3cFEBde1.26259
Date: Thu, 11 Apr 2013 00:00:26 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63263#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - X server crash in nouveau_xv.c:NVPutImage (NVCopyNV12ColorPlanes)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63263">bug 63263</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>A little more info:

I added code to call NVQueryImageAttributes inside of NVPutImage, compute an
end pointer (buf + size), and then check inside of NVCopyNV12ColorPlanes at the
end of every loop iteration whether either us or vs have gone off the end.

And it seems like they do! When I move the mplayer window s.t. part of it is
off-screen (on the left), the code ends up accessing 2 bytes further than the
end of the array! There happens to be another mapping afterwards which means
that there's no segfault, but if that mapping isn't there, a segfault would
have occurred.

Now, it only ever goes over by 1-3 bytes, never more. One thing that I noticed
is that we pass in line_len to NVCopyNV12ColorPlanes as the width (which is
rounded up to 8 on NV_50 and up) rather than npixels (which is rounded up to
4). I also wonder if there's some issue in how left is computed (and then
applied to the s2/3 offsets)...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1365638426.3cFEBde1.26259--

--===============0866282920==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0866282920==--
