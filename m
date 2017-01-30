From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99396] Crash in nouveau_dri.so when switching apps
 with alt-tab in Gnome
Date: Mon, 30 Jan 2017 09:08:06 +0000
Message-ID: <bug-99396-8800-3nTkBjn101@http.bugs.freedesktop.org/>
References: <bug-99396-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0371019263=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99396-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0371019263==
Content-Type: multipart/alternative; boundary="14857672860.a14C8.26558";
 charset="UTF-8"


--14857672860.a14C8.26558
Date: Mon, 30 Jan 2017 09:08:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99396

--- Comment #5 from Per Arnold Blaasmo <per.arnold-E3z7vgVcB3VuMpJDpNschA@public.gmane.org> ---
I seem to experience the same problem.
I am using Fedora 25.
gnome-shell-3.22.2-2.fc25.x86_64
kernel-4.9.5-200.fc25.x86_64
xorg-x11-drv-nouveau-1.0.13-1.fc25.x86_64
mesa 13.0.3-1.fc25.x86_64

Not sure if it is related, but in the system log I get:

jan. 30 08:45:43 nordt0206.corp.atmel.com kernel: nouveau 0000:02:00.0:
gnome-shell[18725]: fail ttm_validate
jan. 30 08:45:43 nordt0206.corp.atmel.com kernel: nouveau 0000:02:00.0:
gnome-shell[18725]: validating bo list
jan. 30 08:45:43 nordt0206.corp.atmel.com kernel: nouveau 0000:02:00.0:
gnome-shell[18725]: validate: -12
jan. 30 08:45:43 nordt0206.corp.atmel.com kernel: nouveau 0000:02:00.0:
gnome-shell[18725]: fail ttm_validate
jan. 30 08:45:43 nordt0206.corp.atmel.com kernel: nouveau 0000:02:00.0:
gnome-shell[18725]: validating bo list
jan. 30 08:45:43 nordt0206.corp.atmel.com kernel: nouveau 0000:02:00.0:
gnome-shell[18725]: validate: -12
jan. 30 08:45:43 nordt0206.corp.atmel.com kernel: nouveau 0000:02:00.0:
gnome-shell[18725]: fail ttm_validate
jan. 30 08:45:43 nordt0206.corp.atmel.com kernel: nouveau 0000:02:00.0:
gnome-shell[18725]: validating bo list
jan. 30 08:45:43 nordt0206.corp.atmel.com kernel: nouveau 0000:02:00.0:
gnome-shell[18725]: validate: -12

...

jan. 30 08:46:21 nordt0206.corp.atmel.com org.gnome.Shell.desktop[18725]:
nouveau: kernel rejected pushbuf: Cannot allocate memory
jan. 30 08:46:21 nordt0206.corp.atmel.com org.gnome.Shell.desktop[18725]:
nouveau: ch2: krec 0 pushes 1 bufs 54 relocs 0
jan. 30 08:46:21 nordt0206.corp.atmel.com org.gnome.Shell.desktop[18725]:
nouveau: ch2: buf 00000000 00000002 00000004 00000004 00000000
jan. 30 08:46:21 nordt0206.corp.atmel.com org.gnome.Shell.desktop[18725]:
nouveau: ch2: buf 00000001 00000006 00000004 00000000 00000004
jan. 30 08:46:21 nordt0206.corp.atmel.com org.gnome.Shell.desktop[18725]:
nouveau: ch2: buf 00000002 00000077 00000004 00000004 00000000
....

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14857672860.a14C8.26558
Date: Mon, 30 Jan 2017 09:08:06 +0000
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
   title=3D"NEW - Crash in nouveau_dri.so when switching apps with alt-tab =
in Gnome"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99396#c5">Comment=
 # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crash in nouveau_dri.so when switching apps with alt-tab =
in Gnome"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99396">bug 99396<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
per.arnold&#64;blaasmo.no" title=3D"Per Arnold Blaasmo &lt;per.arnold&#64;b=
laasmo.no&gt;"> <span class=3D"fn">Per Arnold Blaasmo</span></a>
</span></b>
        <pre>I seem to experience the same problem.
I am using Fedora 25.
gnome-shell-3.22.2-2.fc25.x86_64
kernel-4.9.5-200.fc25.x86_64
xorg-x11-drv-nouveau-1.0.13-1.fc25.x86_64
mesa 13.0.3-1.fc25.x86_64

Not sure if it is related, but in the system log I get:

jan. 30 08:45:43 nordt0206.corp.atmel.com kernel: nouveau 0000:02:00.0:
gnome-shell[18725]: fail ttm_validate
jan. 30 08:45:43 nordt0206.corp.atmel.com kernel: nouveau 0000:02:00.0:
gnome-shell[18725]: validating bo list
jan. 30 08:45:43 nordt0206.corp.atmel.com kernel: nouveau 0000:02:00.0:
gnome-shell[18725]: validate: -12
jan. 30 08:45:43 nordt0206.corp.atmel.com kernel: nouveau 0000:02:00.0:
gnome-shell[18725]: fail ttm_validate
jan. 30 08:45:43 nordt0206.corp.atmel.com kernel: nouveau 0000:02:00.0:
gnome-shell[18725]: validating bo list
jan. 30 08:45:43 nordt0206.corp.atmel.com kernel: nouveau 0000:02:00.0:
gnome-shell[18725]: validate: -12
jan. 30 08:45:43 nordt0206.corp.atmel.com kernel: nouveau 0000:02:00.0:
gnome-shell[18725]: fail ttm_validate
jan. 30 08:45:43 nordt0206.corp.atmel.com kernel: nouveau 0000:02:00.0:
gnome-shell[18725]: validating bo list
jan. 30 08:45:43 nordt0206.corp.atmel.com kernel: nouveau 0000:02:00.0:
gnome-shell[18725]: validate: -12

...

jan. 30 08:46:21 nordt0206.corp.atmel.com org.gnome.Shell.desktop[18725]:
nouveau: kernel rejected pushbuf: Cannot allocate memory
jan. 30 08:46:21 nordt0206.corp.atmel.com org.gnome.Shell.desktop[18725]:
nouveau: ch2: krec 0 pushes 1 bufs 54 relocs 0
jan. 30 08:46:21 nordt0206.corp.atmel.com org.gnome.Shell.desktop[18725]:
nouveau: ch2: buf 00000000 00000002 00000004 00000004 00000000
jan. 30 08:46:21 nordt0206.corp.atmel.com org.gnome.Shell.desktop[18725]:
nouveau: ch2: buf 00000001 00000006 00000004 00000000 00000004
jan. 30 08:46:21 nordt0206.corp.atmel.com org.gnome.Shell.desktop[18725]:
nouveau: ch2: buf 00000002 00000077 00000004 00000004 00000000
....</pre>
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

--14857672860.a14C8.26558--

--===============0371019263==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0371019263==--
