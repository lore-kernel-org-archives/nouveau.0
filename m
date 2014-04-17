From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77586] New: [NV98] On recent Linux kernel (3.13 and
 3.14), the GPU locks up around the time an X server starts
Date: Thu, 17 Apr 2014 17:57:36 +0000
Message-ID: <bug-77586-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0171174683=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============0171174683==
Content-Type: multipart/alternative; boundary="1397757456.eb11D1.30443"; charset="us-ascii"


--1397757456.eb11D1.30443
Date: Thu, 17 Apr 2014 17:57:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77586

          Priority: medium
            Bug ID: 77586
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NV98] On recent Linux kernel (3.13 and 3.14), the GPU
                    locks up around the time an X server starts
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: major
    Classification: Unclassified
                OS: Linux (All)
          Reporter: jkloos-41PbBDiSz5tAfugRpC6u6w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 97525
  --> https://bugs.freedesktop.org/attachment.cgi?id=97525&action=edit
dmesg output, as of running Linux 3.14

On my laptop, the GPU reproducably locks up when booting Linux 3.13 or 3.14.

Hardware set-up:
* NV98; lspci gives
  VGA compatible controller: NVIDIA Corporation G98M [Quadro NVS 160M] (rev a1)
* Dual-head set-up. One connected monitor is the laptop screen, the other
  is an HDMI monitor.
* x86-64 system (Dell Latitude E6400)

Software:
* The attached dmesg is from running Linux 3.14.1, as downloaded from
  kernel.org. I have applied a small patch as suggested by
  RSpliet and xexaxo^ on IRC.
* libdrm: Installed from Debian unstable, package version: libdrm-nouveau2
2.4.52-1
* Xorg: Also from Debian unstable, package version: 1:7.7+1 (i.e., Xorg 7.7).

Error description: During boot-up, an X server seems to start up. The
X server process is running, and the system switches to a fresh VT, but
it seems that graphics are not initialized at all, and the X server is stuck.
In particular, nothing remotely resembling a gdm session shows up, and the
keyboard is not responsive (except Magic Sysrq).
When switching to a console, a kernel message about a GPU lockup (see dmesg)
appears.

Furthermore, booting the system with an old kernel (verified for Linux 3.2.42,
using an old Debian package), X starts up normally.

Attached: dmesg output. I will add further information in additional messages.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1397757456.eb11D1.30443
Date: Thu, 17 Apr 2014 17:57:36 +0000
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
   title="NEW --- - [NV98] On recent Linux kernel (3.13 and 3.14), the GPU locks up around the time an X server starts"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77586">77586</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV98] On recent Linux kernel (3.13 and 3.14), the GPU locks up around the time an X server starts
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
          <td>jkloos&#64;mpi-sws.org
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
        <pre>Created <span class=""><a href="attachment.cgi?id=97525" name="attach_97525" title="dmesg output, as of running Linux 3.14">attachment 97525</a> <a href="attachment.cgi?id=97525&amp;action=edit" title="dmesg output, as of running Linux 3.14">[details]</a></span>
dmesg output, as of running Linux 3.14

On my laptop, the GPU reproducably locks up when booting Linux 3.13 or 3.14.

Hardware set-up:
* NV98; lspci gives
  VGA compatible controller: NVIDIA Corporation G98M [Quadro NVS 160M] (rev a1)
* Dual-head set-up. One connected monitor is the laptop screen, the other
  is an HDMI monitor.
* x86-64 system (Dell Latitude E6400)

Software:
* The attached dmesg is from running Linux 3.14.1, as downloaded from
  kernel.org. I have applied a small patch as suggested by
  RSpliet and xexaxo^ on IRC.
* libdrm: Installed from Debian unstable, package version: libdrm-nouveau2
2.4.52-1
* Xorg: Also from Debian unstable, package version: 1:7.7+1 (i.e., Xorg 7.7).

Error description: During boot-up, an X server seems to start up. The
X server process is running, and the system switches to a fresh VT, but
it seems that graphics are not initialized at all, and the X server is stuck.
In particular, nothing remotely resembling a gdm session shows up, and the
keyboard is not responsive (except Magic Sysrq).
When switching to a console, a kernel message about a GPU lockup (see dmesg)
appears.

Furthermore, booting the system with an old kernel (verified for Linux 3.2.42,
using an old Debian package), X starts up normally.

Attached: dmesg output. I will add further information in additional messages.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1397757456.eb11D1.30443--

--===============0171174683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0171174683==--
