From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68344] [NV50 gallium] [piglit]
 shaders/glsl-fs-texture2d-dependent-4 randomly passes or fails on NVAA/NV50
Date: Tue, 10 Dec 2013 20:14:33 +0000
Message-ID: <bug-68344-8800-qer0yWGKhb@http.bugs.freedesktop.org/>
References: <bug-68344-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0434507791=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-68344-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0434507791==
Content-Type: multipart/alternative; boundary="1386706473.a3C41.16813"; charset="us-ascii"


--1386706473.a3C41.16813
Date: Tue, 10 Dec 2013 20:14:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=68344

--- Comment #3 from dirkneukirchen-S0/GAf8tV78@public.gmane.org ---
It will take a while to set up because several other things are not working
with NVAA too and temporary "removal" of the driver in 3.13-rc1 - 3.13-rc3 is
not helping either

see (similar?) NVAA / NVAC:
https://bugs.freedesktop.org/show_bug.cgi?id=72399
and on the mailing list:
http://lists.freedesktop.org/archives/dri-devel/2013-December/050037.html


building with Ubuntu wasnt as nice ... now trying to set up with Fedora

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1386706473.a3C41.16813
Date: Tue, 10 Dec 2013 20:14:33 +0000
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
   title="NEW --- - [NV50 gallium] [piglit] shaders/glsl-fs-texture2d-dependent-4 randomly passes or fails on NVAA/NV50"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68344#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV50 gallium] [piglit] shaders/glsl-fs-texture2d-dependent-4 randomly passes or fails on NVAA/NV50"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68344">bug 68344</a>
              from <span class="vcard"><a class="email" href="mailto:dirkneukirchen&#64;web.de" title="dirkneukirchen&#64;web.de">dirkneukirchen&#64;web.de</a>
</span></b>
        <pre>It will take a while to set up because several other things are not working
with NVAA too and temporary &quot;removal&quot; of the driver in 3.13-rc1 - 3.13-rc3 is
not helping either

see (similar?) NVAA / NVAC:
<a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NVAA][NV50][Regression] Oops : nouveau: 3.13-rc1+ probe of 0000:02:00.0 failed with error -22"
   href="show_bug.cgi?id=72399">https://bugs.freedesktop.org/show_bug.cgi?id=72399</a>
and on the mailing list:
<a href="http://lists.freedesktop.org/archives/dri-devel/2013-December/050037.html">http://lists.freedesktop.org/archives/dri-devel/2013-December/050037.html</a>


building with Ubuntu wasnt as nice ... now trying to set up with Fedora</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1386706473.a3C41.16813--

--===============0434507791==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0434507791==--
