From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78361] New: [NVD9] Screen frozen on resume from
	suspend
Date: Tue, 06 May 2014 22:52:43 +0000
Message-ID: <bug-78361-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0544164379=="
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


--===============0544164379==
Content-Type: multipart/alternative; boundary="1399416763.BAEC1.5814"; charset="us-ascii"


--1399416763.BAEC1.5814
Date: Tue, 6 May 2014 22:52:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78361

          Priority: medium
            Bug ID: 78361
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NVD9] Screen frozen on resume from suspend
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: R.Palmer-mHdZ94l+r7K1Qrn1Bg8BZw@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

Created attachment 98591
  --> https://bugs.freedesktop.org/attachment.cgi?id=98591&action=edit
kernel logs

After resume from suspend, the screen shows part but not all of its pre-suspend
contents (most often the menu used to enter suspend) on a black background, or
sometimes garbage or all-black, instead of the password entry screen.  This
does not happen on resume from screen lock.

I haven't tried entering my password, as I can't see what I might be giving it
to; Alt+SysRq+b reboot works.

Ubuntu Trusty (libdrm-nouveau 2.4.52, xserver-xorg-video-nouveau 1.0.10, mesa
10.1.0); kernels 3.13 (default), 3.14rc8 (git as of 26 Mar), 3.11 and 3.8 are
all affected.

This is the same machine as bug 71659, but the system logs don't have its error
message.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1399416763.BAEC1.5814
Date: Tue, 6 May 2014 22:52:43 +0000
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
   title="NEW --- - [NVD9] Screen frozen on resume from suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78361">78361</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVD9] Screen frozen on resume from suspend
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
          <td>R.Palmer&#64;bham.ac.uk
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
          <td>git
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
        <pre>Created <span class=""><a href="attachment.cgi?id=98591" name="attach_98591" title="kernel logs">attachment 98591</a> <a href="attachment.cgi?id=98591&amp;action=edit" title="kernel logs">[details]</a></span>
kernel logs

After resume from suspend, the screen shows part but not all of its pre-suspend
contents (most often the menu used to enter suspend) on a black background, or
sometimes garbage or all-black, instead of the password entry screen.  This
does not happen on resume from screen lock.

I haven't tried entering my password, as I can't see what I might be giving it
to; Alt+SysRq+b reboot works.

Ubuntu Trusty (libdrm-nouveau 2.4.52, xserver-xorg-video-nouveau 1.0.10, mesa
10.1.0); kernels 3.13 (default), 3.14rc8 (git as of 26 Mar), 3.11 and 3.8 are
all affected.

This is the same machine as <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVD9] Hangs under load with ![ PFIFO][0000:01:00.0] unhandled status 0x00800000"
   href="show_bug.cgi?id=71659">bug 71659</a>, but the system logs don't have its error
message.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1399416763.BAEC1.5814--

--===============0544164379==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0544164379==--
