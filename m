From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 110996] swaywm (wayland) crashes when turning off
 monitors through dpms
Date: Tue, 25 Jun 2019 16:40:00 +0000
Message-ID: <bug-110996-8800-0hRCl0UOyQ@http.bugs.freedesktop.org/>
References: <bug-110996-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0813009700=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-110996-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0813009700==
Content-Type: multipart/alternative; boundary="15614807991.D7e67.20469"
Content-Transfer-Encoding: 7bit


--15614807991.D7e67.20469
Date: Tue, 25 Jun 2019 16:39:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110996

--- Comment #2 from Sjon <sjon-bheiZbv1XdVtjaSKtHux1w@public.gmane.org> ---
Created attachment 144636
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144636&action=3Dedit
filtered kernel messages with drm.debug=3D0x14 nouveau.debug=3Ddisp=3Dtrace

I'm not sure what caused the 'core notifier timeout' messages to start - but
there was at least half an hour between that error and the actual crash. I'=
ll
attach the requested log - it's huge and doesn't show the same hang. The
problem did occur, my monitors turned off and my machine needed a reboot

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15614807991.D7e67.20469
Date: Tue, 25 Jun 2019 16:39:59 +0000
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
   title=3D"NEW - swaywm (wayland) crashes when turning off monitors throug=
h dpms"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110996#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - swaywm (wayland) crashes when turning off monitors throug=
h dpms"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110996">bug 11099=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
sjon&#64;hortensius.net" title=3D"Sjon &lt;sjon&#64;hortensius.net&gt;"> <s=
pan class=3D"fn">Sjon</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144636=
" name=3D"attach_144636" title=3D"filtered kernel messages with drm.debug=
=3D0x14 nouveau.debug=3Ddisp=3Dtrace">attachment 144636</a> <a href=3D"atta=
chment.cgi?id=3D144636&amp;action=3Dedit" title=3D"filtered kernel messages=
 with drm.debug=3D0x14 nouveau.debug=3Ddisp=3Dtrace">[details]</a></span>
filtered kernel messages with drm.debug=3D0x14 nouveau.debug=3Ddisp=3Dtrace

I'm not sure what caused the 'core notifier timeout' messages to start - but
there was at least half an hour between that error and the actual crash. I'=
ll
attach the requested log - it's huge and doesn't show the same hang. The
problem did occur, my monitors turned off and my machine needed a reboot</p=
re>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15614807991.D7e67.20469--

--===============0813009700==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0813009700==--
