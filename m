From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77494] [NVE7] fails to load due to unknown opcode
	0xc4
Date: Tue, 15 Apr 2014 18:27:58 +0000
Message-ID: <bug-77494-8800-hkxccq0xGJ@http.bugs.freedesktop.org/>
References: <bug-77494-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0591709156=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77494-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0591709156==
Content-Type: multipart/alternative; boundary="1397586477.eF0B1.28954"; charset="us-ascii"


--1397586477.eF0B1.28954
Date: Tue, 15 Apr 2014 18:27:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77494

--- Comment #2 from Mirko Predosin <mpredosin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
It works when booting kernel 3.12.6-200.fc19.i686.PAE.

[    1.009126] nouveau  [  DEVICE][0000:03:00.0] BOOT0  : 0x0e73e0a2
[    1.009129] nouveau  [  DEVICE][0000:03:00.0] Chipset: GK107 (NVE7)
[    1.009130] nouveau  [  DEVICE][0000:03:00.0] Family : NVE0
[    1.010376] nouveau  [   VBIOS][0000:03:00.0] checking PRAMIN for image...
[    1.010382] nouveau  [   VBIOS][0000:03:00.0] ... signature not found
[    1.010383] nouveau  [   VBIOS][0000:03:00.0] checking PROM for image...
[    1.119044] nouveau  [   VBIOS][0000:03:00.0] ... checksum invalid
[    1.119046] nouveau  [   VBIOS][0000:03:00.0] checking ACPI for image...
[    1.119048] nouveau  [   VBIOS][0000:03:00.0] ... signature not found
[    1.119049] nouveau  [   VBIOS][0000:03:00.0] checking PCIROM for image...
[    1.119054] nouveau 0000:03:00.0: Invalid ROM contents
[    1.119171] nouveau  [   VBIOS][0000:03:00.0] ... appears to be valid
[    1.119173] nouveau  [   VBIOS][0000:03:00.0] using image from PCIROM
[    1.119235] nouveau  [   VBIOS][0000:03:00.0] BIT signature found
[    1.119237] nouveau  [   VBIOS][0000:03:00.0] version 80.07.9b.00.02
[    1.119374] nouveau E[   VBIOS][0000:03:00.0] 0x77df[ ]: unknown opcode 0xc4
[    1.119465] nouveau  [     PFB][0000:03:00.0] RAM type: GDDR5
[    1.119466] nouveau  [     PFB][0000:03:00.0] RAM size: 2048 MiB
[    1.119468] nouveau  [     PFB][0000:03:00.0]    ZCOMP: 0 tags
[    1.763250] nouveau  [  PTHERM][0000:03:00.0] FAN control: none / external
[    1.763275] nouveau  [  PTHERM][0000:03:00.0] fan management: disabled
[    1.763279] nouveau  [  PTHERM][0000:03:00.0] internal sensor: yes
[    1.807945] nouveau  [     DRM] VRAM: 2048 MiB
[    1.807946] nouveau  [     DRM] GART: 1048576 MiB
[    1.807948] nouveau  [     DRM] TMDS table version 2.0
[    1.807950] nouveau  [     DRM] DCB version 4.0
[    1.807952] nouveau  [     DRM] DCB outp 00: 01000f02 00020030
[    1.807953] nouveau  [     DRM] DCB outp 01: 02000f00 00000000
[    1.807954] nouveau  [     DRM] DCB outp 02: 08811fc6 0f420010
[    1.807956] nouveau  [     DRM] DCB outp 03: 08011f82 00020010
[    1.807957] nouveau  [     DRM] DCB outp 04: 02822fa6 0f420010
[    1.807958] nouveau  [     DRM] DCB outp 05: 02022f62 00020010
[    1.807959] nouveau  [     DRM] DCB conn 00: 00001030
[    1.807961] nouveau  [     DRM] DCB conn 01: 00010146
[    1.807962] nouveau  [     DRM] DCB conn 02: 00002246
[    1.809246] nouveau W[     DRM] voltage table 0xe1 unknown
[    1.809260] nouveau  [     DRM] 0 available performance level(s)
[    1.809261] nouveau  [     DRM] c:
[    1.822552] nouveau  [     DRM] MM: using COPY for buffer copies
[    2.001047] nouveau  [     DRM] allocated 1920x1080 fb: 0x80000, bo e9cce200
[    2.001081] fbcon: nouveaufb (fb0) is primary device
[    2.113501] nouveau 0000:03:00.0: fb0: nouveaufb frame buffer device
[    2.113502] nouveau 0000:03:00.0: registered panic notifier
[    2.113504] [drm] Initialized nouveau 1.1.1 20120801 for 0000:03:00.0 on
mino

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1397586477.eF0B1.28954
Date: Tue, 15 Apr 2014 18:27:57 +0000
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
   title="NEW --- - [NVE7] fails to load due to unknown opcode 0xc4"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77494#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] fails to load due to unknown opcode 0xc4"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77494">bug 77494</a>
              from <span class="vcard"><a class="email" href="mailto:mpredosin&#64;gmail.com" title="Mirko Predosin &lt;mpredosin&#64;gmail.com&gt;"> <span class="fn">Mirko Predosin</span></a>
