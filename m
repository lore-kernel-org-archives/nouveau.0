From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94725] Nouveau driver fails to poweron GPU on GM204
 after dynamic poweroff
Date: Mon, 02 Jan 2017 10:50:58 +0000
Message-ID: <bug-94725-8800-h0JaPmqmYf@http.bugs.freedesktop.org/>
References: <bug-94725-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1128919484=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94725-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1128919484==
Content-Type: multipart/alternative; boundary="14833542581.dEA9588E.1343";
 charset="UTF-8"


--14833542581.dEA9588E.1343
Date: Mon, 2 Jan 2017 10:50:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D94725

--- Comment #30 from rmokkink <rob-RP4/FvDI4dbkQYj/0HfcvtBPR1lH4CV8@public.gmane.org> ---
Hi,

I have the same problems with my new MSI GP62 6QF laptop.
It has a geforce gtx960m videocard. I installed fedora 25 on it. The only w=
ay
to login into the system (gnome) was to disable the nouveau powermanagement
with grub option nouveau.runpm=3D0.

I did manage to login into the system with option:
acpi_osi=3D! "acpi_os=3DWindows 2013"

In /sys/kernel/debug/vgaswitcheroo/switch is see the following:
0:IGD:+:Pwr:0000:00:02.0
1:DIS: :DynOff:0000:01:00.0

But it looks like it is not working properly, i see the red light on the po=
wer
button, meaning the other card is active as well.

I also tried the option:

i915.modeset=3D-1 nouveau.runpm=3D-1, occasionally i can login, but the the=
 system
freezes completely.

It this a kernel bug or nouveau bug?

Thanks.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14833542581.dEA9588E.1343
Date: Mon, 2 Jan 2017 10:50:58 +0000
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
   title=3D"NEW - Nouveau driver fails to poweron GPU on GM204 after dynami=
c poweroff"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94725#c30">Commen=
t # 30</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau driver fails to poweron GPU on GM204 after dynami=
c poweroff"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94725">bug 94725<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rob&#64;mokkinksystems.com" title=3D"rmokkink &lt;rob&#64;mokkinksystems.co=
m&gt;"> <span class=3D"fn">rmokkink</span></a>
</span></b>
        <pre>Hi,

I have the same problems with my new MSI GP62 6QF laptop.
It has a geforce gtx960m videocard. I installed fedora 25 on it. The only w=
ay
to login into the system (gnome) was to disable the nouveau powermanagement
with grub option nouveau.runpm=3D0.

I did manage to login into the system with option:
acpi_osi=3D! &quot;acpi_os=3DWindows 2013&quot;

In /sys/kernel/debug/vgaswitcheroo/switch is see the following:
0:IGD:+:Pwr:0000:00:02.0
1:DIS: :DynOff:0000:01:00.0

But it looks like it is not working properly, i see the red light on the po=
wer
button, meaning the other card is active as well.

I also tried the option:

i915.modeset=3D-1 nouveau.runpm=3D-1, occasionally i can login, but the the=
 system
freezes completely.

It this a kernel bug or nouveau bug?

Thanks.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14833542581.dEA9588E.1343--

--===============1128919484==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1128919484==--
