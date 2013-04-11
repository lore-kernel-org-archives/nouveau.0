From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 63263] X server crash in nouveau_xv.c:NVPutImage
 (NVCopyNV12ColorPlanes)
Date: Thu, 11 Apr 2013 02:06:59 +0000
Message-ID: <bug-63263-8800-irGmEscAVY@http.bugs.freedesktop.org/>
References: <bug-63263-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0325324434=="
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


--===============0325324434==
Content-Type: multipart/alternative; boundary="1365646019.B737E11.12883"; charset="us-ascii"


--1365646019.B737E11.12883
Date: Thu, 11 Apr 2013 02:06:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=63263

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Looks like my npixels vs line_len guess was right:

[741217.047] (WW) NOUVEAU(0): Inconsistency between NVPutImage and
NVQueryImageAttributes: src_x: 0, src_y: 0, src_w: 512, src_h: 384, top: 0,
left: 102, bottom: 384, right: 512, npixels: 410, nlines: 384, line_len: 416,
srcPitch2: 256, s2offset: 196659, s3offset: 245811, bytes: 49104, size_tmp:
294912, over: 3
[741217.047] (WW) NOUVEAU(0): Went too far: us: 0x7f7e20b6c002, vs:
0x7f7e20b78002, end (non-incl): 0x7f7e20b78000

And the reason I only see it when the picture is off-screen is because normally
the width is already a multiple of 8. Not sure what the right way of fixing it
is though... I think we can just use npixels instead of line_len as the width
parameter. However that will leave the last 1-3 pixels in the dst buffer
uninitialized. Not sure if that's OK.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1365646019.B737E11.12883
Date: Thu, 11 Apr 2013 02:06:59 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63263#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - X server crash in nouveau_xv.c:NVPutImage (NVCopyNV12ColorPlanes)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63263">bug 63263</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Looks like my npixels vs line_len guess was right:

[741217.047] (WW) NOUVEAU(0): Inconsistency between NVPutImage and
NVQueryImageAttributes: src_x: 0, src_y: 0, src_w: 512, src_h: 384, top: 0,
left: 102, bottom: 384, right: 512, npixels: 410, nlines: 384, line_len: 416,
srcPitch2: 256, s2offset: 196659, s3offset: 245811, bytes: 49104, size_tmp:
294912, over: 3
[741217.047] (WW) NOUVEAU(0): Went too far: us: 0x7f7e20b6c002, vs:
0x7f7e20b78002, end (non-incl): 0x7f7e20b78000

And the reason I only see it when the picture is off-screen is because normally
the width is already a multiple of 8. Not sure what the right way of fixing it
is though... I think we can just use npixels instead of line_len as the width
parameter. However that will leave the last 1-3 pixels in the dst buffer
uninitialized. Not sure if that's OK.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1365646019.B737E11.12883--

--===============0325324434==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0325324434==--
