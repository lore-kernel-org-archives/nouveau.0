From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93557] Kernel Panic on Linux Kernel 4.4 when loading
 KDE/KDM on Nvidia GeForce 7025 / nForce 630a
Date: Fri, 27 Jul 2018 22:02:53 +0000
Message-ID: <bug-93557-8800-6q4jyYcYTD@http.bugs.freedesktop.org/>
References: <bug-93557-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0391176113=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93557-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0391176113==
Content-Type: multipart/alternative; boundary="15327289732.6a62AdFC.14003"
Content-Transfer-Encoding: 7bit


--15327289732.6a62AdFC.14003
Date: Fri, 27 Jul 2018 22:02:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D93557

--- Comment #10 from mirh <mirh-g/b1ySJe57IkP3XJZ0H8fw@public.gmane.org> ---
Created attachment 140859
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D140859&action=3Dedit
One taken with steps on the ubuntu page, the other with those from kernel d=
ocs

My traces, from manjaro with kernel 4.14 and nvidia 304.137

Mesa 18.1 isn't indeed causing kernel panics, but that MMIO fault error is
everywhere

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15327289732.6a62AdFC.14003
Date: Fri, 27 Jul 2018 22:02:53 +0000
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
   title=3D"NEW - Kernel Panic on Linux Kernel 4.4 when loading KDE/KDM on =
Nvidia GeForce 7025 / nForce 630a"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93557#c10">Commen=
t # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Kernel Panic on Linux Kernel 4.4 when loading KDE/KDM on =
Nvidia GeForce 7025 / nForce 630a"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93557">bug 93557<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mirh&#64;protonmail.ch" title=3D"mirh &lt;mirh&#64;protonmail.ch&gt;"> <spa=
n class=3D"fn">mirh</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D140859=
" name=3D"attach_140859" title=3D"One taken with steps on the ubuntu page, =
the other with those from kernel docs">attachment 140859</a> <a href=3D"att=
achment.cgi?id=3D140859&amp;action=3Dedit" title=3D"One taken with steps on=
 the ubuntu page, the other with those from kernel docs">[details]</a></spa=
n>
One taken with steps on the ubuntu page, the other with those from kernel d=
ocs

My traces, from manjaro with kernel 4.14 and nvidia 304.137

Mesa 18.1 isn't indeed causing kernel panics, but that MMIO fault error is
everywhere</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15327289732.6a62AdFC.14003--

--===============0391176113==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0391176113==--
