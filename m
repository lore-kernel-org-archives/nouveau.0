From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90626] HP ZBook 15 nouveau driver hangup for kernel
	>= 4.1
Date: Sat, 07 Nov 2015 00:31:57 +0000
Message-ID: <bug-90626-8800-pVHlenG4zt@http.bugs.freedesktop.org/>
References: <bug-90626-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1053647851=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90626-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1053647851==
Content-Type: multipart/alternative; boundary="1446856317.B0afD3.25173"; charset="UTF-8"


--1446856317.B0afD3.25173
Date: Sat, 7 Nov 2015 00:31:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90626

--- Comment #36 from vdanjean-GANU6spQydw@public.gmane.org <vdanjean.ml-GANU6spQydw@public.gmane.org> ---
I suffer from the same bug on HP ZBook. However, with the last Debian kernel
(ie plain 4.3), I still got an 'error -22' and no "pmu: hw bug workaround
enabled" log:

$ dmesg | grep nouveau
[    0.000000] Command line: BOOT_IMAGE=/vmlinuz-4.3.0-trunk-amd64
root=/dev/mapper/eyak-root ro nouveau.config=War00C800_0=1 apparmor=1
security=apparmor quiet
[    0.000000] Kernel command line: BOOT_IMAGE=/vmlinuz-4.3.0-trunk-amd64
root=/dev/mapper/eyak-root ro nouveau.config=War00C800_0=1 apparmor=1
security=apparmor quiet
[    4.459102] nouveau 0000:01:00.0: enabling device (0000 -> 0003)
[    4.459126] nouveau 0000:01:00.0: NVIDIA GK208 (108390a1)
[    4.462991] nouveau 0000:01:00.0: bios: version 80.28.52.00.09
[    4.462994] nouveau 0000:01:00.0: mxm: BIOS version 3.0
[    4.462995] nouveau 0000:01:00.0: bios: unknown ddc map v00
[    4.463695] nouveau 0000:01:00.0: devinit: 0xce73[0]: unknown opcode 0x00
[    4.463699] nouveau 0000:01:00.0: preinit failed with -22
[    4.463718] nouveau: DRM:dddddddd:00000080: init failed with -22
[    4.464046] nouveau: probe of 0000:01:00.0 failed with error -22

I will put in attachment the result of acpidump on my machine.

  Regards,
    Vincent

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1446856317.B0afD3.25173
Date: Sat, 7 Nov 2015 00:31:57 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - HP ZBook 15 nouveau driver hangup for kernel &gt;= 4.1"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90626#c36">Comment # 36</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - HP ZBook 15 nouveau driver hangup for kernel &gt;= 4.1"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90626">bug 90626</a>
              from <span class="vcard"><a class="email" href="mailto:vdanjean.ml&#64;free.fr" title="vdanjean&#64;free.fr &lt;vdanjean.ml&#64;free.fr&gt;"> <span class="fn">vdanjean&#64;free.fr</span></a>
</span></b>
        <pre>I suffer from the same bug on HP ZBook. However, with the last Debian kernel
(ie plain 4.3), I still got an 'error -22' and no &quot;pmu: hw bug workaround
enabled&quot; log:

$ dmesg | grep nouveau
[    0.000000] Command line: BOOT_IMAGE=/vmlinuz-4.3.0-trunk-amd64
root=/dev/mapper/eyak-root ro nouveau.config=War00C800_0=1 apparmor=1
security=apparmor quiet
[    0.000000] Kernel command line: BOOT_IMAGE=/vmlinuz-4.3.0-trunk-amd64
root=/dev/mapper/eyak-root ro nouveau.config=War00C800_0=1 apparmor=1
security=apparmor quiet
[    4.459102] nouveau 0000:01:00.0: enabling device (0000 -&gt; 0003)
[    4.459126] nouveau 0000:01:00.0: NVIDIA GK208 (108390a1)
[    4.462991] nouveau 0000:01:00.0: bios: version 80.28.52.00.09
[    4.462994] nouveau 0000:01:00.0: mxm: BIOS version 3.0
[    4.462995] nouveau 0000:01:00.0: bios: unknown ddc map v00
[    4.463695] nouveau 0000:01:00.0: devinit: 0xce73[0]: unknown opcode 0x00
[    4.463699] nouveau 0000:01:00.0: preinit failed with -22
[    4.463718] nouveau: DRM:dddddddd:00000080: init failed with -22
[    4.464046] nouveau: probe of 0000:01:00.0 failed with error -22

I will put in attachment the result of acpidump on my machine.

  Regards,
    Vincent</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1446856317.B0afD3.25173--

--===============1053647851==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1053647851==--
