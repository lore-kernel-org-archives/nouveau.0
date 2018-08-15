From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104181] [NV50/G94] system freeze on youtube with
 epiphany 3.26
Date: Wed, 15 Aug 2018 16:47:57 +0000
Message-ID: <bug-104181-8800-n0DfQbg5rs@http.bugs.freedesktop.org/>
References: <bug-104181-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1016195439=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-104181-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1016195439==
Content-Type: multipart/alternative; boundary="15343516772.28Bd4BC.22380"
Content-Transfer-Encoding: 7bit


--15343516772.28Bd4BC.22380
Date: Wed, 15 Aug 2018 16:47:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104181

--- Comment #6 from guido-D1bseh+SzQikhjTqA1DzBQ@public.gmane.org ---
At the moment, the only solution is to add the following line to
/etc/X11/xorg.conf (under Section "Device"):

Option "NoAccel" "true"

because setting the kernel module option "noaccel=3D1" also leads to a cras=
h due
to some other silly bug !

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15343516772.28Bd4BC.22380
Date: Wed, 15 Aug 2018 16:47:57 +0000
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
   title=3D"NEW - [NV50/G94] system freeze on youtube with epiphany 3.26"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104181#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV50/G94] system freeze on youtube with epiphany 3.26"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104181">bug 10418=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
guido&#64;trentalancia.com" title=3D"guido&#64;trentalancia.com">guido&#64;=
trentalancia.com</a>
</span></b>
        <pre>At the moment, the only solution is to add the following line =
to
/etc/X11/xorg.conf (under Section &quot;Device&quot;):

Option &quot;NoAccel&quot; &quot;true&quot;

because setting the kernel module option &quot;noaccel=3D1&quot; also leads=
 to a crash due
to some other silly bug !</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15343516772.28Bd4BC.22380--

--===============1016195439==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1016195439==--
