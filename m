From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58378] [NV86] Distorted graphics on NVIDIA GeForce
 8400M G after upgrade the kernel to 3.7.0 version
Date: Sat, 14 Dec 2013 17:58:51 +0000
Message-ID: <bug-58378-8800-8nuS9vWVxK@http.bugs.freedesktop.org/>
References: <bug-58378-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0637669506=="
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


--===============0637669506==
Content-Type: multipart/alternative; boundary="1387043931.8F53f85.30249"; charset="us-ascii"


--1387043931.8F53f85.30249
Date: Sat, 14 Dec 2013 17:58:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58378

--- Comment #28 from Andreas Loew <awl1-hi6Y0CQ0nG0@public.gmane.org> ---
This gets really interesting now:

Oracle public yum "playground" 3.6.11-3.6.y.20121225.ol6 (should be stock
kernel 3.6.11) does NOT show any hangs, but DOES INDEED ALREADY show the
graphics corruption issue FOR ME (although it was thought by the original
posters here that it started with 3.7.0)...!?

So I will now try and move backwards in kernel versions until I might find one
that does not exhibit the corruption bug.

As Oracle's "playground" kernels are only available starting from 3.6, I will
probably move to ELRepo "ml" kernels for this job.

I'll report back once I have some idea of where exactly the issue indeed
started...

BR,
Andreas

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1387043931.8F53f85.30249
Date: Sat, 14 Dec 2013 17:58:51 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378#c28">Comment # 28</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378">bug 58378</a>
              from <span class="vcard"><a class="email" href="mailto:awl1&#64;gmx.net" title="Andreas Loew &lt;awl1&#64;gmx.net&gt;"> <span class="fn">Andreas Loew</span></a>
</span></b>
        <pre>This gets really interesting now:

Oracle public yum &quot;playground&quot; 3.6.11-3.6.y.20121225.ol6 (should be stock
kernel 3.6.11) does NOT show any hangs, but DOES INDEED ALREADY show the
graphics corruption issue FOR ME (although it was thought by the original
posters here that it started with 3.7.0)...!?

So I will now try and move backwards in kernel versions until I might find one
that does not exhibit the corruption bug.

As Oracle's &quot;playground&quot; kernels are only available starting from 3.6, I will
probably move to ELRepo &quot;ml&quot; kernels for this job.

I'll report back once I have some idea of where exactly the issue indeed
started...

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

--1387043931.8F53f85.30249--

--===============0637669506==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0637669506==--
