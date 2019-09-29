From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 111853] nouveau kernel module won't load (not
 available) on Sony laptop with NVIDIA G86M [GeForce 8400M GT] ID: 10de:0426
Date: Sun, 29 Sep 2019 20:41:13 +0000
Message-ID: <bug-111853-8800-UEGS6ysitq@http.bugs.freedesktop.org/>
References: <bug-111853-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2129776309=="
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


--===============2129776309==
Content-Type: multipart/alternative; boundary="15697896731.7AbCDdb58.11924"
Content-Transfer-Encoding: 7bit


--15697896731.7AbCDdb58.11924
Date: Sun, 29 Sep 2019 20:41:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111853

--- Comment #2 from Felix Miata <mrmazda-ihVZJaRskl1bRRN4PJnoQQ@public.gmane.org> ---
How?
e.g. on Tumbleweed:
Nothing in /etc/mo*/ contains veau
Nothing in /etc/ is named *veau*
# lspci | grep -i vidia
01:00.0 VGA compatible controller: NVIDIA Corporation G86M [GeForce 8400M G=
T]
(rev a1)
# uname -a
Linux vaio 5.3.1-2.g3354216-vanilla #1 SMP Thu Sep 26 06:05:47 UTC 2019
(3354216) x86_64 x86_64 x86_64 GNU/Linux
# cat /proc/cmdline
root=3D/dev/sda9 ipv6.disable=3D1 net.ifnames=3D0 noresume mitigations=3Dau=
to
consoleblank=3D0 drm.debug=3D0x1e log_buf_len=3D1M acpi=3Doff 3
# pwd
/lib/modules/5.3.1-2.g3354216-vanilla/kernel/drivers/gpu/drm/nouveau
ls -l | grep veau
-rw-r--r-- 1 root root 645980 Sep 27 05:03 nouveau.ko.xz
# zcat /proc/config.gz | grep -i veau
CONFIG_DRM_NOUVEAU=3Dm
# CONFIG_NOUVEAU_LEGACY_CTX_SUPPORT is not set
CONFIG_NOUVEAU_DEBUG=3D5
CONFIG_NOUVEAU_DEBUG_DEFAULT=3D3
# CONFIG_NOUVEAU_DEBUG_MMU is not set
CONFIG_DRM_NOUVEAU_BACKLIGHT=3Dy
CONFIG_DRM_NOUVEAU_SVM=3Dy
# modprobe nouveau
modprobe: ERROR: could not insert 'nouveau': No such device

How could it be blacklisted, and why does modprobe claim there is no such
device?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15697896731.7AbCDdb58.11924
Date: Sun, 29 Sep 2019 20:41:13 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111853#c2">Commen=
t # 2</a>
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
        <pre>How?
e.g. on Tumbleweed:
Nothing in /etc/mo*/ contains veau
Nothing in /etc/ is named *veau*
# lspci | grep -i vidia
01:00.0 VGA compatible controller: NVIDIA Corporation G86M [GeForce 8400M G=
T]
(rev a1)
# uname -a
Linux vaio 5.3.1-2.g3354216-vanilla #1 SMP Thu Sep 26 06:05:47 UTC 2019
(3354216) x86_64 x86_64 x86_64 GNU/Linux
# cat /proc/cmdline
root=3D/dev/sda9 ipv6.disable=3D1 net.ifnames=3D0 noresume mitigations=3Dau=
to
consoleblank=3D0 drm.debug=3D0x1e log_buf_len=3D1M acpi=3Doff 3
# pwd
/lib/modules/5.3.1-2.g3354216-vanilla/kernel/drivers/gpu/drm/nouveau
ls -l | grep veau
-rw-r--r-- 1 root root 645980 Sep 27 05:03 nouveau.ko.xz
# zcat /proc/config.gz | grep -i veau
CONFIG_DRM_NOUVEAU=3Dm
# CONFIG_NOUVEAU_LEGACY_CTX_SUPPORT is not set
CONFIG_NOUVEAU_DEBUG=3D5
CONFIG_NOUVEAU_DEBUG_DEFAULT=3D3
# CONFIG_NOUVEAU_DEBUG_MMU is not set
CONFIG_DRM_NOUVEAU_BACKLIGHT=3Dy
CONFIG_DRM_NOUVEAU_SVM=3Dy
# modprobe nouveau
modprobe: ERROR: could not insert 'nouveau': No such device

How could it be blacklisted, and why does modprobe claim there is no such
device?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15697896731.7AbCDdb58.11924--

--===============2129776309==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============2129776309==--
