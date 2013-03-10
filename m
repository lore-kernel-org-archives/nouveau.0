From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 62115] New: Refresh rate stuck at 60Hz
Date: Sun, 10 Mar 2013 16:24:28 +0000
Message-ID: <bug-62115-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1274323611=="
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


--===============1274323611==
Content-Type: multipart/alternative; boundary="1362932668.AD1C1.23235"; charset="us-ascii"


--1362932668.AD1C1.23235
Date: Sun, 10 Mar 2013 16:24:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=62115

          Priority: medium
            Bug ID: 62115
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Refresh rate stuck at 60Hz
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: critical
    Classification: Unclassified
                OS: Linux (All)
          Reporter: josealb77-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 76277
  --> https://bugs.freedesktop.org/attachment.cgi?id=76277&action=edit
boot - change to 60Hz - change to 75Hz but my monitor is still at 60 Hz

Hi,
I'm using Linux Mint 14 MATE x64 kernel 3.5.0-25 with a NVIDIA GeForce GTX 460
video card and a ViewSonic VG1921wm monitor.

Using the NVIDIA privative driver I can set the monitor resolution to 1440x900
@ 75Hz in Menu > Preferences > Display. Then with the monitor buttons I look in
Information and it says that vertical frequency is 74.8Hz, and when I set it to
1440x900 @ 60Hz, the monitor says that vertical frequency is 59.9Hz, namely:
all works well.

But when I'm using Nouveau it has no effect, whatever I set in Menu >
Preferences > Display the information of my monitor always shows a vertical
frequency of 59.9Hz.

What can I do in order to get the real 1440x900@75Hz resolution with Nouveau?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1362932668.AD1C1.23235
Date: Sun, 10 Mar 2013 16:24:28 +0000
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
   title="NEW --- - Refresh rate stuck at 60Hz"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62115">62115</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Refresh rate stuck at 60Hz
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>critical
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
          <td>josealb77&#64;hotmail.com
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
        <pre>Created <span class=""><a href="attachment.cgi?id=76277" name="attach_76277" title="boot - change to 60Hz - change to 75Hz but my monitor is still at 60 Hz">attachment 76277</a> <a href="attachment.cgi?id=76277&amp;action=edit" title="boot - change to 60Hz - change to 75Hz but my monitor is still at 60 Hz">[details]</a></span>
boot - change to 60Hz - change to 75Hz but my monitor is still at 60 Hz

Hi,
I'm using Linux Mint 14 MATE x64 kernel 3.5.0-25 with a NVIDIA GeForce GTX 460
video card and a ViewSonic VG1921wm monitor.

Using the NVIDIA privative driver I can set the monitor resolution to 1440x900
&#64; 75Hz in Menu &gt; Preferences &gt; Display. Then with the monitor buttons I look in
Information and it says that vertical frequency is 74.8Hz, and when I set it to
1440x900 &#64; 60Hz, the monitor says that vertical frequency is 59.9Hz, namely:
all works well.

But when I'm using Nouveau it has no effect, whatever I set in Menu &gt;
Preferences &gt; Display the information of my monitor always shows a vertical
frequency of 59.9Hz.

What can I do in order to get the real 1440x900&#64;75Hz resolution with Nouveau?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1362932668.AD1C1.23235--

--===============1274323611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1274323611==--
