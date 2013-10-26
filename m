From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70895] New: BUG: soft lockup - CPU#0 stuck for 22s!
 [Xorg:1292] after disable descrete card with switcheroo
Date: Sat, 26 Oct 2013 15:10:17 +0000
Message-ID: <bug-70895-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1663786587=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============1663786587==
Content-Type: multipart/alternative; boundary="1382800217.E4f1ce21.27878"; charset="us-ascii"


--1382800217.E4f1ce21.27878
Date: Sat, 26 Oct 2013 15:10:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70895

          Priority: medium
            Bug ID: 70895
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: BUG: soft lockup - CPU#0 stuck for 22s! [Xorg:1292]
                    after disable descrete card with switcheroo
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: mszpak-5tc4TXWwyLM@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 88154
  --> https://bugs.freedesktop.org/attachment.cgi?id=88154&action=edit
kernel log with stack trace

After disable discrete graphics with:
echo OFF > /sys/kernel/debug/vgaswitcheroo/switch

nouveau drivers seems to react:
kernel: [  113.072192] VGA switcheroo: switched nouveau off
Oct 26 16:07:52 localhost kernel: [  113.072208] ACPI Warning:
\_SB_.PCI0.PEGR.GFX0._DSM: Argument #4 type mismatch - Found [Buffer], ACPI
requires [Package] (20130517/nsarguments-95)
kernel: [  113.072350] nouveau  [     DRM] suspending fbcon...
kernel: [  113.072354] nouveau  [     DRM] suspending display...
kernel: [  113.072360] nouveau  [     DRM] unpinning framebuffer(s)...
kernel: [  113.072400] nouveau  [     DRM] evicting buffers...
kernel: [  113.085655] nouveau  [     DRM] waiting for kernel channels to go
idle...
kernel: [  113.085682] nouveau  [     DRM] suspending client object trees...
kernel: [  113.085976] nouveau  [     DRM] suspending kernel object tree...
kernel: [  113.865315] nouveau 0000:01:00.0: power state changed by ACPI to
D3cold

but xrandr --listproviders hangs the whole system with:
kernel: [  324.008068] BUG: soft lockup - CPU#0 stuck for 22s! [Xorg:1292]

Detailed log with stack trace attached.

System specification:
Asus N43SN
GeForce GT 550M + integrated Intel card using i915 driver (NVidia Optimus)
kernel-3.11.6-200.fc19.x86_64
xorg-x11-drv-nouveau-1.0.9-1.fc19.x86_64
xorg-x11-server-Xorg-1.14.3-1.fc19.x86_64

$ xrandr --listproviders
Providers: number : 3
Provider 0: id: 0x8e cap: 0xb, Source Output, Sink Output, Sink Offload crtcs:
2 outputs: 4 associated providers: 2 name:Intel
Provider 1: id: 0x63 cap: 0x7, Source Output, Sink Output, Source Offload
crtcs: 2 outputs: 2 associated providers: 2 name:nouveau
Provider 2: id: 0x63 cap: 0x7, Source Output, Sink Output, Source Offload
crtcs: 2 outputs: 2 associated providers: 2 name:nouveau

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1382800217.E4f1ce21.27878
Date: Sat, 26 Oct 2013 15:10:17 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - BUG: soft lockup - CPU#0 stuck for 22s! [Xorg:1292] after disable descrete card with switcheroo"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70895">70895</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>BUG: soft lockup - CPU#0 stuck for 22s! [Xorg:1292] after disable descrete card with switcheroo
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>mszpak&#64;wp.pl
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=88154" name="attach_88154" title="kernel log with stack trace">attachment 88154</a> <a href="attachment.cgi?id=88154&amp;action=edit" title="kernel log with stack trace">[details]</a></span>
kernel log with stack trace

After disable discrete graphics with:
echo OFF &gt; /sys/kernel/debug/vgaswitcheroo/switch

nouveau drivers seems to react:
kernel: [  113.072192] VGA switcheroo: switched nouveau off
Oct 26 16:07:52 localhost kernel: [  113.072208] ACPI Warning:
\_SB_.PCI0.PEGR.GFX0._DSM: Argument #4 type mismatch - Found [Buffer], ACPI
requires [Package] (20130517/nsarguments-95)
kernel: [  113.072350] nouveau  [     DRM] suspending fbcon...
kernel: [  113.072354] nouveau  [     DRM] suspending display...
kernel: [  113.072360] nouveau  [     DRM] unpinning framebuffer(s)...
kernel: [  113.072400] nouveau  [     DRM] evicting buffers...
kernel: [  113.085655] nouveau  [     DRM] waiting for kernel channels to go
idle...
kernel: [  113.085682] nouveau  [     DRM] suspending client object trees...
kernel: [  113.085976] nouveau  [     DRM] suspending kernel object tree...
kernel: [  113.865315] nouveau 0000:01:00.0: power state changed by ACPI to
D3cold

but xrandr --listproviders hangs the whole system with:
kernel: [  324.008068] BUG: soft lockup - CPU#0 stuck for 22s! [Xorg:1292]

Detailed log with stack trace attached.

System specification:
Asus N43SN
GeForce GT 550M + integrated Intel card using i915 driver (NVidia Optimus)
kernel-3.11.6-200.fc19.x86_64
xorg-x11-drv-nouveau-1.0.9-1.fc19.x86_64
xorg-x11-server-Xorg-1.14.3-1.fc19.x86_64

$ xrandr --listproviders
Providers: number : 3
Provider 0: id: 0x8e cap: 0xb, Source Output, Sink Output, Sink Offload crtcs:
2 outputs: 4 associated providers: 2 name:Intel
Provider 1: id: 0x63 cap: 0x7, Source Output, Sink Output, Source Offload
crtcs: 2 outputs: 2 associated providers: 2 name:nouveau
Provider 2: id: 0x63 cap: 0x7, Source Output, Sink Output, Source Offload
crtcs: 2 outputs: 2 associated providers: 2 name:nouveau</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1382800217.E4f1ce21.27878--

--===============1663786587==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1663786587==--
