From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100545] BUG: null pointer dereference
 dma_fence_wait_timeout from nouveau_drm_ioctl (linux 4.10.5)
Date: Tue, 04 Apr 2017 06:52:18 +0000
Message-ID: <bug-100545-8800-SenjqNctHQ@http.bugs.freedesktop.org/>
References: <bug-100545-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1555767578=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100545-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1555767578==
Content-Type: multipart/alternative; boundary="14912887380.aFcfEA744.25158";
 charset="UTF-8"


--14912887380.aFcfEA744.25158
Date: Tue, 4 Apr 2017 06:52:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100545

--- Comment #1 from Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> ---
Most likely the same root cause as #100431, i.e., use-after-tree of a dma_f=
ence
object on nv50

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14912887380.aFcfEA744.25158
Date: Tue, 4 Apr 2017 06:52:18 +0000
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
   title=3D"NEW - BUG: null pointer dereference dma_fence_wait_timeout from=
 nouveau_drm_ioctl (linux 4.10.5)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100545#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - BUG: null pointer dereference dma_fence_wait_timeout from=
 nouveau_drm_ioctl (linux 4.10.5)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100545">bug 10054=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ard.biesheuvel&#64;linaro.org" title=3D"Ard Biesheuvel &lt;ard.biesheuvel&#=
64;linaro.org&gt;"> <span class=3D"fn">Ard Biesheuvel</span></a>
</span></b>
        <pre>Most likely the same root cause as #100431, i.e., use-after-tr=
ee of a dma_fence
object on nv50</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14912887380.aFcfEA744.25158--

--===============1555767578==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1555767578==--
