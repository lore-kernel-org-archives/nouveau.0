From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104413] [NV11] GPU Lockup on GeForce2 MX/MX 400
Date: Fri, 29 Dec 2017 18:52:35 +0000
Message-ID: <bug-104413-8800-Yhod0XNa11@http.bugs.freedesktop.org/>
References: <bug-104413-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0282577262=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-104413-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0282577262==
Content-Type: multipart/alternative; boundary="15145735550.6428D.28133";
 charset="UTF-8"


--15145735550.6428D.28133
Date: Fri, 29 Dec 2017 18:52:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104413

--- Comment #5 from rtentser-o+MxOtu4lMCHXe+LvDLADg@public.gmane.org ---
Created attachment 136448
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D136448&action=3Dedit
dmesg (linux-4.9, modprobe.blacklist=3Di915, nouveau.config=3DNvAGP=3D0)

(a) 128MB is default memory that assigned to onboard video. It's not the AG=
P.
(b) Yes, i had onboard card enabled (Intel Extreme Graphics 2, i915). But t=
hat
wasn't the problem: i try to blacklist the driver and boot still freezed. I
blacklist it now for efficiency and smaller dmesg.
(c) nouveau.config=3DNvAGP=3D2 doesn't work: same thing.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15145735550.6428D.28133
Date: Fri, 29 Dec 2017 18:52:35 +0000
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
   title=3D"NEW - [NV11] GPU Lockup on GeForce2 MX/MX 400"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104413#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV11] GPU Lockup on GeForce2 MX/MX 400"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104413">bug 10441=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rtentser&#64;yandex.ru" title=3D"rtentser&#64;yandex.ru">rtentser&#64;yande=
x.ru</a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D136448=
" name=3D"attach_136448" title=3D"dmesg (linux-4.9, modprobe.blacklist=3Di9=
15, nouveau.config=3DNvAGP=3D0)">attachment 136448</a> <a href=3D"attachmen=
t.cgi?id=3D136448&amp;action=3Dedit" title=3D"dmesg (linux-4.9, modprobe.bl=
acklist=3Di915, nouveau.config=3DNvAGP=3D0)">[details]</a></span>
dmesg (linux-4.9, modprobe.blacklist=3Di915, nouveau.config=3DNvAGP=3D0)

(a) 128MB is default memory that assigned to onboard video. It's not the AG=
P.
(b) Yes, i had onboard card enabled (Intel Extreme Graphics 2, i915). But t=
hat
wasn't the problem: i try to blacklist the driver and boot still freezed. I
blacklist it now for efficiency and smaller dmesg.
(c) nouveau.config=3DNvAGP=3D2 doesn't work: same thing.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15145735550.6428D.28133--

--===============0282577262==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0282577262==--
