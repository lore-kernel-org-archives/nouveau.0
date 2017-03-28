From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100435] [GM107] Kernel 4.10(.6) nouveau_fence_sync
 -> ... dma_fence_default_wait, null spinlock error.
Date: Tue, 28 Mar 2017 18:15:39 +0000
Message-ID: <bug-100435-8800-AzVtATpQn3@http.bugs.freedesktop.org/>
References: <bug-100435-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0738570922=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100435-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0738570922==
Content-Type: multipart/alternative; boundary="14907249380.f9bd.15256";
 charset="UTF-8"


--14907249380.f9bd.15256
Date: Tue, 28 Mar 2017 18:15:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100435

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|Nouveau 1.0.14 crashes      |[GM107] Kernel 4.10(.6)
                   |randomly                    |nouveau_fence_sync -> ...
                   |                            |dma_fence_default_wait,
                   |                            |null spinlock error.

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
1.0.13 didn't have any support for your GPU. GMxxx support is new in 1.0.14.

Previously you were using modesetting either with or without glamor. Either
way, the issue is not in xf86-video-nouveau but rather in the kernel, perha=
ps
something that xf86-video-nouveau does makes the issue more likely to hit t=
han
the GL lib that glamor operates.

There have actually been some separate reports of some kind of fence lifeti=
me
issue, which I'm guessing you're hitting here.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14907249380.f9bd.15256
Date: Tue, 28 Mar 2017 18:15:38 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:imirkin&#=
64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <s=
pan class=3D"fn">Ilia Mirkin</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GM107] Kernel 4.10(.6) nouveau_fence_sync -&gt; ... dma_=
fence_default_wait, null spinlock error."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100435">bug 10043=
5</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Summary</td>
           <td>Nouveau 1.0.14 crashes randomly
           </td>
           <td>[GM107] Kernel 4.10(.6) nouveau_fence_sync -&gt; ... dma_fen=
ce_default_wait, null spinlock error.
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GM107] Kernel 4.10(.6) nouveau_fence_sync -&gt; ... dma_=
fence_default_wait, null spinlock error."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100435#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GM107] Kernel 4.10(.6) nouveau_fence_sync -&gt; ... dma_=
fence_default_wait, null spinlock error."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100435">bug 10043=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>1.0.13 didn't have any support for your GPU. GMxxx support is =
new in 1.0.14.

Previously you were using modesetting either with or without glamor. Either
way, the issue is not in xf86-video-nouveau but rather in the kernel, perha=
ps
something that xf86-video-nouveau does makes the issue more likely to hit t=
han
the GL lib that glamor operates.

There have actually been some separate reports of some kind of fence lifeti=
me
issue, which I'm guessing you're hitting here.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14907249380.f9bd.15256--

--===============0738570922==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0738570922==--
