From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71659] [NVD9] Hangs under load with ![
 PFIFO][0000:01:00.0] unhandled status 0x00800000
Date: Wed, 15 Jan 2014 19:25:53 +0000
Message-ID: <bug-71659-8800-0aRJuyBQMH@http.bugs.freedesktop.org/>
References: <bug-71659-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0963054009=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71659-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0963054009==
Content-Type: multipart/alternative; boundary="1389813953.FF2BB51.11371"; charset="us-ascii"


--1389813953.FF2BB51.11371
Date: Wed, 15 Jan 2014 19:25:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71659

--- Comment #19 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #18)
> It still doesn't find the firmware after updating the initramfs (sudo
> update-initramfs -u -k all), whether it is placed at
> /lib/firmware/nouveau/nvd9_fuc*, /lib/firmware/nouveau/fuc*,
> /lib/firmware/<kernel_version>/nouveau/nvd9_fuc* or
> /lib/firmware/<kernel_version>/nouveau/fuc*.  (The script uses nvd9_fuc* but
> http://nouveau.freedesktop.org/wiki/NVC0_Firmware/ says just fuc* for
> pre-NVE0 cards.)

Erm, that's a lie. I've been meaning to fix it. I'm like 99.999% sure it always
has to be nvXX_fucYYY[cd]. I'll double-check it again before updating the wiki.
Putting it in /lib/firmware/nouveau is sufficient -- adding in the kernel
version also works, but you'd normally just do that for firmware that was
kernel version dependent, which this isn't.

> 
> My 3.13-rc7 test kernel was compiled with the procedure in
> https://wiki.ubuntu.com/KernelTeam/GitKernelBuild; the .config lines
> containing "nouveau" are
> CONFIG_DRM_NOUVEAU=m
> CONFIG_NOUVEAU_DEBUG=5
> CONFIG_NOUVEAU_DEBUG_DEFAULT=3
> CONFIG_DRM_NOUVEAU_BACKLIGHT=y
> and kernel/drivers/gpu/drm/nouveau/nouveau.ko is on the modules.order list,
> not the modules.builtin list.

Don't know what to say. It just uses request_firmware() so it's whatever the
kernel's normal mechanism for loading firmware.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389813953.FF2BB51.11371
Date: Wed, 15 Jan 2014 19:25:53 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71659#c19">Comment # 19</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVD9] Hangs under load with ![ PFIFO][0000:01:00.0] unhandled status 0x00800000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71659">bug 71659</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=71659#c18">comment #18</a>)
<span class="quote">&gt; It still doesn't find the firmware after updating the initramfs (sudo
&gt; update-initramfs -u -k all), whether it is placed at
&gt; /lib/firmware/nouveau/nvd9_fuc*, /lib/firmware/nouveau/fuc*,
&gt; /lib/firmware/&lt;kernel_version&gt;/nouveau/nvd9_fuc* or
&gt; /lib/firmware/&lt;kernel_version&gt;/nouveau/fuc*.  (The script uses nvd9_fuc* but
&gt; <a href="http://nouveau.freedesktop.org/wiki/NVC0_Firmware/">http://nouveau.freedesktop.org/wiki/NVC0_Firmware/</a> says just fuc* for
&gt; pre-NVE0 cards.)</span >

Erm, that's a lie. I've been meaning to fix it. I'm like 99.999% sure it always
has to be nvXX_fucYYY[cd]. I'll double-check it again before updating the wiki.
Putting it in /lib/firmware/nouveau is sufficient -- adding in the kernel
version also works, but you'd normally just do that for firmware that was
kernel version dependent, which this isn't.

<span class="quote">&gt; 
&gt; My 3.13-rc7 test kernel was compiled with the procedure in
&gt; <a href="https://wiki.ubuntu.com/KernelTeam/GitKernelBuild">https://wiki.ubuntu.com/KernelTeam/GitKernelBuild</a>; the .config lines
&gt; containing &quot;nouveau&quot; are
&gt; CONFIG_DRM_NOUVEAU=m
&gt; CONFIG_NOUVEAU_DEBUG=5
&gt; CONFIG_NOUVEAU_DEBUG_DEFAULT=3
&gt; CONFIG_DRM_NOUVEAU_BACKLIGHT=y
&gt; and kernel/drivers/gpu/drm/nouveau/nouveau.ko is on the modules.order list,
&gt; not the modules.builtin list.</span >

Don't know what to say. It just uses request_firmware() so it's whatever the
kernel's normal mechanism for loading firmware.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389813953.FF2BB51.11371--

--===============0963054009==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0963054009==--
