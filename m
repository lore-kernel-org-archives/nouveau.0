From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74648] [NV86] Ultima IX (wine) movie playback
	crashes game
Date: Sat, 08 Feb 2014 01:04:23 +0000
Message-ID: <bug-74648-8800-QDzg0WdMpa@http.bugs.freedesktop.org/>
References: <bug-74648-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1776579476=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-74648-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1776579476==
Content-Type: multipart/alternative; boundary="1391821463.5FEe2.24554"; charset="us-ascii"


--1391821463.5FEe2.24554
Date: Sat, 8 Feb 2014 01:04:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74648

--- Comment #2 from Christopher Thielen <christopher-XP3JB3hj9piIwRZHo2/mJg@public.gmane.org> ---
Good point on the restoring to fullscreen, I suppose it would return if the
program wasn't crashing.

Mesa looks to be v9.2.5, here are the relevant RPMs installed:

mesa-libgbm-9.2.5-1.20131220.fc20.i686
mesa-libGL-devel-9.2.5-1.20131220.fc20.i686
mesa-libglapi-9.2.5-1.20131220.fc20.i686
mesa-libgbm-9.2.5-1.20131220.fc20.x86_64
mesa-libglapi-9.2.5-1.20131220.fc20.x86_64
mesa-libGLU-9.0.0-4.fc20.i686
mesa-dri-drivers-9.2.5-1.20131220.fc20.x86_64
mesa-libxatracker-9.2.5-1.20131220.fc20.x86_64
mesa-filesystem-9.2.5-1.20131220.fc20.i686
mesa-libGL-9.2.5-1.20131220.fc20.x86_64
mesa-libGLES-devel-9.2.5-1.20131220.fc20.x86_64
mesa-libOSMesa-9.2.5-1.20131220.fc20.x86_64
mesa-libGL-9.2.5-1.20131220.fc20.i686
mesa-libGLU-devel-9.0.0-4.fc20.i686
mesa-libwayland-egl-9.2.5-1.20131220.fc20.x86_64
mesa-libEGL-9.2.5-1.20131220.fc20.x86_64
mesa-libGLU-9.0.0-4.fc20.x86_64
mesa-libGLES-9.2.5-1.20131220.fc20.x86_64
mesa-libEGL-9.2.5-1.20131220.fc20.i686
mesa-libGLU-devel-9.0.0-4.fc20.x86_64
mesa-libEGL-devel-9.2.5-1.20131220.fc20.x86_64
mesa-libOSMesa-devel-9.2.5-1.20131220.fc20.i686
mesa-filesystem-9.2.5-1.20131220.fc20.x86_64
mesa-libGL-devel-9.2.5-1.20131220.fc20.x86_64
mesa-libOSMesa-9.2.5-1.20131220.fc20.i686
mesa-dri-drivers-9.2.5-1.20131220.fc20.i686

'dmesg | grep -i chipset' returns:
[    2.805539] nouveau  [  DEVICE][0000:01:00.0] Chipset: G86 (NV86)

I'll post the traceback with debugging symbols once I figure out how to
recompile Mesa - it's been a while. :)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391821463.5FEe2.24554
Date: Sat, 8 Feb 2014 01:04:23 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Ultima IX (wine) movie playback crashes game"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74648#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Ultima IX (wine) movie playback crashes game"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74648">bug 74648</a>
              from <span class="vcard"><a class="email" href="mailto:christopher&#64;thielen.co" title="Christopher Thielen &lt;christopher&#64;thielen.co&gt;"> <span class="fn">Christopher Thielen</span></a>
</span></b>
        <pre>Good point on the restoring to fullscreen, I suppose it would return if the
program wasn't crashing.

Mesa looks to be v9.2.5, here are the relevant RPMs installed:

mesa-libgbm-9.2.5-1.20131220.fc20.i686
mesa-libGL-devel-9.2.5-1.20131220.fc20.i686
mesa-libglapi-9.2.5-1.20131220.fc20.i686
mesa-libgbm-9.2.5-1.20131220.fc20.x86_64
mesa-libglapi-9.2.5-1.20131220.fc20.x86_64
mesa-libGLU-9.0.0-4.fc20.i686
mesa-dri-drivers-9.2.5-1.20131220.fc20.x86_64
mesa-libxatracker-9.2.5-1.20131220.fc20.x86_64
mesa-filesystem-9.2.5-1.20131220.fc20.i686
mesa-libGL-9.2.5-1.20131220.fc20.x86_64
mesa-libGLES-devel-9.2.5-1.20131220.fc20.x86_64
mesa-libOSMesa-9.2.5-1.20131220.fc20.x86_64
mesa-libGL-9.2.5-1.20131220.fc20.i686
mesa-libGLU-devel-9.0.0-4.fc20.i686
mesa-libwayland-egl-9.2.5-1.20131220.fc20.x86_64
mesa-libEGL-9.2.5-1.20131220.fc20.x86_64
mesa-libGLU-9.0.0-4.fc20.x86_64
mesa-libGLES-9.2.5-1.20131220.fc20.x86_64
mesa-libEGL-9.2.5-1.20131220.fc20.i686
mesa-libGLU-devel-9.0.0-4.fc20.x86_64
mesa-libEGL-devel-9.2.5-1.20131220.fc20.x86_64
mesa-libOSMesa-devel-9.2.5-1.20131220.fc20.i686
mesa-filesystem-9.2.5-1.20131220.fc20.x86_64
mesa-libGL-devel-9.2.5-1.20131220.fc20.x86_64
mesa-libOSMesa-9.2.5-1.20131220.fc20.i686
mesa-dri-drivers-9.2.5-1.20131220.fc20.i686

'dmesg | grep -i chipset' returns:
[    2.805539] nouveau  [  DEVICE][0000:01:00.0] Chipset: G86 (NV86)

I'll post the traceback with debugging symbols once I figure out how to
recompile Mesa - it's been a while. :)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391821463.5FEe2.24554--

--===============1776579476==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1776579476==--
