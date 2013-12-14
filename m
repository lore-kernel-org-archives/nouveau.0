From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58378] [NV86] Distorted graphics on NVIDIA GeForce
 8400M G after upgrade the kernel to 3.7.0 version
Date: Sat, 14 Dec 2013 17:36:05 +0000
Message-ID: <bug-58378-8800-TK0CtbyHFS@http.bugs.freedesktop.org/>
References: <bug-58378-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1965621455=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58378-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1965621455==
Content-Type: multipart/alternative; boundary="1387042565.dA7bbD5.26092"; charset="us-ascii"


--1387042565.dA7bbD5.26092
Date: Sat, 14 Dec 2013 17:36:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58378

--- Comment #27 from Andreas Loew <awl1-hi6Y0CQ0nG0@public.gmane.org> ---
Hmm - bad news once again:

I have now compiled and tested a 3.6.kernel to match the commit immediately
before the "mega commit", i.e. the kernel tarball has been produced by the
following command:

$ git archive --format=tar "ebb945a94bba2ce8dff7b0942ff2b3f2a52a0a69^" | bzip2
> ~/Projekte/nouveau_drm/linux-before-mega.tar.bz2

Unfortunately, I am unable to test whether the screen distortion issue occurs
with this kernel, because I get a complete hang (system freezes, CPU and GPU
fans running full speed) somewhere between some seconds and some minutes after
starting GNOME...

Note that I have seen both: either no screen corruption at all or first slight
signs of screen corruption (white rectangles around window frames) at the times
of the hangs.

The error messages that I find in /var/log/messages probably associated with
the hangs (sorry, I can't get any messages ot of dmesg due to the hang...) seem
to be the following:

[drm:drm_mm_takedown] *ERROR* Memory manager not clean. Delaying takedown
[drm:drm_mm_takedown] *ERROR* Memory manager not clean. Delaying takedown
[drm:drm_mm_takedown] *ERROR* Memory manager not clean. Delaying takedown

repeating any number between 3 to 5 times directly before the hangs
(immediately followed by /var/log/messages starting over with my power-off
machine restart).

Will now move forward to test with the most recent stock kernel from the 3.6
series: 3.6.11-3.6.y.20121225.ol6 from the Oracle public yum playground to see
whether this already is affected... :-(

BR,
Andreas

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1387042565.dA7bbD5.26092
Date: Sat, 14 Dec 2013 17:36:05 +0000
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
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378#c27">Comment # 27</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378">bug 58378</a>
              from <span class="vcard"><a class="email" href="mailto:awl1&#64;gmx.net" title="Andreas Loew &lt;awl1&#64;gmx.net&gt;"> <span class="fn">Andreas Loew</span></a>
</span></b>
        <pre>Hmm - bad news once again:

I have now compiled and tested a 3.6.kernel to match the commit immediately
before the &quot;mega commit&quot;, i.e. the kernel tarball has been produced by the
following command:

$ git archive --format=tar &quot;ebb945a94bba2ce8dff7b0942ff2b3f2a52a0a69^&quot; | bzip2
<span class="quote">&gt; ~/Projekte/nouveau_drm/linux-before-mega.tar.bz2</span >

Unfortunately, I am unable to test whether the screen distortion issue occurs
with this kernel, because I get a complete hang (system freezes, CPU and GPU
fans running full speed) somewhere between some seconds and some minutes after
starting GNOME...

Note that I have seen both: either no screen corruption at all or first slight
signs of screen corruption (white rectangles around window frames) at the times
of the hangs.

The error messages that I find in /var/log/messages probably associated with
the hangs (sorry, I can't get any messages ot of dmesg due to the hang...) seem
to be the following:

[drm:drm_mm_takedown] *ERROR* Memory manager not clean. Delaying takedown
[drm:drm_mm_takedown] *ERROR* Memory manager not clean. Delaying takedown
[drm:drm_mm_takedown] *ERROR* Memory manager not clean. Delaying takedown

repeating any number between 3 to 5 times directly before the hangs
(immediately followed by /var/log/messages starting over with my power-off
machine restart).

Will now move forward to test with the most recent stock kernel from the 3.6
series: 3.6.11-3.6.y.20121225.ol6 from the Oracle public yum playground to see
whether this already is affected... :-(

BR,
Andreas</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1387042565.dA7bbD5.26092--

--===============1965621455==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1965621455==--
