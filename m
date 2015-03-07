From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89483] New: Hangs on boot with external monitor
 active on Dell Latitude C810
Date: Sat, 07 Mar 2015 16:46:55 +0000
Message-ID: <bug-89483-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0927459432=="
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


--===============0927459432==
Content-Type: multipart/alternative; boundary="1425746815.872156F31.1611"; charset="UTF-8"


--1425746815.872156F31.1611
Date: Sat, 7 Mar 2015 16:46:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89483

            Bug ID: 89483
           Summary: Hangs on boot with external monitor active on Dell
                    Latitude C810
           Product: xorg
           Version: 7.7 (2012.06)
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: linux-ZCIryABCsrmttCpgsWEBFmD2FQJk+8+b@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 114114
  --> https://bugs.freedesktop.org/attachment.cgi?id=114114&action=edit
netconsole log from nouveau before hang

Nouveau works fine on Dell Latitude C810 (GeForce2 Go) if no external monitor
is connected and also when an external monitor is connected but not enabled
before booting Linux.

However, when the external monitor is enabled (internal LCD is automatically
disabled - seems that the BIOS does not support clone mode), machine hangs
during nouveau initialization.

The weird thing is that when the monitors are switched using Fn+F8 before boot
(doesn't matter which one is kept enabled), nouveau does not hang.

The same thing happens with Debian Wheezy default 3.2 kernel and also 3.16
kernel from backports.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1425746815.872156F31.1611
Date: Sat, 7 Mar 2015 16:46:55 +0000
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
   title="NEW - Hangs on boot with external monitor active on Dell Latitude C810"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89483">89483</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Hangs on boot with external monitor active on Dell Latitude C810
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>7.7 (2012.06)
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
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
          <td>linux&#64;rainbow-software.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=114114" name="attach_114114" title="netconsole log from nouveau before hang">attachment 114114</a> <a href="attachment.cgi?id=114114&amp;action=edit" title="netconsole log from nouveau before hang">[details]</a></span>
netconsole log from nouveau before hang

Nouveau works fine on Dell Latitude C810 (GeForce2 Go) if no external monitor
is connected and also when an external monitor is connected but not enabled
before booting Linux.

However, when the external monitor is enabled (internal LCD is automatically
disabled - seems that the BIOS does not support clone mode), machine hangs
during nouveau initialization.

The weird thing is that when the monitors are switched using Fn+F8 before boot
(doesn't matter which one is kept enabled), nouveau does not hang.

The same thing happens with Debian Wheezy default 3.2 kernel and also 3.16
kernel from backports.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1425746815.872156F31.1611--

--===============0927459432==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0927459432==--
