From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 107959] System hangs up when loading nouveau for
 NVIDIA MX150 card
Date: Mon, 17 Sep 2018 08:34:43 +0000
Message-ID: <bug-107959-8800-dzd7JNjwqG@http.bugs.freedesktop.org/>
References: <bug-107959-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0355305273=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-107959-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0355305273==
Content-Type: multipart/alternative; boundary="15371732831.7dccb3f4.16501"
Content-Transfer-Encoding: 7bit


--15371732831.7dccb3f4.16501
Date: Mon, 17 Sep 2018 08:34:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107959

--- Comment #1 from jian-hong-6IF/jdPJHihWk0Htik3J/w@public.gmane.org ---
Created attachment 141594
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D141594&action=3Dedit
dmesg when use nvidia driver

I also has tried nvidia proprietary driver (390.77 and 390.87) with Linux 4=
.18.
But I got the error messages:

[   30.160277] NVRM: failed to copy vbios to system memory.
[   30.160439] NVRM: RmInitAdapter failed! (0x30:0xffff:663)
[   30.160524] NVRM: rm_init_adapter failed for device bearing minor number=
 0

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15371732831.7dccb3f4.16501
Date: Mon, 17 Sep 2018 08:34:43 +0000
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
   title=3D"NEW - System hangs up when loading nouveau for NVIDIA MX150 car=
d"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107959#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - System hangs up when loading nouveau for NVIDIA MX150 car=
d"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107959">bug 10795=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jian-hong&#64;endlessm.com" title=3D"jian-hong&#64;endlessm.com">jian-hong&=
#64;endlessm.com</a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D141594=
" name=3D"attach_141594" title=3D"dmesg when use nvidia driver">attachment =
141594</a> <a href=3D"attachment.cgi?id=3D141594&amp;action=3Dedit" title=
=3D"dmesg when use nvidia driver">[details]</a></span>
dmesg when use nvidia driver

I also has tried nvidia proprietary driver (390.77 and 390.87) with Linux 4=
.18.
But I got the error messages:

[   30.160277] NVRM: failed to copy vbios to system memory.
[   30.160439] NVRM: RmInitAdapter failed! (0x30:0xffff:663)
[   30.160524] NVRM: rm_init_adapter failed for device bearing minor number=
 0</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15371732831.7dccb3f4.16501--

--===============0355305273==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0355305273==--
