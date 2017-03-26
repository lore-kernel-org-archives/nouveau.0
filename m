From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99584] XVMC on nv43 class card broken with recent
 mesa + kernel.
Date: Sun, 26 Mar 2017 05:38:02 +0000
Message-ID: <bug-99584-8800-73w7Zo69sj@http.bugs.freedesktop.org/>
References: <bug-99584-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0791033716=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99584-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0791033716==
Content-Type: multipart/alternative; boundary="14905066821.7AAdD.15814";
 charset="UTF-8"


--14905066821.7AAdD.15814
Date: Sun, 26 Mar 2017 05:38:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99584

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Er, scratch that. I guess the board doesn't have enough power when there's a
second GPU in another PCIe slot. It comes up fine now, and I get the same
issue.

Looks like this bit of nvkm_ioctl_new is somehow failing with -ENODEV. My
latest theory is:

nvkm_fifo_chan_child_new calls engine_ctor (nv40_fifo_dma_engine_ctor), whi=
ch
in turn calls nvkm_object_bind() on something it's not supposed to (like the
engine object, I think), which in turn returns -ENODEV as there's no bind
pointer. I suspect the solution here is to add a dummy .bind to nv31_mpeg_c=
han,
since the binding effectively happens at chan_new time. Or we could move the
mpeg->chan check to the bind action.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14905066821.7AAdD.15814
Date: Sun, 26 Mar 2017 05:38:02 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - XVMC on nv43 class card broken with recent mesa + kernel."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99584#c6">Comment=
 # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - XVMC on nv43 class card broken with recent mesa + kernel."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99584">bug 99584<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Er, scratch that. I guess the board doesn't have enough power =
when there's a
second GPU in another PCIe slot. It comes up fine now, and I get the same
issue.

Looks like this bit of nvkm_ioctl_new is somehow failing with -ENODEV. My
latest theory is:

nvkm_fifo_chan_child_new calls engine_ctor (nv40_fifo_dma_engine_ctor), whi=
ch
in turn calls nvkm_object_bind() on something it's not supposed to (like the
engine object, I think), which in turn returns -ENODEV as there's no bind
pointer. I suspect the solution here is to add a dummy .bind to nv31_mpeg_c=
han,
since the binding effectively happens at chan_new time. Or we could move the
mpeg-&gt;chan check to the bind action.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14905066821.7AAdD.15814--

--===============0791033716==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0791033716==--
