From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61321] New: [regression][NV4c] System hang while
 loading gdm on 3.7 kernel (works on 3.6)
Date: Sat, 23 Feb 2013 00:18:49 +0000
Message-ID: <bug-61321-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0789761740=="
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


--===============0789761740==
Content-Type: multipart/alternative; boundary="1361578729.d4c2af21.6462"; charset="us-ascii"


--1361578729.d4c2af21.6462
Date: Sat, 23 Feb 2013 00:18:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61321

          Priority: medium
            Bug ID: 61321
          Keywords: regression
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [regression][NV4c] System hang while loading gdm on
                    3.7 kernel (works on 3.6)
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: major
    Classification: Unclassified
                OS: Linux (All)
          Reporter: cesarb-PWySMVKUnqmsTnJN9+BGXg@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Since upgrading from a 3.6.10 kernel to a 3.7.9 kernel (Fedora 18), the system
started hanging while loading gdm. Going back to the 3.6 kernel works, going to
a 3.8 kernel hangs the same way.

The hang manifests first as the gdm spinning "loading" cursor stopping,
followed a few seconds later by a screen full of a repeated noise pattern
(different for each boot, but looks like a small block of noise tiled all over
the screen). The machine does not answer to the keyboard (num lock/caps lock
LEDs) or the network (by this point NetworkManager already started the
interface, so I can get a few pings before it hangs).

In particular, it is not the initial modeset when loading the module which
hangs; it is only gdm. If I boot with systemd.unit=multi-user.target, I can
boot without any hangs, load netconsole, and isolate graphical.target to load
gdm to see it hang. I used that to capture the kernel messages until the hang
for the Fedora 3.7.9 kernel.

I also managed to capture the Xorg.0.log for the attempt with the 3.8 kernel
(booting directly into graphical.target).

The relevant version numbers are:

kernel-3.6.10-4.fc18.x86_64 (works)
kernel-3.7.9-201.fc18.x86_64 (hangs)
Upstream 3.8 kernel with a Fedora config (hangs)
xorg-x11-server-Xorg-1.13.2-2.fc18.x86_64
xorg-x11-drv-nouveau-1.0.6-1.fc18.x86_64
libdrm-2.4.42-1.fc18.x86_64
mesa-dri-drivers-9.0.1-4.fc18.x86_64

I also attempted once booting 3.7.9 with nouveau.config=NvPCIE=0 as suggested
at bug #58776; it did not make any visible difference.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1361578729.d4c2af21.6462
Date: Sat, 23 Feb 2013 00:18:49 +0000
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
   title="NEW --- - [regression][NV4c] System hang while loading gdm on 3.7 kernel (works on 3.6)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61321">61321</a>
          </td>
        </tr>

        <tr>
          <th>Keywords</th>
          <td>regression
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[regression][NV4c] System hang while loading gdm on 3.7 kernel (works on 3.6)
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>cesarb&#64;cesarb.net
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
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
        <pre>Since upgrading from a 3.6.10 kernel to a 3.7.9 kernel (Fedora 18), the system
started hanging while loading gdm. Going back to the 3.6 kernel works, going to
a 3.8 kernel hangs the same way.

The hang manifests first as the gdm spinning &quot;loading&quot; cursor stopping,
followed a few seconds later by a screen full of a repeated noise pattern
(different for each boot, but looks like a small block of noise tiled all over
the screen). The machine does not answer to the keyboard (num lock/caps lock
LEDs) or the network (by this point NetworkManager already started the
interface, so I can get a few pings before it hangs).

In particular, it is not the initial modeset when loading the module which
hangs; it is only gdm. If I boot with systemd.unit=multi-user.target, I can
boot without any hangs, load netconsole, and isolate graphical.target to load
gdm to see it hang. I used that to capture the kernel messages until the hang
for the Fedora 3.7.9 kernel.

I also managed to capture the Xorg.0.log for the attempt with the 3.8 kernel
(booting directly into graphical.target).

The relevant version numbers are:

kernel-3.6.10-4.fc18.x86_64 (works)
kernel-3.7.9-201.fc18.x86_64 (hangs)
Upstream 3.8 kernel with a Fedora config (hangs)
xorg-x11-server-Xorg-1.13.2-2.fc18.x86_64
xorg-x11-drv-nouveau-1.0.6-1.fc18.x86_64
libdrm-2.4.42-1.fc18.x86_64
mesa-dri-drivers-9.0.1-4.fc18.x86_64

I also attempted once booting 3.7.9 with nouveau.config=NvPCIE=0 as suggested
at <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - DRM NOUVEAU: cannot boot with kernel &gt;=3.7"
   href="show_bug.cgi?id=58776">bug #58776</a>; it did not make any visible difference.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1361578729.d4c2af21.6462--

--===============0789761740==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0789761740==--
