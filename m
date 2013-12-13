From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58378] [NV86] Distorted graphics on NVIDIA GeForce
 8400M G after upgrade the kernel to 3.7.0 version
Date: Fri, 13 Dec 2013 13:53:47 +0000
Message-ID: <bug-58378-8800-XSPgfVGYgT@http.bugs.freedesktop.org/>
References: <bug-58378-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0489865449=="
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


--===============0489865449==
Content-Type: multipart/alternative; boundary="1386942827.bd0A78E6.15774"; charset="us-ascii"


--1386942827.bd0A78E6.15774
Date: Fri, 13 Dec 2013 13:53:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58378

--- Comment #21 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(a) Can we see a full boot log (e.g. output of dmesg) with a recent kernel?
Ideally it would include the time that the visual issues happen.

(b) This looks like it could be a fencing issue, i.e. we try to draw to a
texture, but then instead of waiting, we don't wait. There were some fixes that
went into 3.13-rc1, so perhaps trying the latest and greatest (e.g. 3.13-rc3,
or the latest Linus HEAD) would be good to test out.

(c) There are many bisection guides on the internet. You will also need to
figure out how to make the compiled kernel play nice with your distribution.
The basics are simple though:

1. git bisect start v3.7 v3.6 -- drivers/gpu/drm/nouveau
2. build/install/boot/test
3. if it's good, "git bisect good", if it's bad, "git bisect bad"
4. goto 2

At some point running the step 3 command will tell you "first bad commit is
xyz". That's when you're done. I suspect it might be the giant mega "rewrite
nouveau" commit, in which case we're screwed and this will have been a huge
time-waster (apologies in advance if it turns out this way). But it might be
one of the many other commits that went into 3.7, which would be nice and
indicate an area to focus on.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1386942827.bd0A78E6.15774
Date: Fri, 13 Dec 2013 13:53:47 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378#c21">Comment # 21</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378">bug 58378</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(a) Can we see a full boot log (e.g. output of dmesg) with a recent kernel?
Ideally it would include the time that the visual issues happen.

(b) This looks like it could be a fencing issue, i.e. we try to draw to a
texture, but then instead of waiting, we don't wait. There were some fixes that
went into 3.13-rc1, so perhaps trying the latest and greatest (e.g. 3.13-rc3,
or the latest Linus HEAD) would be good to test out.

(c) There are many bisection guides on the internet. You will also need to
figure out how to make the compiled kernel play nice with your distribution.
The basics are simple though:

1. git bisect start v3.7 v3.6 -- drivers/gpu/drm/nouveau
2. build/install/boot/test
3. if it's good, &quot;git bisect good&quot;, if it's bad, &quot;git bisect bad&quot;
4. goto 2

At some point running the step 3 command will tell you &quot;first bad commit is
xyz&quot;. That's when you're done. I suspect it might be the giant mega &quot;rewrite
nouveau&quot; commit, in which case we're screwed and this will have been a huge
time-waster (apologies in advance if it turns out this way). But it might be
one of the many other commits that went into 3.7, which would be nice and
indicate an area to focus on.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1386942827.bd0A78E6.15774--

--===============0489865449==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0489865449==--
