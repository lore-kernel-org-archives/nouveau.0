From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99147] xorg hangs at initial startup on linux-4.9.0
Date: Tue, 20 Dec 2016 14:17:54 +0000
Message-ID: <bug-99147-8800-J7ZDT7bSDN@http.bugs.freedesktop.org/>
References: <bug-99147-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0448549503=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99147-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0448549503==
Content-Type: multipart/alternative; boundary="14822434741.fcAe8c.3818";
 charset="UTF-8"


--14822434741.fcAe8c.3818
Date: Tue, 20 Dec 2016 14:17:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99147

--- Comment #8 from Gleb <gleb-97jfqw80gc5Wk0Htik3J/w@public.gmane.org> ---
Created attachment 128590
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D128590&action=3Dedit
1st attempt: before lscpi

TL;DR `lspci` hangs on first invocation

I tried few more things, step by step:
1) removed kernel 4.9.0, modules, config, etc
2) tried 4.8.15 -- everything is fine, no hanging
3) installed 4.9.0 from scratch:
- redownloaded sources (gentoo-sources)
- copied old config from 4.8.{14,15}, so nouveau built as external module
- make silentoldconfig, for everything new I just press <enter>
- built, installed the kernel as did it before with the same steps

Conclusion:
- 4.8.14 -- OK
- 4.8.15 -- OK
- 4.9.0 -- fail (xorg hangs)

Then I tired suggested steps:
- disabled xdm, system boots to text console
- in 2nd attempt additionally disabled libvirtd

In both cases `lspci` just hangs without any output with red D status. At f=
irst
attempt libvirtd also was with red D status, at second there wasn't libvirtd
started.

Userspace stuff with for all actions was the same:
- mesa-13.0.2
- libdrm-2.4.74
- xorg-1.19.0
- xf86-video-intel (snapshot from 12 December 2016)
- xf86-video-nouveau-1.0.13
- libinput-1.5.3
- libevdev 1.5.2

dmesg attached, with "drm.debug=3D0x1e log_buf_len=3D1M", two attemps with =
2 log
files (before invoking lspci and after).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14822434741.fcAe8c.3818
Date: Tue, 20 Dec 2016 14:17:54 +0000
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
   title=3D"NEW - xorg hangs at initial startup on linux-4.9.0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99147#c8">Comment=
 # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - xorg hangs at initial startup on linux-4.9.0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99147">bug 99147<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
gleb&#64;fastmail.com" title=3D"Gleb &lt;gleb&#64;fastmail.com&gt;"> <span =
class=3D"fn">Gleb</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D128590=
" name=3D"attach_128590" title=3D"1st attempt: before lscpi">attachment 128=
590</a> <a href=3D"attachment.cgi?id=3D128590&amp;action=3Dedit" title=3D"1=
st attempt: before lscpi">[details]</a></span>
1st attempt: before lscpi

TL;DR `lspci` hangs on first invocation

I tried few more things, step by step:
1) removed kernel 4.9.0, modules, config, etc
2) tried 4.8.15 -- everything is fine, no hanging
3) installed 4.9.0 from scratch:
- redownloaded sources (gentoo-sources)
- copied old config from 4.8.{14,15}, so nouveau built as external module
- make silentoldconfig, for everything new I just press &lt;enter&gt;
- built, installed the kernel as did it before with the same steps

Conclusion:
- 4.8.14 -- OK
- 4.8.15 -- OK
- 4.9.0 -- fail (xorg hangs)

Then I tired suggested steps:
- disabled xdm, system boots to text console
- in 2nd attempt additionally disabled libvirtd

In both cases `lspci` just hangs without any output with red D status. At f=
irst
attempt libvirtd also was with red D status, at second there wasn't libvirtd
started.

Userspace stuff with for all actions was the same:
- mesa-13.0.2
- libdrm-2.4.74
- xorg-1.19.0
- xf86-video-intel (snapshot from 12 December 2016)
- xf86-video-nouveau-1.0.13
- libinput-1.5.3
- libevdev 1.5.2

dmesg attached, with &quot;drm.debug=3D0x1e log_buf_len=3D1M&quot;, two att=
emps with 2 log
files (before invoking lspci and after).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14822434741.fcAe8c.3818--

--===============0448549503==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0448549503==--
