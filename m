From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104340] Memory leak with GEM objects
Date: Tue, 19 Dec 2017 18:54:16 +0000
Message-ID: <bug-104340-8800-zplTzr9mPj@http.bugs.freedesktop.org/>
References: <bug-104340-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0715994754=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-104340-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0715994754==
Content-Type: multipart/alternative; boundary="15137096561.072ACf.10085";
 charset="UTF-8"


--15137096561.072ACf.10085
Date: Tue, 19 Dec 2017 18:54:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104340

--- Comment #1 from S. Gilles <sgilles-8yXg+M/94Z32fBVCVOL8/A@public.gmane.org> ---
Created attachment 136292
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D136292&action=3Dedit
first few lines of /sys/kernel/debug/kmemleak

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15137096561.072ACf.10085
Date: Tue, 19 Dec 2017 18:54:16 +0000
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
   title=3D"NEW - Memory leak with GEM objects"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104340#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Memory leak with GEM objects"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104340">bug 10434=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
sgilles&#64;math.umd.edu" title=3D"S. Gilles &lt;sgilles&#64;math.umd.edu&g=
t;"> <span class=3D"fn">S. Gilles</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D136292=
" name=3D"attach_136292" title=3D"first few lines of /sys/kernel/debug/kmem=
leak">attachment 136292</a> <a href=3D"attachment.cgi?id=3D136292&amp;actio=
n=3Dedit" title=3D"first few lines of /sys/kernel/debug/kmemleak">[details]=
</a></span>
first few lines of /sys/kernel/debug/kmemleak</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15137096561.072ACf.10085--

--===============0715994754==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0715994754==--
