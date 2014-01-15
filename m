From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71659] [NVD9] Hangs under load with ![
 PFIFO][0000:01:00.0] unhandled status 0x00800000
Date: Wed, 15 Jan 2014 19:20:35 +0000
Message-ID: <bug-71659-8800-E7pKfsQsgD@http.bugs.freedesktop.org/>
References: <bug-71659-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1656762953=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71659-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1656762953==
Content-Type: multipart/alternative; boundary="1389813634.Dac7a741.10156"; charset="us-ascii"


--1389813634.Dac7a741.10156
Date: Wed, 15 Jan 2014 19:20:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71659

--- Comment #18 from Rebecca Palmer <R.Palmer-mHdZ94l+r7K1Qrn1Bg8BZw@public.gmane.org> ---
It still doesn't find the firmware after updating the initramfs (sudo
update-initramfs -u -k all), whether it is placed at
/lib/firmware/nouveau/nvd9_fuc*, /lib/firmware/nouveau/fuc*,
/lib/firmware/<kernel_version>/nouveau/nvd9_fuc* or
/lib/firmware/<kernel_version>/nouveau/fuc*.  (The script uses nvd9_fuc* but
http://nouveau.freedesktop.org/wiki/NVC0_Firmware/ says just fuc* for pre-NVE0
cards.)

My 3.13-rc7 test kernel was compiled with the procedure in
https://wiki.ubuntu.com/KernelTeam/GitKernelBuild; the .config lines containing
"nouveau" are
CONFIG_DRM_NOUVEAU=m
CONFIG_NOUVEAU_DEBUG=5
CONFIG_NOUVEAU_DEBUG_DEFAULT=3
CONFIG_DRM_NOUVEAU_BACKLIGHT=y
and kernel/drivers/gpu/drm/nouveau/nouveau.ko is on the modules.order list, not
the modules.builtin list.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389813634.Dac7a741.10156
Date: Wed, 15 Jan 2014 19:20:34 +0000
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
   title="NEW --- - [NVD9] Hangs under load with ![ PFIFO][0000:01:00.0] unhandled status 0x00800000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71659#c18">Comment # 18</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVD9] Hangs under load with ![ PFIFO][0000:01:00.0] unhandled status 0x00800000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71659">bug 71659</a>
              from <span class="vcard"><a class="email" href="mailto:R.Palmer&#64;bham.ac.uk" title="Rebecca Palmer &lt;R.Palmer&#64;bham.ac.uk&gt;"> <span class="fn">Rebecca Palmer</span></a>
</span></b>
        <pre>It still doesn't find the firmware after updating the initramfs (sudo
update-initramfs -u -k all), whether it is placed at
/lib/firmware/nouveau/nvd9_fuc*, /lib/firmware/nouveau/fuc*,
/lib/firmware/&lt;kernel_version&gt;/nouveau/nvd9_fuc* or
/lib/firmware/&lt;kernel_version&gt;/nouveau/fuc*.  (The script uses nvd9_fuc* but
<a href="http://nouveau.freedesktop.org/wiki/NVC0_Firmware/">http://nouveau.freedesktop.org/wiki/NVC0_Firmware/</a> says just fuc* for pre-NVE0
cards.)

My 3.13-rc7 test kernel was compiled with the procedure in
<a href="https://wiki.ubuntu.com/KernelTeam/GitKernelBuild">https://wiki.ubuntu.com/KernelTeam/GitKernelBuild</a>; the .config lines containing
&quot;nouveau&quot; are
CONFIG_DRM_NOUVEAU=m
CONFIG_NOUVEAU_DEBUG=5
CONFIG_NOUVEAU_DEBUG_DEFAULT=3
CONFIG_DRM_NOUVEAU_BACKLIGHT=y
and kernel/drivers/gpu/drm/nouveau/nouveau.ko is on the modules.order list, not
the modules.builtin list.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389813634.Dac7a741.10156--

--===============1656762953==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1656762953==--
