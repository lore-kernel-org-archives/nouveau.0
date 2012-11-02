From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56692] New: Xorg freezes with vblank enabled on
	nouveau nvc8
Date: Fri, 02 Nov 2012 19:57:53 +0000
Message-ID: <bug-56692-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0174948638=="
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


--===============0174948638==
Content-Type: multipart/alternative; boundary="1351886274.B7AC4371.29965"; charset="us-ascii"


--1351886274.B7AC4371.29965
Date: Fri, 2 Nov 2012 19:57:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56692

          Priority: medium
            Bug ID: 56692
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Xorg freezes with vblank enabled on nouveau nvc8
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: kel.p.doran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

Created attachment 69458
  --> https://bugs.freedesktop.org/attachment.cgi?id=69458&action=edit
Kernel log

I am using the latest nouveau git kernel sources on top of 3.7.0-rc3,
xf86-video-nouveau 1.0.3, mesa 9.0, and xorg-server 1.13.0 and a gtx580.  The
main issue is that X freezes when the GLXVBlank option is enabled.

The screen freezes up seemingly when any OpenGL stuff gets rendered.  Even
running glxinfo can freeze it up, but just starting a basic twm session or i3wm
will not freeze it.  Attempting to play movies via xvmc also freezes it, so I
guess it it not purely OpenGL related.  It runs fine when vblank is disabled
doing the previously mentioned things.  I tried using proprietary firmware as
suggested in IRC but that did not help.

As for the freeze: the mouse starts slowing down and then freezes, and then it
can be moved again but X is completely frozen.  I can switch to a different tty
without using SysRq+R.  The tty only appears in a small box in the upper left
hand corner and the rest of the screen is what it was when X froze.  The tty is
all corrupted too... but you can see text changes when you type, and I can copy
logs and reboot so the system is still mostly working, the graphics are just
completely messed up.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1351886274.B7AC4371.29965
Date: Fri, 2 Nov 2012 19:57:54 +0000
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
   title="NEW --- - Xorg freezes with vblank enabled on nouveau nvc8"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56692">56692</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Xorg freezes with vblank enabled on nouveau nvc8
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
          <td>kel.p.doran&#64;gmail.com
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
        <pre>Created <span class=""><a href="attachment.cgi?id=69458" name="attach_69458" title="Kernel log">attachment 69458</a> <a href="attachment.cgi?id=69458&amp;action=edit" title="Kernel log">[details]</a></span>
Kernel log

I am using the latest nouveau git kernel sources on top of 3.7.0-rc3,
xf86-video-nouveau 1.0.3, mesa 9.0, and xorg-server 1.13.0 and a gtx580.  The
main issue is that X freezes when the GLXVBlank option is enabled.

The screen freezes up seemingly when any OpenGL stuff gets rendered.  Even
running glxinfo can freeze it up, but just starting a basic twm session or i3wm
will not freeze it.  Attempting to play movies via xvmc also freezes it, so I
guess it it not purely OpenGL related.  It runs fine when vblank is disabled
doing the previously mentioned things.  I tried using proprietary firmware as
suggested in IRC but that did not help.

As for the freeze: the mouse starts slowing down and then freezes, and then it
can be moved again but X is completely frozen.  I can switch to a different tty
without using SysRq+R.  The tty only appears in a small box in the upper left
hand corner and the rest of the screen is what it was when X froze.  The tty is
all corrupted too... but you can see text changes when you type, and I can copy
logs and reboot so the system is still mostly working, the graphics are just
completely messed up.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1351886274.B7AC4371.29965--

--===============0174948638==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0174948638==--
