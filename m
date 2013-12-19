From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 72760] [NV43] gdm hangs,
	sometimes everything else also
Date: Thu, 19 Dec 2013 11:49:10 +0000
Message-ID: <bug-72760-8800-Uiah4vNkZS@http.bugs.freedesktop.org/>
References: <bug-72760-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0309520938=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-72760-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0309520938==
Content-Type: multipart/alternative; boundary="1387453750.ECC221.18222"; charset="us-ascii"


--1387453750.ECC221.18222
Date: Thu, 19 Dec 2013 11:49:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D72760

--- Comment #2 from Jakub Klawiter <jklawiter-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 90990
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D90990&action=3Dedit
dmesg output made on 19.12.2013 with nouveau.config=3DNvPCIE=3D0 option

First of all in the meantime i've bought new GfX card (also nvidia) and it =
is
working fine so rest of my hardware is probably ok.
maybe the old one is broken. No idea how to test it.

I've added nouveau.config=3DNvPCIE=3D0 option. This time it died in a littl=
e other
way.
I'm attaching dmesg output.=20

The last line (about gnome shell) appeard there after i've tried:

# systemctl status gdm

with this output (I don't know if it is interesting to you).

gdm.service - GNOME Display Manager
   Loaded: loaded (/usr/lib64/systemd/system/gdm.service; enabled)
   Active: active (running) since czw 2013-12-19 12:23:43 CET; 24min ago
 Main PID: 169 (gdm)
   CGroup: /system.slice/gdm.service
           =E2=94=9C=E2=94=80 169 /usr/sbin/gdm
           =E2=94=9C=E2=94=801301 /usr/libexec/gdm-simple-slave --display-id
/org/gnome/DisplayManager/Displays/_0
           =E2=94=94=E2=94=801305 /usr/bin/Xorg :0 -background none -verbos=
e -auth
/run/gdm/auth-for-gdm-iV9gRm/database -sea...

gru 19 12:23:43 mickey systemd[1]: Started GNOME Display Manager.
gru 19 12:23:49 mickey gdm[169]: Failed to give slave programs access to the
display. Trying to proceed.
gru 19 12:24:49 mickey gdm[169]: Failed to remove slave program access to t=
he
display. Trying to proceed.
gru 19 12:38:15 mickey gdm[169]: Child process 183 was already dead.
gru 19 12:38:15 mickey gdm[169]: Child process 183 was already dead.
gru 19 12:38:15 mickey gdm[169]: GLib-GObject: g_object_ref: assertion
`object->ref_count > 0' failed
gru 19 12:38:15 mickey gdm[169]: GLib-GObject: g_object_unref: assertion
`object->ref_count > 0' failed
gru 19 12:38:15 mickey gdm[169]: Failed to give slave programs access to the
display. Trying to proceed.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1387453750.ECC221.18222
Date: Thu, 19 Dec 2013 11:49:10 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NV43] gdm hangs, sometimes everything else also"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D72760#c2">Comment=
 # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NV43] gdm hangs, sometimes everything else also"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D72760">bug 72760<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jklawiter&#64;gmail.com" title=3D"Jakub Klawiter &lt;jklawiter&#64;gmail.co=
m&gt;"> <span class=3D"fn">Jakub Klawiter</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D90990"=
 name=3D"attach_90990" title=3D"dmesg output made on 19.12.2013 with nouvea=
u.config=3DNvPCIE=3D0 option">attachment 90990</a> <a href=3D"attachment.cg=
i?id=3D90990&amp;action=3Dedit" title=3D"dmesg output made on 19.12.2013 wi=
th nouveau.config=3DNvPCIE=3D0 option">[details]</a></span>
dmesg output made on 19.12.2013 with nouveau.config=3DNvPCIE=3D0 option

First of all in the meantime i've bought new GfX card (also nvidia) and it =
is
working fine so rest of my hardware is probably ok.
maybe the old one is broken. No idea how to test it.

I've added nouveau.config=3DNvPCIE=3D0 option. This time it died in a littl=
e other
way.
I'm attaching dmesg output.=20

The last line (about gnome shell) appeard there after i've tried:

# systemctl status gdm

with this output (I don't know if it is interesting to you).

gdm.service - GNOME Display Manager
   Loaded: loaded (/usr/lib64/systemd/system/gdm.service; enabled)
   Active: active (running) since czw 2013-12-19 12:23:43 CET; 24min ago
 Main PID: 169 (gdm)
   CGroup: /system.slice/gdm.service
           =E2=94=9C=E2=94=80 169 /usr/sbin/gdm
           =E2=94=9C=E2=94=801301 /usr/libexec/gdm-simple-slave --display-id
/org/gnome/DisplayManager/Displays/_0
           =E2=94=94=E2=94=801305 /usr/bin/Xorg :0 -background none -verbos=
e -auth
/run/gdm/auth-for-gdm-iV9gRm/database -sea...

gru 19 12:23:43 mickey systemd[1]: Started GNOME Display Manager.
gru 19 12:23:49 mickey gdm[169]: Failed to give slave programs access to the
display. Trying to proceed.
gru 19 12:24:49 mickey gdm[169]: Failed to remove slave program access to t=
he
display. Trying to proceed.
gru 19 12:38:15 mickey gdm[169]: Child process 183 was already dead.
gru 19 12:38:15 mickey gdm[169]: Child process 183 was already dead.
gru 19 12:38:15 mickey gdm[169]: GLib-GObject: g_object_ref: assertion
`object-&gt;ref_count &gt; 0' failed
gru 19 12:38:15 mickey gdm[169]: GLib-GObject: g_object_unref: assertion
`object-&gt;ref_count &gt; 0' failed
gru 19 12:38:15 mickey gdm[169]: Failed to give slave programs access to the
display. Trying to proceed.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1387453750.ECC221.18222--

--===============0309520938==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0309520938==--
