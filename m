From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68344] [NV50 gallium] [piglit]
 shaders/glsl-fs-texture2d-dependent-4 randomly passes or fails on NVAA/NV50
Date: Tue, 20 Aug 2013 17:10:32 +0000
Message-ID: <bug-68344-8800-jsiVy4h2iS@http.bugs.freedesktop.org/>
References: <bug-68344-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1592212900=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-68344-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1592212900==
Content-Type: multipart/alternative; boundary="1377018631.c542BcC2.6558"; charset="us-ascii"


--1377018631.c542BcC2.6558
Date: Tue, 20 Aug 2013 17:10:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=68344

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|[piglit]                    |[NV50 gallium] [piglit]
                   |shaders/glsl-fs-texture2d-d |shaders/glsl-fs-texture2d-d
                   |ependent-4 randomly passes  |ependent-4 randomly passes
                   |or fails on NVAA/NV50       |or fails on NVAA/NV50

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
As a datapoint, I also got it to fail on NV96, similar failure. However for me
it was more like 1/100 times. And I never saw the failure with mesa 9.1.2, only
mesa-git (from a few days ago).

This is how I ran it:

for i in `seq 100`; do bin/shader_runner
tests/shaders/glsl-fs-texture2d-dependent-4.shader_test -auto; done

Here was the failure:

Probe color at (25,225)
  Expected: 0.000000 0.000000 1.000000
  Observed: 1.000000 0.000000 0.000000
Probe color at (225,225)
  Expected: 1.000000 1.000000 1.000000
  Observed: 0.000000 1.000000 0.000000

Note how for me it says ,225 and not ,224. Might be a different piglit test
version... I'm at latest. (Or could be a difference between nv84 3d and nva0
3d.)

This feels like a timing issue -- e.g. we return too early without having
flushed something.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377018631.c542BcC2.6558
Date: Tue, 20 Aug 2013 17:10:31 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV50 gallium] [piglit] shaders/glsl-fs-texture2d-dependent-4 randomly passes or fails on NVAA/NV50"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68344">bug 68344</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>[piglit] shaders/glsl-fs-texture2d-dependent-4 randomly passes or fails on NVAA/NV50
           </td>
           <td>[NV50 gallium] [piglit] shaders/glsl-fs-texture2d-dependent-4 randomly passes or fails on NVAA/NV50
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV50 gallium] [piglit] shaders/glsl-fs-texture2d-dependent-4 randomly passes or fails on NVAA/NV50"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68344#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV50 gallium] [piglit] shaders/glsl-fs-texture2d-dependent-4 randomly passes or fails on NVAA/NV50"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68344">bug 68344</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>As a datapoint, I also got it to fail on NV96, similar failure. However for me
it was more like 1/100 times. And I never saw the failure with mesa 9.1.2, only
mesa-git (from a few days ago).

This is how I ran it:

for i in `seq 100`; do bin/shader_runner
tests/shaders/glsl-fs-texture2d-dependent-4.shader_test -auto; done

Here was the failure:

Probe color at (25,225)
  Expected: 0.000000 0.000000 1.000000
  Observed: 1.000000 0.000000 0.000000
Probe color at (225,225)
  Expected: 1.000000 1.000000 1.000000
  Observed: 0.000000 1.000000 0.000000

Note how for me it says ,225 and not ,224. Might be a different piglit test
version... I'm at latest. (Or could be a difference between nv84 3d and nva0
3d.)

This feels like a timing issue -- e.g. we return too early without having
flushed something.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377018631.c542BcC2.6558--

--===============1592212900==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1592212900==--