</span></b>
        <pre>It works when booting kernel 3.12.6-200.fc19.i686.PAE.

[    1.009126] nouveau  [  DEVICE][0000:03:00.0] BOOT0  : 0x0e73e0a2
[    1.009129] nouveau  [  DEVICE][0000:03:00.0] Chipset: GK107 (NVE7)
[    1.009130] nouveau  [  DEVICE][0000:03:00.0] Family : NVE0
[    1.010376] nouveau  [   VBIOS][0000:03:00.0] checking PRAMIN for image...
[    1.010382] nouveau  [   VBIOS][0000:03:00.0] ... signature not found
[    1.010383] nouveau  [   VBIOS][0000:03:00.0] checking PROM for image...
[    1.119044] nouveau  [   VBIOS][0000:03:00.0] ... checksum invalid
[    1.119046] nouveau  [   VBIOS][0000:03:00.0] checking ACPI for image...
[    1.119048] nouveau  [   VBIOS][0000:03:00.0] ... signature not found
[    1.119049] nouveau  [   VBIOS][0000:03:00.0] checking PCIROM for image...
[    1.119054] nouveau 0000:03:00.0: Invalid ROM contents
[    1.119171] nouveau  [   VBIOS][0000:03:00.0] ... appears to be valid
[    1.119173] nouveau  [   VBIOS][0000:03:00.0] using image from PCIROM
[    1.119235] nouveau  [   VBIOS][0000:03:00.0] BIT signature found
[    1.119237] nouveau  [   VBIOS][0000:03:00.0] version 80.07.9b.00.02
[    1.119374] nouveau E[   VBIOS][0000:03:00.0] 0x77df[ ]: unknown opcode 0xc4
[    1.119465] nouveau  [     PFB][0000:03:00.0] RAM type: GDDR5
[    1.119466] nouveau  [     PFB][0000:03:00.0] RAM size: 2048 MiB
[    1.119468] nouveau  [     PFB][0000:03:00.0]    ZCOMP: 0 tags
[    1.763250] nouveau  [  PTHERM][0000:03:00.0] FAN control: none / external
[    1.763275] nouveau  [  PTHERM][0000:03:00.0] fan management: disabled
[    1.763279] nouveau  [  PTHERM][0000:03:00.0] internal sensor: yes
[    1.807945] nouveau  [     DRM] VRAM: 2048 MiB
[    1.807946] nouveau  [     DRM] GART: 1048576 MiB
[    1.807948] nouveau  [     DRM] TMDS table version 2.0
[    1.807950] nouveau  [     DRM] DCB version 4.0
[    1.807952] nouveau  [     DRM] DCB outp 00: 01000f02 00020030
[    1.807953] nouveau  [     DRM] DCB outp 01: 02000f00 00000000
[    1.807954] nouveau  [     DRM] DCB outp 02: 08811fc6 0f420010
[    1.807956] nouveau  [     DRM] DCB outp 03: 08011f82 00020010
[    1.807957] nouveau  [     DRM] DCB outp 04: 02822fa6 0f420010
[    1.807958] nouveau  [     DRM] DCB outp 05: 02022f62 00020010
[    1.807959] nouveau  [     DRM] DCB conn 00: 00001030
[    1.807961] nouveau  [     DRM] DCB conn 01: 00010146
[    1.807962] nouveau  [     DRM] DCB conn 02: 00002246
[    1.809246] nouveau W[     DRM] voltage table 0xe1 unknown
[    1.809260] nouveau  [     DRM] 0 available performance level(s)
[    1.809261] nouveau  [     DRM] c:
[    1.822552] nouveau  [     DRM] MM: using COPY for buffer copies
[    2.001047] nouveau  [     DRM] allocated 1920x1080 fb: 0x80000, bo e9cce200
[    2.001081] fbcon: nouveaufb (fb0) is primary device
[    2.113501] nouveau 0000:03:00.0: fb0: nouveaufb frame buffer device
[    2.113502] nouveau 0000:03:00.0: registered panic notifier
[    2.113504] [drm] Initialized nouveau 1.1.1 20120801 for 0000:03:00.0 on
mino</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1397586477.eF0B1.28954--

--===============0591709156==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0591709156==--
