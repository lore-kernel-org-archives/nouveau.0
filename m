From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 111853] nouveau kernel module won't load (not
 available) on Sony laptop with NVIDIA G86M [GeForce 8400M GT] ID: 10de:0426
Date: Sat, 19 Oct 2019 01:09:34 +0000
Message-ID: <bug-111853-8800-4qifdTHumq@http.bugs.freedesktop.org/>
References: <bug-111853-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0976624372=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-111853-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0976624372==
Content-Type: multipart/alternative; boundary="15714473740.6d87A048c.17222"
Content-Transfer-Encoding: 7bit


--15714473740.6d87A048c.17222
Date: Sat, 19 Oct 2019 01:09:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111853

--- Comment #12 from Felix Miata <mrmazda-ihVZJaRskl1bRRN4PJnoQQ@public.gmane.org> ---
AFAICT, the last or nearly the last tty message before screen stops respond=
ing
without acpi=3Doff follows this line:

fb: switching to nouveaufb from VESA VGA

at least, it does if I include vga=3D791 to try to get a reasonable text si=
ze on
the vttys, and avoid all the !!!!!s.

In the currently installed (on owner's HD alongside Win7) openSUSE 15.1 I t=
ried
disabling the built-in video camera with:

module_blacklist=3Duvcvideo,videobuf2_core,videobuf2_memops,videobuf2_v4l2,=
videobuf2_vmalloc,videodev

on cmdline instead of acpi=3Doff, but it had no apparent impact.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15714473740.6d87A048c.17222
Date: Sat, 19 Oct 2019 01:09:34 +0000
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
   title=3D"NEW - nouveau kernel module won't load (not available) on Sony =
laptop with NVIDIA G86M [GeForce 8400M GT] ID: 10de:0426"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111853#c12">Comme=
nt # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nouveau kernel module won't load (not available) on Sony =
laptop with NVIDIA G86M [GeForce 8400M GT] ID: 10de:0426"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111853">bug 11185=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mrmazda&#64;earthlink.net" title=3D"Felix Miata &lt;mrmazda&#64;earthlink.n=
et&gt;"> <span class=3D"fn">Felix Miata</span></a>
</span></b>
        <pre>AFAICT, the last or nearly the last tty message before screen =
stops responding
without acpi=3Doff follows this line:

fb: switching to nouveaufb from VESA VGA

at least, it does if I include vga=3D791 to try to get a reasonable text si=
ze on
the vttys, and avoid all the !!!!!s.

In the currently installed (on owner's HD alongside Win7) openSUSE 15.1 I t=
ried
disabling the built-in video camera with:

module_blacklist=3Duvcvideo,videobuf2_core,videobuf2_memops,videobuf2_v4l2,=
videobuf2_vmalloc,videodev

on cmdline instead of acpi=3Doff, but it had no apparent impact.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15714473740.6d87A048c.17222--

--===============0976624372==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0976624372==--
