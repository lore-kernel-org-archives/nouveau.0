From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74195] New: Responsivity to input with vsync on is
 slower after update
Date: Wed, 29 Jan 2014 20:23:28 +0000
Message-ID: <bug-74195-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1245086895=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1245086895==
Content-Type: multipart/alternative; boundary="1391027008.0C0ADC31.28511"; charset="us-ascii"


--1391027008.0C0ADC31.28511
Date: Wed, 29 Jan 2014 20:23:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74195

          Priority: medium
            Bug ID: 74195
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Responsivity to input with vsync on is slower after
                    update
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: janjanjanx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

I use compton compositing manager wich uses DRM_IOCTL_WAIT_VBLANK for vsync.
Recently I updated from kernel 3.9 to 3.13 and responsivness (or "input lag" or
however it's called) got much worse, mostly noticable when moving windows or
scrolling. With kernel 3.13 the windows are 3-5 frames behind mouse when
moving, on 3.9 kernel they were only 0-1 frames behind. I also tried kwin, wich
had less noticable slowdown (from 1-2 frames behind to 3-5 frames behind).

I tried different kernel versions from nouveau git and found out, that the
slowdown was caused by this commit:
http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=0fa9061ae8c10a9178d696cf48d94c3bf2848f9f

I guess the commit is important and can't be undone, but the bad responsiveness
really annoys me, so I would be glad if there is a solution.

GPU is GTX 560 Ti
xserver 1.14.5
xorg-video-nouveau 1.0.10
libdrm 2.4.52
(Debian sid)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391027008.0C0ADC31.28511
Date: Wed, 29 Jan 2014 20:23:28 +0000
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
   title="NEW --- - Responsivity to input with vsync on is slower after update"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74195">74195</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Responsivity to input with vsync on is slower after update
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
          <td>janjanjanx&#64;gmail.com
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
        <pre>I use compton compositing manager wich uses DRM_IOCTL_WAIT_VBLANK for vsync.
Recently I updated from kernel 3.9 to 3.13 and responsivness (or &quot;input lag&quot; or
however it's called) got much worse, mostly noticable when moving windows or
scrolling. With kernel 3.13 the windows are 3-5 frames behind mouse when
moving, on 3.9 kernel they were only 0-1 frames behind. I also tried kwin, wich
had less noticable slowdown (from 1-2 frames behind to 3-5 frames behind).

I tried different kernel versions from nouveau git and found out, that the
slowdown was caused by this commit:
<a href="http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=0fa9061ae8c10a9178d696cf48d94c3bf2848f9f">http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=0fa9061ae8c10a9178d696cf48d94c3bf2848f9f</a>

I guess the commit is important and can't be undone, but the bad responsiveness
really annoys me, so I would be glad if there is a solution.

GPU is GTX 560 Ti
xserver 1.14.5
xorg-video-nouveau 1.0.10
libdrm 2.4.52
(Debian sid)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391027008.0C0ADC31.28511--

--===============1245086895==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1245086895==--
