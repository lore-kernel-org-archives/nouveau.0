From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94990] [GM204] GTX 970 + 4GB VRAM fails at secboot
	(v4.6+)
Date: Wed, 03 May 2017 13:16:53 +0000
Message-ID: <bug-94990-8800-XRO17NpPHR@http.bugs.freedesktop.org/>
References: <bug-94990-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1317867203=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94990-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1317867203==
Content-Type: multipart/alternative; boundary="14938174137.f9467.27340";
 charset="UTF-8"


--14938174137.f9467.27340
Date: Wed, 3 May 2017 13:16:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D94990

--- Comment #120 from Hans Petter Jansson <hpj-hdLLBzy348kXWF+eFR7m5Q@public.gmane.org> ---
Created attachment 131184
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D131184&action=3Dedit
nouveau-fdo94990-linux-4.10.patch

I was able to get my GTX 970 working with KMS on Linux 4.10 by cherry-picki=
ng a
few of Ben's commits from the master branch onto the linux-4.10 branch (see
patch).

These are also available in the linux-4.10 branch of
https://github.com/hpjansson/nouveau.git for convenience.

With this, I can boot and Plymouth and Xorg work fine, but Wayland still
freezes -- however, I think that's caused by a different issue.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14938174137.f9467.27340
Date: Wed, 3 May 2017 13:16:53 +0000
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
   title=3D"NEW - [GM204] GTX 970 + 4GB VRAM fails at secboot (v4.6+)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94990#c120">Comme=
nt # 120</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GM204] GTX 970 + 4GB VRAM fails at secboot (v4.6+)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94990">bug 94990<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
hpj&#64;copyleft.no" title=3D"Hans Petter Jansson &lt;hpj&#64;copyleft.no&g=
t;"> <span class=3D"fn">Hans Petter Jansson</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D131184=
" name=3D"attach_131184" title=3D"nouveau-fdo94990-linux-4.10.patch">attach=
ment 131184</a> <a href=3D"attachment.cgi?id=3D131184&amp;action=3Dedit" ti=
tle=3D"nouveau-fdo94990-linux-4.10.patch">[details]</a></span> <a href=3D'p=
age.cgi?id=3Dsplinter.html&amp;bug=3D94990&amp;attachment=3D131184'>[review=
]</a>
nouveau-fdo94990-linux-4.10.patch

I was able to get my GTX 970 working with KMS on Linux 4.10 by cherry-picki=
ng a
few of Ben's commits from the master branch onto the linux-4.10 branch (see
patch).

These are also available in the linux-4.10 branch of
<a href=3D"https://github.com/hpjansson/nouveau.git">https://github.com/hpj=
ansson/nouveau.git</a> for convenience.

With this, I can boot and Plymouth and Xorg work fine, but Wayland still
freezes -- however, I think that's caused by a different issue.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14938174137.f9467.27340--

--===============1317867203==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1317867203==--
