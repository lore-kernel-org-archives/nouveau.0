From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73358] [regression?][nv34] adobe flash + firefox ->
	DATA_ERROR
Date: Fri, 10 Jan 2014 08:21:41 +0000
Message-ID: <bug-73358-8800-xnUBgizu7R@http.bugs.freedesktop.org/>
References: <bug-73358-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1312845337=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-73358-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1312845337==
Content-Type: multipart/alternative; boundary="1389342101.EE4EA281.7917"; charset="us-ascii"


--1389342101.EE4EA281.7917
Date: Fri, 10 Jan 2014 08:21:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73358

--- Comment #3 from Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
This *might* be a regression.

I migrated from Ubuntu to ArchLinux. These seem kernel errors, which I also
upgraded. From 3.13.0-rc3 -> 3.13.0-rc7-00055-gef350bb:

4706515 Merge branches 'acpi-pci-pm' and 'acpi-pci-hotplug'
f244d8b ACPIPHP / radeon / nouveau: Fix VGA switcheroo problem related to
hotplug
b25b442 drm/nouveau: only runtime suspend by default in optimus configuration
c17f5bb Merge branch 'drm-nouveau-next' of
git://anongit.freedesktop.org/git/nouveau/linux
bdefc8c drm/nv50/disp: min/max are reversed in nv50_crtc_gamma_set()
13cd1a5 drm/nouveau/sw: fix oops if gpu has its display block disabled
2fd04c8 drm/nouveau: unreference fence after syncing
f074d73 drm/nouveau/kms: send timestamp data for correct head in flip
completion events
a7e4201 drm/nouveau/clk: Add support for NVAA/NVAC
b1cd497 drm/nouveau/fifo: Hook up pause and resume for NV50 and NV84+
efffa98 drm/nv10/plane: some chipsets don't support NV12
050828e drm/nv10/plane: add downscaling restrictions
92e5b0a drm/nv10/plane: fix format computation
5b19f4f drm/nv04-nv30/clk: provide an empty domain list

Could the above contain a likely culprit?

Ubuntu -> Arch upgrade

libdrm  2.4.46-1ubuntu1 -> 2.4.50-1
mesa 9.2.1-1ubuntu3 -> 10.0.1-2
xorg-server 2:1.14.3-3ubuntu2 -> 1.14.5-1
xf86-video-nouveau 1:1.0.9-2ubuntu1 -> 1.0.10-1
kernel 3.13.0-rc3 -> 3.13.0-rc7-00055-gef350bb

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389342101.EE4EA281.7917
Date: Fri, 10 Jan 2014 08:21:41 +0000
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
   title="NEW --- - [regression?][nv34] adobe flash + firefox -&gt; DATA_ERROR"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73358#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [regression?][nv34] adobe flash + firefox -&gt; DATA_ERROR"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73358">bug 73358</a>
              from <span class="vcard"><a class="email" href="mailto:ronald645&#64;gmail.com" title="Ronald &lt;ronald645&#64;gmail.com&gt;"> <span class="fn">Ronald</span></a>
</span></b>
        <pre>This *might* be a regression.

I migrated from Ubuntu to ArchLinux. These seem kernel errors, which I also
upgraded. From 3.13.0-rc3 -&gt; 3.13.0-rc7-00055-gef350bb:

4706515 Merge branches 'acpi-pci-pm' and 'acpi-pci-hotplug'
f244d8b ACPIPHP / radeon / nouveau: Fix VGA switcheroo problem related to
hotplug
b25b442 drm/nouveau: only runtime suspend by default in optimus configuration
c17f5bb Merge branch 'drm-nouveau-next' of
git://anongit.freedesktop.org/git/nouveau/linux
bdefc8c drm/nv50/disp: min/max are reversed in nv50_crtc_gamma_set()
13cd1a5 drm/nouveau/sw: fix oops if gpu has its display block disabled
2fd04c8 drm/nouveau: unreference fence after syncing
f074d73 drm/nouveau/kms: send timestamp data for correct head in flip
completion events
a7e4201 drm/nouveau/clk: Add support for NVAA/NVAC
b1cd497 drm/nouveau/fifo: Hook up pause and resume for NV50 and NV84+
efffa98 drm/nv10/plane: some chipsets don't support NV12
050828e drm/nv10/plane: add downscaling restrictions
92e5b0a drm/nv10/plane: fix format computation
5b19f4f drm/nv04-nv30/clk: provide an empty domain list

Could the above contain a likely culprit?

Ubuntu -&gt; Arch upgrade

libdrm  2.4.46-1ubuntu1 -&gt; 2.4.50-1
mesa 9.2.1-1ubuntu3 -&gt; 10.0.1-2
xorg-server 2:1.14.3-3ubuntu2 -&gt; 1.14.5-1
xf86-video-nouveau 1:1.0.9-2ubuntu1 -&gt; 1.0.10-1
kernel 3.13.0-rc3 -&gt; 3.13.0-rc7-00055-gef350bb</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389342101.EE4EA281.7917--

--===============1312845337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1312845337==--
