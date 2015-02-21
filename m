From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89272] New: GM206 does not recognize attached hdmi
	monitor
Date: Sat, 21 Feb 2015 21:45:08 +0000
Message-ID: <bug-89272-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1176227203=="
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


--===============1176227203==
Content-Type: multipart/alternative; boundary="1424555108.D7c47cf1.16717"; charset="UTF-8"


--1424555108.D7c47cf1.16717
Date: Sat, 21 Feb 2015 21:45:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89272

            Bug ID: 89272
           Summary: GM206 does not recognize attached hdmi monitor
           Product: xorg
           Version: git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: stefan-Xd65/bSt805AfugRpC6u6w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 113732
  --> https://bugs.freedesktop.org/attachment.cgi?id=113732&action=edit
dmesg with nouveau.debug=debug drm.debug=0xe

Hi,
adding this patch on top of linux-3.19 or tip of
http://cgit.freedesktop.org/~darktama/nouveau

is enough to get a GM206 / GTX 960 to get 'modprove nouveau' to work and
getting output on a VGA monitor attached to the DVI-I port.

However trying the same with a HDMI monitor attached to the hdmi port does not
work.

Attached is dmesg output with extra debugging enabled + a 2nd file with debug
level=trace enabled.

I have also sent an mmiotrace of that hdmi use-case by mail.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1424555108.D7c47cf1.16717
Date: Sat, 21 Feb 2015 21:45:08 +0000
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
   title="NEW - GM206 does not recognize attached hdmi monitor"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89272">89272</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>GM206 does not recognize attached hdmi monitor
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
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
          <td>stefan&#64;huehner.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=113732" name="attach_113732" title="dmesg with nouveau.debug=debug drm.debug=0xe">attachment 113732</a> <a href="attachment.cgi?id=113732&amp;action=edit" title="dmesg with nouveau.debug=debug drm.debug=0xe">[details]</a></span>
dmesg with nouveau.debug=debug drm.debug=0xe

Hi,
adding this patch on top of linux-3.19 or tip of
<a href="http://cgit.freedesktop.org/~darktama/nouveau">http://cgit.freedesktop.org/~darktama/nouveau</a>

is enough to get a GM206 / GTX 960 to get 'modprove nouveau' to work and
getting output on a VGA monitor attached to the DVI-I port.

However trying the same with a HDMI monitor attached to the hdmi port does not
work.

Attached is dmesg output with extra debugging enabled + a 2nd file with debug
level=trace enabled.

I have also sent an mmiotrace of that hdmi use-case by mail.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1424555108.D7c47cf1.16717--

--===============1176227203==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1176227203==--
