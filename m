From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89558] [NV118] GM108 not supported by nouveau
Date: Thu, 01 Oct 2015 18:49:49 +0000
Message-ID: <bug-89558-8800-FzXEumk5RO@http.bugs.freedesktop.org/>
References: <bug-89558-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0745827745=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89558-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0745827745==
Content-Type: multipart/alternative; boundary="1443725390.5C140c7a3.21982"; charset="UTF-8"


--1443725390.5C140c7a3.21982
Date: Thu, 1 Oct 2015 18:49:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89558

--- Comment #44 from SMF <smf.linux-XZoyATsUNX5Wk0Htik3J/w@public.gmane.org> ---
Created attachment 118577
  --> https://bugs.freedesktop.org/attachment.cgi?id=118577&action=edit
Patch to enable partiial initialisation of Nouveau on Linux 4.3-rc3

If this is of any use to anyone the attached patch allows me to get the
following initialisation on Linux 4.3-rc3.

[    2.961084] nouveau 0000:03:00.0: NVIDIA GM108 (118010a2)
[    3.178080] nouveau 0000:03:00.0: bios: version 82.08.13.00.1c
[    3.262110] nouveau 0000:03:00.0: fb: 4096 MiB DDR3
[    3.262127] nouveau 0000:03:00.0: priv: HUB0: 6013d4 0000573f (1e408200)
[    3.262173] nouveau 0000:03:00.0: priv: HUB0: 10ecc0 ffffffff (1d40822c)
[    3.297714] nouveau 0000:03:00.0: DRM: VRAM: 4096 MiB
[    3.297716] nouveau 0000:03:00.0: DRM: GART: 1048576 MiB
[    3.297718] nouveau 0000:03:00.0: DRM: Pointer to TMDS table invalid
[    3.297719] nouveau 0000:03:00.0: DRM: DCB version 4.0
[    3.297721] nouveau 0000:03:00.0: DRM: Pointer to flat panel table invalid
[    3.442864] nouveau 0000:03:00.0: DRM: MM: using COPY for buffer copies
[    3.442875] [drm] Initialized nouveau 1.3.0 20120801 for 0000:03:00.0 on
minor 1
[    8.443777] nouveau 0000:03:00.0: DRM: evicting buffers...
[    8.443783] nouveau 0000:03:00.0: DRM: waiting for kernel channels to go
idle...
[    8.443809] nouveau 0000:03:00.0: DRM: suspending client object trees...
[    8.445664] nouveau 0000:03:00.0: DRM: suspending kernel object tree...
[   21.947649] nouveau 0000:03:00.0: DRM: resuming kernel object tree...
[   22.031416] nouveau 0000:03:00.0: priv: HUB0: 6013d4 ffffffff (1a40822c)
[   22.072390] nouveau 0000:03:00.0: DRM: resuming client object trees...
[   27.371262] nouveau 0000:03:00.0: DRM: evicting buffers...
[   27.371269] nouveau 0000:03:00.0: DRM: waiting for kernel channels to go
idle...
[   27.371296] nouveau 0000:03:00.0: DRM: suspending client object trees...
[   27.373164] nouveau 0000:03:00.0: DRM: suspending kernel object tree...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1443725390.5C140c7a3.21982
Date: Thu, 1 Oct 2015 18:49:50 +0000
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
   title="NEW - [NV118] GM108 not supported by nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89558#c44">Comment # 44</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV118] GM108 not supported by nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89558">bug 89558</a>
              from <span class="vcard"><a class="email" href="mailto:smf.linux&#64;ntlworld.com" title="SMF &lt;smf.linux&#64;ntlworld.com&gt;"> <span class="fn">SMF</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=118577" name="attach_118577" title="Patch to enable partiial initialisation of Nouveau on Linux 4.3-rc3">attachment 118577</a> <a href="attachment.cgi?id=118577&amp;action=edit" title="Patch to enable partiial initialisation of Nouveau on Linux 4.3-rc3">[details]</a></span>
Patch to enable partiial initialisation of Nouveau on Linux 4.3-rc3

If this is of any use to anyone the attached patch allows me to get the
following initialisation on Linux 4.3-rc3.

[    2.961084] nouveau 0000:03:00.0: NVIDIA GM108 (118010a2)
[    3.178080] nouveau 0000:03:00.0: bios: version 82.08.13.00.1c
[    3.262110] nouveau 0000:03:00.0: fb: 4096 MiB DDR3
[    3.262127] nouveau 0000:03:00.0: priv: HUB0: 6013d4 0000573f (1e408200)
[    3.262173] nouveau 0000:03:00.0: priv: HUB0: 10ecc0 ffffffff (1d40822c)
[    3.297714] nouveau 0000:03:00.0: DRM: VRAM: 4096 MiB
[    3.297716] nouveau 0000:03:00.0: DRM: GART: 1048576 MiB
[    3.297718] nouveau 0000:03:00.0: DRM: Pointer to TMDS table invalid
[    3.297719] nouveau 0000:03:00.0: DRM: DCB version 4.0
[    3.297721] nouveau 0000:03:00.0: DRM: Pointer to flat panel table invalid
[    3.442864] nouveau 0000:03:00.0: DRM: MM: using COPY for buffer copies
[    3.442875] [drm] Initialized nouveau 1.3.0 20120801 for 0000:03:00.0 on
minor 1
[    8.443777] nouveau 0000:03:00.0: DRM: evicting buffers...
[    8.443783] nouveau 0000:03:00.0: DRM: waiting for kernel channels to go
idle...
[    8.443809] nouveau 0000:03:00.0: DRM: suspending client object trees...
[    8.445664] nouveau 0000:03:00.0: DRM: suspending kernel object tree...
[   21.947649] nouveau 0000:03:00.0: DRM: resuming kernel object tree...
[   22.031416] nouveau 0000:03:00.0: priv: HUB0: 6013d4 ffffffff (1a40822c)
[   22.072390] nouveau 0000:03:00.0: DRM: resuming client object trees...
[   27.371262] nouveau 0000:03:00.0: DRM: evicting buffers...
[   27.371269] nouveau 0000:03:00.0: DRM: waiting for kernel channels to go
idle...
[   27.371296] nouveau 0000:03:00.0: DRM: suspending client object trees...
[   27.373164] nouveau 0000:03:00.0: DRM: suspending kernel object tree...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1443725390.5C140c7a3.21982--

--===============0745827745==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0745827745==--
