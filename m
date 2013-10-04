From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70135] New: [nv34 PowerMac G5] gnome-shell random
 crashes and rendering issues
Date: Fri, 04 Oct 2013 14:28:09 +0000
Message-ID: <bug-70135-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1760355967=="
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


--===============1760355967==
Content-Type: multipart/alternative; boundary="1380896890.A3BcA1.22160"; charset="us-ascii"


--1380896890.A3BcA1.22160
Date: Fri, 4 Oct 2013 14:28:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70135

          Priority: medium
            Bug ID: 70135
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [nv34 PowerMac G5] gnome-shell random crashes and
                    rendering issues
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: glaubitz-1Olz3AKvcsuAKZTfuerNgRvVK+yQ3ZXh@public.gmane.org
          Hardware: PowerPC
            Status: NEW
           Version: 7.7 (2011)
         Component: Driver/nouveau
           Product: xorg

Created attachment 87123
  --> https://bugs.freedesktop.org/attachment.cgi?id=87123&action=edit
dmesg of PowerMac G5 Model A1047 with NV34 after crash

Hello!

I have recently performed a test installation of Debian unstable on a PowerMac
G5 (Apple Model: A1047) which exposed some reproducible crashes and rendering
issues with nouveau and the Apple-branded GeForce FX 5200 Ultra.

After installing Debian Wheezy which ships xf86-video-nouveau 1.0.1 I
experienced some serious rendering issues when starting gnome-shell 3.4.2.
After upgrading to Debian unstable which installed xf86-video-nouveau 1.0.9,
most of the rendering were gone. The version of gnome-shell was still 3.4.2 for
Debian unstable at that point.

With the driver from unstable, some minor glitches were still left. However,
the main issue was that it was possible to reproducibly crash the X server by
hovering the mouse over the applications menu of gnome-shell. This crash
produced some output in the dmesg buffer as well in the Xorg.0.log.

I am attaching all related log files and well as a dump of the video ROM of the
GeForce FX5200 Ultra used in this Macintosh. If you need further log files or
want me to perform some debugging, please let me know.

Cheers,

Adrian

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1380896890.A3BcA1.22160
Date: Fri, 4 Oct 2013 14:28:10 +0000
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
   title="NEW --- - [nv34 PowerMac G5] gnome-shell random crashes and rendering issues"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70135">70135</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[nv34 PowerMac G5] gnome-shell random crashes and rendering issues
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
          <td>glaubitz&#64;physik.fu-berlin.de
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>PowerPC
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
        <pre>Created <span class=""><a href="attachment.cgi?id=87123" name="attach_87123" title="dmesg of PowerMac G5 Model A1047 with NV34 after crash">attachment 87123</a> <a href="attachment.cgi?id=87123&amp;action=edit" title="dmesg of PowerMac G5 Model A1047 with NV34 after crash">[details]</a></span>
dmesg of PowerMac G5 Model A1047 with NV34 after crash

Hello!

I have recently performed a test installation of Debian unstable on a PowerMac
G5 (Apple Model: A1047) which exposed some reproducible crashes and rendering
issues with nouveau and the Apple-branded GeForce FX 5200 Ultra.

After installing Debian Wheezy which ships xf86-video-nouveau 1.0.1 I
experienced some serious rendering issues when starting gnome-shell 3.4.2.
After upgrading to Debian unstable which installed xf86-video-nouveau 1.0.9,
most of the rendering were gone. The version of gnome-shell was still 3.4.2 for
Debian unstable at that point.

With the driver from unstable, some minor glitches were still left. However,
the main issue was that it was possible to reproducibly crash the X server by
hovering the mouse over the applications menu of gnome-shell. This crash
produced some output in the dmesg buffer as well in the Xorg.0.log.

I am attaching all related log files and well as a dump of the video ROM of the
GeForce FX5200 Ultra used in this Macintosh. If you need further log files or
want me to perform some debugging, please let me know.

Cheers,

Adrian</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1380896890.A3BcA1.22160--

--===============1760355967==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1760355967==--
