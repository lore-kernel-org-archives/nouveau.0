From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91705] New: [NVE7] GPU crash (read fault) on boot w/
 DMI+HDMI outputs
Date: Thu, 20 Aug 2015 18:35:08 +0000
Message-ID: <bug-91705-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0942390183=="
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


--===============0942390183==
Content-Type: multipart/alternative; boundary="1440095708.7B121.3001"; charset="UTF-8"


--1440095708.7B121.3001
Date: Thu, 20 Aug 2015 18:35:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91705

            Bug ID: 91705
           Summary: [NVE7] GPU crash (read fault) on boot w/ DMI+HDMI
                    outputs
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: zackw-VmQCmMdMyN0AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

I have a brand new computer with an NVE7-based card (GT740); the card has three
physical outputs, 1 each DVI, HDMI, and VGA.  I have two monitors.  If I
connect one to the DVI and one to the VGA port, or if I just connect one
monitor to the DVI port, it boots successfully.  But if I connect one monitor
to the DVI port and the other to the HDMI port (using an HDMI-to-DVI adapter
cable), the GPU and/or the kernel component of the nouveau driver crash
immediately upon switching the console to nouveaufb.  (This happens before the
X server starts.) Both monitors go into power save, the keyboard is
unresponsive, and there is a flood of nouveau-related errors in the kernel log.
 Later, X *thinks* it has started successfully -- there's nothing that looks
like an error to me in xorg.0.log -- but the monitors do not wake up and the
keyboard remains unresponsive.  I can, however, ssh into the computer.

(It now occurs to me to try connecting just one monitor to HDMI.  I will do
that after submitting this bug report.)

I will attach dmesg and xorg logs from both successful and unsuccessful boots. 
Please let me know if any additional information is required.

I'm using distribution packages of everything involved, from Debian unstable as
of, er, today.  The Nvidia proprietary drivers have never been installed. 
Version information gleaned from xorg.log:

Current Operating System: Linux kenaz 4.1.0-2-amd64 #1 SMP Debian 4.1.5-1
(2015-08-15) x86_64
xorg-server 2:1.17.2-1.1
Current version of pixman: 0.32.6
NOUVEAU driver Date:   Thu Aug 28 03:57:48 2014 +0200
[drm] nouveau interface version: 1.2.2

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1440095708.7B121.3001
Date: Thu, 20 Aug 2015 18:35:08 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE7] GPU crash (read fault) on boot w/ DMI+HDMI outputs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91705">91705</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVE7] GPU crash (read fault) on boot w/ DMI+HDMI outputs
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>zackw&#64;panix.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I have a brand new computer with an NVE7-based card (GT740); the card has three
physical outputs, 1 each DVI, HDMI, and VGA.  I have two monitors.  If I
connect one to the DVI and one to the VGA port, or if I just connect one
monitor to the DVI port, it boots successfully.  But if I connect one monitor
to the DVI port and the other to the HDMI port (using an HDMI-to-DVI adapter
cable), the GPU and/or the kernel component of the nouveau driver crash
immediately upon switching the console to nouveaufb.  (This happens before the
X server starts.) Both monitors go into power save, the keyboard is
unresponsive, and there is a flood of nouveau-related errors in the kernel log.
 Later, X *thinks* it has started successfully -- there's nothing that looks
like an error to me in xorg.0.log -- but the monitors do not wake up and the
keyboard remains unresponsive.  I can, however, ssh into the computer.

(It now occurs to me to try connecting just one monitor to HDMI.  I will do
that after submitting this bug report.)

I will attach dmesg and xorg logs from both successful and unsuccessful boots. 
Please let me know if any additional information is required.

I'm using distribution packages of everything involved, from Debian unstable as
of, er, today.  The Nvidia proprietary drivers have never been installed. 
Version information gleaned from xorg.log:

Current Operating System: Linux kenaz 4.1.0-2-amd64 #1 SMP Debian 4.1.5-1
(2015-08-15) x86_64
xorg-server 2:1.17.2-1.1
Current version of pixman: 0.32.6
NOUVEAU driver Date:   Thu Aug 28 03:57:48 2014 +0200
[drm] nouveau interface version: 1.2.2</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1440095708.7B121.3001--

--===============0942390183==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0942390183==--
