From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92192] New: nouveau does not detect monitor native
	resolution
Date: Wed, 30 Sep 2015 10:43:31 +0000
Message-ID: <bug-92192-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1903388834=="
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


--===============1903388834==
Content-Type: multipart/alternative; boundary="1443609812.0E4D11.18670"; charset="UTF-8"


--1443609812.0E4D11.18670
Date: Wed, 30 Sep 2015 10:43:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92192

            Bug ID: 92192
           Summary: nouveau does not detect monitor native resolution
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: germano.massullo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 118534
  --> https://bugs.freedesktop.org/attachment.cgi?id=118534&action=edit
Xorg.0.log

I am writing from a machine with a monitor that uses VGA cable. xrandr shows
only 1024x768 as max resolution but the monitor supports 1680x1050

# xrandr
Screen 0: minimum 320 x 200, current 1024 x 768, maximum 8192 x 8192
VGA-1 disconnected (normal left inverted right x axis y axis)
VGA-2 connected primary 1024x768+0+0 (normal left inverted right x axis y axis)
0mm x 0mm
   1024x768      60.00* 
   800x600       60.32    56.25  
   848x480       60.00  
   640x480       59.94  
HDMI-1 disconnected (normal left inverted right x axis y axis


# lspci | grep VGA
01:00.0 VGA compatible controller: NVIDIA Corporation GT215 [GeForce GT 240]
(rev a2)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1443609812.0E4D11.18670
Date: Wed, 30 Sep 2015 10:43:32 +0000
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
   title="NEW - nouveau does not detect monitor native resolution"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92192">92192</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau does not detect monitor native resolution
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
          <td>germano.massullo&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=118534" name="attach_118534" title="Xorg.0.log">attachment 118534</a> <a href="attachment.cgi?id=118534&amp;action=edit" title="Xorg.0.log">[details]</a></span>
Xorg.0.log

I am writing from a machine with a monitor that uses VGA cable. xrandr shows
only 1024x768 as max resolution but the monitor supports 1680x1050

# xrandr
Screen 0: minimum 320 x 200, current 1024 x 768, maximum 8192 x 8192
VGA-1 disconnected (normal left inverted right x axis y axis)
VGA-2 connected primary 1024x768+0+0 (normal left inverted right x axis y axis)
0mm x 0mm
   1024x768      60.00* 
   800x600       60.32    56.25  
   848x480       60.00  
   640x480       59.94  
HDMI-1 disconnected (normal left inverted right x axis y axis


# lspci | grep VGA
01:00.0 VGA compatible controller: NVIDIA Corporation GT215 [GeForce GT 240]
(rev a2)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1443609812.0E4D11.18670--

--===============1903388834==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1903388834==--
