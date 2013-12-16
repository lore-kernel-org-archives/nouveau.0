From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58378] [NV86] Distorted graphics on NVIDIA GeForce
 8400M G after upgrade the kernel to 3.7.0 version
Date: Mon, 16 Dec 2013 13:02:11 +0000
Message-ID: <bug-58378-8800-frmpsy6OyD@http.bugs.freedesktop.org/>
References: <bug-58378-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1861400811=="
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


--===============1861400811==
Content-Type: multipart/alternative; boundary="1387198931.7afF35.19155"; charset="us-ascii"


--1387198931.7afF35.19155
Date: Mon, 16 Dec 2013 13:02:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58378

--- Comment #37 from Andreas Loew <awl1-hi6Y0CQ0nG0@public.gmane.org> ---
Hello again, Ilia,

ok, I see - did some further reading and I think I now fully understand the way
it works:

This also means that you are NOT regularly pulling the updates from Linus'
central git into the nouveau git, but typically only do this ONCE after Linus
released a new version (here: 3.4.0) and then NOT for any minor subsequent
release by Linus (3.4.1, 3.4.2 and so on), but ONLY shortly before he opens the
"rc" pull window for his next release series (here: 3.5-rc1).

So it indeed looks as if all the local commits on the nouveau git have been
made on a 3.4.0 kernel, although they ended up in the official 3.5 version
released by Linus.


Besed on this, I did further testing:

Both "5e120f6e4b3f35b741c5445dfc755f50128c3c44^" and
"5e120f6e4b3f35b741c5445dfc755f50128c3c44" do still run fine, i.e. the commit
5e120f6e4b3f35b741c5445dfc755f50128c3c44 - which actually introduced the
nv84_fence - does NOT seem to be causing the distortion issue.

I will now move forward (slowly, as I need to do the tarball-based rpmbuild
process), and keep you updated on my findings.


Also, I repeat my question to the other folks who had reported this issue
before:

Can you confirm that you also already see the issue when you use any stock
3.5.x or 3.6.x kernels, i.e. the issue did start long before 3.7.0 and the
3.4.x is the most recent release that works fine?

Thanks & BR,
Andreas

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1387198931.7afF35.19155
Date: Mon, 16 Dec 2013 13:02:11 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378#c37">Comment # 37</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378">bug 58378</a>
              from <span class="vcard"><a class="email" href="mailto:awl1&#64;gmx.net" title="Andreas Loew &lt;awl1&#64;gmx.net&gt;"> <span class="fn">Andreas Loew</span></a>
</span></b>
        <pre>Hello again, Ilia,

ok, I see - did some further reading and I think I now fully understand the way
it works:

This also means that you are NOT regularly pulling the updates from Linus'
central git into the nouveau git, but typically only do this ONCE after Linus
released a new version (here: 3.4.0) and then NOT for any minor subsequent
release by Linus (3.4.1, 3.4.2 and so on), but ONLY shortly before he opens the
&quot;rc&quot; pull window for his next release series (here: 3.5-rc1).

So it indeed looks as if all the local commits on the nouveau git have been
made on a 3.4.0 kernel, although they ended up in the official 3.5 version
released by Linus.


Besed on this, I did further testing:

Both &quot;5e120f6e4b3f35b741c5445dfc755f50128c3c44^&quot; and
&quot;5e120f6e4b3f35b741c5445dfc755f50128c3c44&quot; do still run fine, i.e. the commit
5e120f6e4b3f35b741c5445dfc755f50128c3c44 - which actually introduced the
nv84_fence - does NOT seem to be causing the distortion issue.

I will now move forward (slowly, as I need to do the tarball-based rpmbuild
process), and keep you updated on my findings.


Also, I repeat my question to the other folks who had reported this issue
before:

Can you confirm that you also already see the issue when you use any stock
3.5.x or 3.6.x kernels, i.e. the issue did start long before 3.7.0 and the
3.4.x is the most recent release that works fine?

Thanks &amp; BR,
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

--1387198931.7afF35.19155--

--===============1861400811==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1861400811==--
