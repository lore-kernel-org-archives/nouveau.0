From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73274] New: NV44A (PCI) 3D screensaver CACHE_ERROR
Date: Sat, 04 Jan 2014 07:56:53 +0000
Message-ID: <bug-73274-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1053616119=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============1053616119==
Content-Type: multipart/alternative; boundary="1388822213.C3bc4f1.1319"; charset="us-ascii"


--1388822213.C3bc4f1.1319
Date: Sat, 4 Jan 2014 07:56:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73274

          Priority: medium
            Bug ID: 73274
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: NV44A (PCI) 3D screensaver CACHE_ERROR
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: freedesktop-bmuJXYsvn0ihgqps0qF2+Q@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: 7.7 (2011)
         Component: Driver/nouveau
           Product: xorg

Created attachment 91478
  --> https://bugs.freedesktop.org/attachment.cgi?id=91478&action=edit
dmesg output with bubble3d running ~16 hours (with one interruption)

Computer failed second-stage burn-in testing. Was able to run mprime with
blended tests overnight. Running the 3D screensaver (initially pinion) with
mprime doing "in place FFTs" (loads CPU, cache, little memory): caused X to
crash. Lightdm restarted it automatically, but I had no mouse pointer.

I then upgraded all of the relevant software to newer versions:
Package: xorg Version: 1:7.7+5
Package: xserver-xorg-video-nouveau Version: 1:1.0.10-1
Package: libdrm-nouveau2 Version: 2.4.50-1
Package: libgl1-mesa-dri Version: 9.2.2-1
Package: xscreensaver-gl Version: 5.23-1

 uname -a
Linux torchlight 3.11-2-686-pae #1 SMP Debian 3.11.10-1 (2013-12-04) i686
GNU/Linux

Running bubble3d with mprime doing "in place FFTs", I get a soft lock-up within
about 30 minutes. I switched to bubble3d because the screen with the mouse
pointer was experiencing ~50% slow-downs even if the pointer was not drawn (it
gives info about the gear under the pointer). All the GL screen savers also
seem to suffer significant slow-downs with the option to display the frame-rate
enabled. On the order of 20->5 fps. This slowdown was not as evident prior to
the upgrade (so may be a regression).

When running bubble3d for about 16 hours, with the computer otherwise idle, I
logged two sets of Cache errors. However, without the soft lock-up. I plan to
test with an ATI card to see the problems may be related to power stability
rather than software. The motherboard is now about 10 years old, so the
capacitors may be drying out.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1388822213.C3bc4f1.1319
Date: Sat, 4 Jan 2014 07:56:53 +0000
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
   title="NEW --- - NV44A (PCI) 3D screensaver CACHE_ERROR"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73274">73274</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>NV44A (PCI) 3D screensaver CACHE_ERROR
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
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>freedesktop&#64;phillipsjk.ca
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86 (IA32)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>7.7 (2011)
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
        <pre>Created <span class=""><a href="attachment.cgi?id=91478" name="attach_91478" title="dmesg output with bubble3d running ~16 hours (with one interruption)">attachment 91478</a> <a href="attachment.cgi?id=91478&amp;action=edit" title="dmesg output with bubble3d running ~16 hours (with one interruption)">[details]</a></span>
dmesg output with bubble3d running ~16 hours (with one interruption)

Computer failed second-stage burn-in testing. Was able to run mprime with
blended tests overnight. Running the 3D screensaver (initially pinion) with
mprime doing &quot;in place FFTs&quot; (loads CPU, cache, little memory): caused X to
crash. Lightdm restarted it automatically, but I had no mouse pointer.

I then upgraded all of the relevant software to newer versions:
Package: xorg Version: 1:7.7+5
Package: xserver-xorg-video-nouveau Version: 1:1.0.10-1
Package: libdrm-nouveau2 Version: 2.4.50-1
Package: libgl1-mesa-dri Version: 9.2.2-1
Package: xscreensaver-gl Version: 5.23-1

 uname -a
Linux torchlight 3.11-2-686-pae #1 SMP Debian 3.11.10-1 (2013-12-04) i686
GNU/Linux

Running bubble3d with mprime doing &quot;in place FFTs&quot;, I get a soft lock-up within
about 30 minutes. I switched to bubble3d because the screen with the mouse
pointer was experiencing ~50% slow-downs even if the pointer was not drawn (it
gives info about the gear under the pointer). All the GL screen savers also
seem to suffer significant slow-downs with the option to display the frame-rate
enabled. On the order of 20-&gt;5 fps. This slowdown was not as evident prior to
the upgrade (so may be a regression).

When running bubble3d for about 16 hours, with the computer otherwise idle, I
logged two sets of Cache errors. However, without the soft lock-up. I plan to
test with an ATI card to see the problems may be related to power stability
rather than software. The motherboard is now about 10 years old, so the
capacitors may be drying out.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1388822213.C3bc4f1.1319--

--===============1053616119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1053616119==--
