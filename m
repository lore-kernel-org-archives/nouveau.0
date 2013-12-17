From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58378] [NV86] Distorted graphics on NVIDIA GeForce
 8400M G after upgrade the kernel to 3.7.0 version
Date: Tue, 17 Dec 2013 14:51:03 +0000
Message-ID: <bug-58378-8800-iBo43zwgME@http.bugs.freedesktop.org/>
References: <bug-58378-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1158876278=="
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


--===============1158876278==
Content-Type: multipart/alternative; boundary="1387291863.bffb5.14561"; charset="us-ascii"


--1387291863.bffb5.14561
Date: Tue, 17 Dec 2013 14:51:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58378

--- Comment #40 from Andreas Loew <awl1-hi6Y0CQ0nG0@public.gmane.org> ---
Hello again,

I need your help on how to proceed:

Using the bisection approach, I have now largely reduced the candidate commits
that might have introduced the issue:

4c193d254ee94da02857b9670e815b1765a9579b shows the issue, while
c420b2dc8dc3cdd507214f4df5c5f96f08812cbe does not, so the issue has been
introduced between May 2nd and May 4th, 2012.

I now wanted to check 78df3a1c585c8c95fd9a472125f0cd406e8617ce, but this commit
does not even compile:

The error message for the above is:

drivers/gpu/drm/nouveau/nouveau_fbcon.c: In function 'nouveau_fbcon_sync':
drivers/gpu/drm/nouveau/nouveau_fbcon.c:166: error: void value not ignored as
it ought to be
make[4]: *** [drivers/gpu/drm/nouveau/nouveau_fbcon.o] Error 1
make[3]: *** [drivers/gpu/drm/nouveau] Error 2
make[2]: *** [drivers/gpu/drm] Error 2
make[1]: *** [drivers/gpu] Error 2
make: *** [drivers] Error 2

So how should I proceed? Can you tell me how to fix the above compile error, or
should I proceed to check both

b355096992e2b4d30bb77173927f45e7f2c12570
(immediately before 78df3a1c585c8c95fd9a472125f0cd406e8617ce) and

d1b167e168bdac0b6af11e7a8c601773639fc419
(immediately after 78df3a1c585c8c95fd9a472125f0cd406e8617ce)?

Please advise how I should move forward!

Thanks & best regards,
Andreas

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1387291863.bffb5.14561
Date: Tue, 17 Dec 2013 14:51:03 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378#c40">Comment # 40</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378">bug 58378</a>
              from <span class="vcard"><a class="email" href="mailto:awl1&#64;gmx.net" title="Andreas Loew &lt;awl1&#64;gmx.net&gt;"> <span class="fn">Andreas Loew</span></a>
</span></b>
        <pre>Hello again,

I need your help on how to proceed:

Using the bisection approach, I have now largely reduced the candidate commits
that might have introduced the issue:

4c193d254ee94da02857b9670e815b1765a9579b shows the issue, while
c420b2dc8dc3cdd507214f4df5c5f96f08812cbe does not, so the issue has been
introduced between May 2nd and May 4th, 2012.

I now wanted to check 78df3a1c585c8c95fd9a472125f0cd406e8617ce, but this commit
does not even compile:

The error message for the above is:

drivers/gpu/drm/nouveau/nouveau_fbcon.c: In function 'nouveau_fbcon_sync':
drivers/gpu/drm/nouveau/nouveau_fbcon.c:166: error: void value not ignored as
it ought to be
make[4]: *** [drivers/gpu/drm/nouveau/nouveau_fbcon.o] Error 1
make[3]: *** [drivers/gpu/drm/nouveau] Error 2
make[2]: *** [drivers/gpu/drm] Error 2
make[1]: *** [drivers/gpu] Error 2
make: *** [drivers] Error 2

So how should I proceed? Can you tell me how to fix the above compile error, or
should I proceed to check both

b355096992e2b4d30bb77173927f45e7f2c12570
(immediately before 78df3a1c585c8c95fd9a472125f0cd406e8617ce) and

d1b167e168bdac0b6af11e7a8c601773639fc419
(immediately after 78df3a1c585c8c95fd9a472125f0cd406e8617ce)?

Please advise how I should move forward!

Thanks &amp; best regards,
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

--1387291863.bffb5.14561--

--===============1158876278==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1158876278==--
