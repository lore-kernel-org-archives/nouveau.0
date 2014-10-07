From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 84759] New: EXTREME and blocking drawing delay
 accumulation with certain websites and programs (e.g. rdesktop) since
 forever
Date: Tue, 07 Oct 2014 15:49:20 +0000
Message-ID: <bug-84759-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1756683483=="
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


--===============1756683483==
Content-Type: multipart/alternative; boundary="1412696960.0aAbfc1.4175"; charset="UTF-8"


--1412696960.0aAbfc1.4175
Date: Tue, 7 Oct 2014 15:49:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=84759

            Bug ID: 84759
           Summary: EXTREME and blocking drawing delay accumulation with
                    certain websites and programs (e.g. rdesktop) since
                    forever
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: minor
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: afasdfsdfaa-NltIWcMOmWn1P9xLtpHBDw@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 107505
  --> https://bugs.freedesktop.org/attachment.cgi?id=107505&action=edit
Xorg log

Here you can see a video of it and also more important information is in the
youtube description: https://www.youtube.com/watch?v=X_c-26mB304

Like the text says, there seems to be some kind of 2D drawing action in Xorg
that takes maybe a thousand times longer with nouveau than usual. But this
drawing is rarely used, i.e. mostly only on window creation, so the delay
doesn't get as apparent in most cases you run into (I suppose with my limited
knowledge that this drawing actions are single Xlib graphic contexts like you
can create with XCreateGC, created and rendered for the first time or changes
in their palette or something). 

So this makes applications open in a sluggish manner and with certain programs,
like in the video example, it causes insane delays (like 10ms becomes 3
minutes) that extremely impair working properly with them.

I only really ran into this on my work PC, which has slower+older GT8400 cards,
but at home once I tested it with GT430 also and I would rather say that the
same sluggishnes was present, but maybe due to different causes?


00:02.0 VGA compatible controller: Intel Corporation 4 Series Chipset
Integrated Graphics Controller (rev 03)
01:00.0 VGA compatible controller: NVIDIA Corporation GT218 [GeForce 8400 GS
Rev. 3] (rev a2)
03:00.0 VGA compatible controller: NVIDIA Corporation G86 [GeForce 8400 GS]
(rev a1)
Linux WORKPAQ 3.16.3-1-ARCH #1 SMP PREEMPT Wed Sep 17 21:54:13 CEST 2014 x86_64
GNU/Linux
X.Org X Server 1.16.1

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1412696960.0aAbfc1.4175
Date: Tue, 7 Oct 2014 15:49:20 +0000
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
   title="NEW - EXTREME and blocking drawing delay accumulation with certain websites and programs (e.g. rdesktop) since forever"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=84759">84759</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>EXTREME and blocking drawing delay accumulation with certain websites and programs (e.g. rdesktop) since forever
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
          <td>minor
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
          <td>afasdfsdfaa&#64;master.ms
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=107505" name="attach_107505" title="Xorg log">attachment 107505</a> <a href="attachment.cgi?id=107505&amp;action=edit" title="Xorg log">[details]</a></span>
Xorg log

Here you can see a video of it and also more important information is in the
youtube description: <a href="https://www.youtube.com/watch?v=X_c-26mB304">https://www.youtube.com/watch?v=X_c-26mB304</a>

Like the text says, there seems to be some kind of 2D drawing action in Xorg
that takes maybe a thousand times longer with nouveau than usual. But this
drawing is rarely used, i.e. mostly only on window creation, so the delay
doesn't get as apparent in most cases you run into (I suppose with my limited
knowledge that this drawing actions are single Xlib graphic contexts like you
can create with XCreateGC, created and rendered for the first time or changes
in their palette or something). 

So this makes applications open in a sluggish manner and with certain programs,
like in the video example, it causes insane delays (like 10ms becomes 3
minutes) that extremely impair working properly with them.

I only really ran into this on my work PC, which has slower+older GT8400 cards,
but at home once I tested it with GT430 also and I would rather say that the
same sluggishnes was present, but maybe due to different causes?


00:02.0 VGA compatible controller: Intel Corporation 4 Series Chipset
Integrated Graphics Controller (rev 03)
01:00.0 VGA compatible controller: NVIDIA Corporation GT218 [GeForce 8400 GS
Rev. 3] (rev a2)
03:00.0 VGA compatible controller: NVIDIA Corporation G86 [GeForce 8400 GS]
(rev a1)
Linux WORKPAQ 3.16.3-1-ARCH #1 SMP PREEMPT Wed Sep 17 21:54:13 CEST 2014 x86_64
GNU/Linux
X.Org X Server 1.16.1</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1412696960.0aAbfc1.4175--

--===============1756683483==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1756683483==--
