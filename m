From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69488] GF108 (NVC1) GPU lockup
Date: Wed, 02 Oct 2013 23:21:45 +0000
Message-ID: <bug-69488-8800-JdAIoQS72t@http.bugs.freedesktop.org/>
References: <bug-69488-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0804166389=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69488-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0804166389==
Content-Type: multipart/alternative; boundary="1380756105.A8EF21.23506"; charset="us-ascii"


--1380756105.A8EF21.23506
Date: Wed, 2 Oct 2013 23:21:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69488

--- Comment #14 from Kevin N. <vekinn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I tried to get more on 3.12-rc3 with the "better patch for sysfb_simplefb that
adjusts the BOOTFB resource" patch applied but when I startx it immediately
locks up.

[   21.230774] nouveau  [     DRM] ACPI backlight interface available, not
registering our own
[   21.230788] nouveau W[     DRM] voltage table 0x50 unknown
[   21.230946] nouveau  [     DRM] 2 available performance level(s)
[   21.230948] nouveau  [     DRM] 1: core 270MHz shader 540MHz memory 405MHz
[   21.230950] nouveau  [     DRM] 3: core 475MHz shader 950MHz memory 900MHz
voltage 10mV
[   21.230952] nouveau  [     DRM] c: core 270MHz shader 540MHz memory 405MHz
[   21.236603] nouveau  [     DRM] MM: using COPY0 for buffer copies
[   21.502956] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000401 FAULT
at 0x002010 [ IBUS TIMEOUT ]
[   21.527378] nouveau  [     DRM] allocated 1920x1080 fb: 0x60000, bo
ffff88042ada2000
[   21.527442] nouveau 0000:01:00.0: fb1: nouveaufb frame buffer device
[   21.527449] [drm] Initialized nouveau 1.1.1 20120801 for 0000:01:00.0 on
minor 1
[   22.891605] btrfs: disk space caching is enabled
[   26.533235] ACPI Warning: \_SB_.PCI0.PEG_.VID_._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20130725/nsarguments-95)
[   26.534638] ACPI Warning: \_SB_.PCI0.PEG_.VID_._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20130725/nsarguments-95)
[   71.584645] nouveau E[     DRM] failed to idle channel 0xcccc0001 [DRM]
[   71.708588] pci_pm_runtime_suspend(): nouveau_pmops_runtime_suspend+0x0/0x90
[nouveau] returns -16

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1380756105.A8EF21.23506
Date: Wed, 2 Oct 2013 23:21:45 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - GF108 (NVC1) GPU lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69488#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - GF108 (NVC1) GPU lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69488">bug 69488</a>
              from <span class="vcard"><a class="email" href="mailto:vekinn&#64;gmail.com" title="Kevin N. &lt;vekinn&#64;gmail.com&gt;"> <span class="fn">Kevin N.</span></a>
</span></b>
        <pre>I tried to get more on 3.12-rc3 with the &quot;better patch for sysfb_simplefb that
adjusts the BOOTFB resource&quot; patch applied but when I startx it immediately
locks up.

[   21.230774] nouveau  [     DRM] ACPI backlight interface available, not
registering our own
[   21.230788] nouveau W[     DRM] voltage table 0x50 unknown
[   21.230946] nouveau  [     DRM] 2 available performance level(s)
[   21.230948] nouveau  [     DRM] 1: core 270MHz shader 540MHz memory 405MHz
[   21.230950] nouveau  [     DRM] 3: core 475MHz shader 950MHz memory 900MHz
voltage 10mV
[   21.230952] nouveau  [     DRM] c: core 270MHz shader 540MHz memory 405MHz
[   21.236603] nouveau  [     DRM] MM: using COPY0 for buffer copies
[   21.502956] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000401 FAULT
at 0x002010 [ IBUS TIMEOUT ]
[   21.527378] nouveau  [     DRM] allocated 1920x1080 fb: 0x60000, bo
ffff88042ada2000
[   21.527442] nouveau 0000:01:00.0: fb1: nouveaufb frame buffer device
[   21.527449] [drm] Initialized nouveau 1.1.1 20120801 for 0000:01:00.0 on
minor 1
[   22.891605] btrfs: disk space caching is enabled
[   26.533235] ACPI Warning: \_SB_.PCI0.PEG_.VID_._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20130725/nsarguments-95)
[   26.534638] ACPI Warning: \_SB_.PCI0.PEG_.VID_._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20130725/nsarguments-95)
[   71.584645] nouveau E[     DRM] failed to idle channel 0xcccc0001 [DRM]
[   71.708588] pci_pm_runtime_suspend(): nouveau_pmops_runtime_suspend+0x0/0x90
[nouveau] returns -16</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1380756105.A8EF21.23506--

--===============0804166389==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0804166389==--
