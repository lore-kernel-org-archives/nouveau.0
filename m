From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61069] [NV17] Crash while displaying large image
Date: Wed, 21 Aug 2013 07:51:12 +0000
Message-ID: <bug-61069-8800-17fc75USmJ@http.bugs.freedesktop.org/>
References: <bug-61069-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0418631372=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-61069-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0418631372==
Content-Type: multipart/alternative; boundary="1377071472.df74eD72.12237"; charset="us-ascii"


--1377071472.df74eD72.12237
Date: Wed, 21 Aug 2013 07:51:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61069

--- Comment #5 from dave.mueller-OI3hZJvNYWs@public.gmane.org ---
Perhaps you have to try with a bigger image (e.g. 4096x4096 pixel) to
compensate for your larger screen resolution.

I didn't played with the compositor so far, just used the standard KDE
settings.

I don't think that a second X session will do any good, as the system is quite
unstable after the crash and needs to be rebooted.

My NV17 also has 64MiB VRAM as shown below:

nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x017200a5
nouveau  [  DEVICE][0000:01:00.0] Chipset: NV17 (NV17)
nouveau  [  DEVICE][0000:01:00.0] Family : NV10
nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
nouveau  [   VBIOS][0000:01:00.0] BMP version 5.15
nouveau  [   VBIOS][0000:01:00.0] version 04.17.00.45.00
nouveau  [  PTIMER][0000:01:00.0] unknown input clock freq
nouveau  [     PFB][0000:01:00.0] RAM type: DDR1
nouveau  [     PFB][0000:01:00.0] RAM size: 64 MiB
nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
nouveau  [     DRM] VRAM: 63 MiB
nouveau  [     DRM] GART: 128 MiB
nouveau  [     DRM] BMP version 5.21
nouveau  [     DRM] DCB version 2.0
nouveau  [     DRM] DCB outp 00: 01000100 000088b8
nouveau  [     DRM] DCB outp 01: 02010111 00000003
nouveau  [     DRM] DCB outp 02: 02010211 00000003
nouveau  [     DRM] Merging DCB entries 1 and 2
nouveau  [     DRM] Loading NV17 power sequencing microcode
nouveau  [     DRM] Saving VGA fonts
nouveau  [     DRM] 1 available performance level(s)
nouveau  [     DRM] 0: memory 332MHz
nouveau  [     DRM] c: core 249MHz memory 333MHz
nouveau  [     DRM] MM: using M2MF for buffer copies
nouveau  [     DRM] Setting dpms mode 3 on TV encoder (output 1)
nouveau  [     DRM] allocated 1600x1200 fb: 0x9000, bo f5a0c600

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377071472.df74eD72.12237
Date: Wed, 21 Aug 2013 07:51:12 +0000
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
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [NV17] Crash while displaying large image"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61069#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [NV17] Crash while displaying large image"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61069">bug 61069</a>
              from <span class="vcard"><a class="email" href="mailto:dave.mueller&#64;gmx.ch" title="dave.mueller&#64;gmx.ch">dave.mueller&#64;gmx.ch</a>
</span></b>
        <pre>Perhaps you have to try with a bigger image (e.g. 4096x4096 pixel) to
compensate for your larger screen resolution.

I didn't played with the compositor so far, just used the standard KDE
settings.

I don't think that a second X session will do any good, as the system is quite
unstable after the crash and needs to be rebooted.

My NV17 also has 64MiB VRAM as shown below:

nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x017200a5
nouveau  [  DEVICE][0000:01:00.0] Chipset: NV17 (NV17)
nouveau  [  DEVICE][0000:01:00.0] Family : NV10
nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
nouveau  [   VBIOS][0000:01:00.0] BMP version 5.15
nouveau  [   VBIOS][0000:01:00.0] version 04.17.00.45.00
nouveau  [  PTIMER][0000:01:00.0] unknown input clock freq
nouveau  [     PFB][0000:01:00.0] RAM type: DDR1
nouveau  [     PFB][0000:01:00.0] RAM size: 64 MiB
nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
nouveau  [     DRM] VRAM: 63 MiB
nouveau  [     DRM] GART: 128 MiB
nouveau  [     DRM] BMP version 5.21
nouveau  [     DRM] DCB version 2.0
nouveau  [     DRM] DCB outp 00: 01000100 000088b8
nouveau  [     DRM] DCB outp 01: 02010111 00000003
nouveau  [     DRM] DCB outp 02: 02010211 00000003
nouveau  [     DRM] Merging DCB entries 1 and 2
nouveau  [     DRM] Loading NV17 power sequencing microcode
nouveau  [     DRM] Saving VGA fonts
nouveau  [     DRM] 1 available performance level(s)
nouveau  [     DRM] 0: memory 332MHz
nouveau  [     DRM] c: core 249MHz memory 333MHz
nouveau  [     DRM] MM: using M2MF for buffer copies
nouveau  [     DRM] Setting dpms mode 3 on TV encoder (output 1)
nouveau  [     DRM] allocated 1600x1200 fb: 0x9000, bo f5a0c600</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377071472.df74eD72.12237--

--===============0418631372==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0418631372==--
