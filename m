From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 20341] NV31 lockup
Date: Fri, 23 Aug 2013 15:14:23 +0000
Message-ID: <bug-20341-8800-beRrgW8oYt@http.bugs.freedesktop.org/>
References: <bug-20341-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2051796870=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-20341-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2051796870==
Content-Type: multipart/alternative; boundary="1377270863.6c83eb41.31268"; charset="us-ascii"


--1377270863.6c83eb41.31268
Date: Fri, 23 Aug 2013 15:14:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=20341

--- Comment #15 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Hm, after more careful review, I take back my comment about the scheme being
fragile. (I mean, it's still fragile, but not AS fragile as I thought. I don't
see a way for it to fail under normal circumstances.)

However one very simple explanation is that a call command is making it onto
the userspace-supplied pushbuf. Let's make sure that this is not the case --
Get valgrind-mmt going (http://nouveau.freedesktop.org/wiki/Valgrind-mmt/), and
run X inside of mmt, and run x11perf until it dies, e.g.

valgrind --tool=mmt --mmt-trace-file=/dev/dri/card0 --mmt-trace-nouveau-ioctls
xinit x11perf -putimage500 -- :1 >& xorg-mmt.log

or something along those lines. (And you can run it in a separate X server so
you don't have to kill your "real" session.)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377270863.6c83eb41.31268
Date: Fri, 23 Aug 2013 15:14:23 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - NV31 lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=20341#c15">Comment # 15</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - NV31 lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=20341">bug 20341</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Hm, after more careful review, I take back my comment about the scheme being
fragile. (I mean, it's still fragile, but not AS fragile as I thought. I don't
see a way for it to fail under normal circumstances.)

However one very simple explanation is that a call command is making it onto
the userspace-supplied pushbuf. Let's make sure that this is not the case --
Get valgrind-mmt going (<a href="http://nouveau.freedesktop.org/wiki/Valgrind-mmt/">http://nouveau.freedesktop.org/wiki/Valgrind-mmt/</a>), and
run X inside of mmt, and run x11perf until it dies, e.g.

valgrind --tool=mmt --mmt-trace-file=/dev/dri/card0 --mmt-trace-nouveau-ioctls
xinit x11perf -putimage500 -- :1 &gt;&amp; xorg-mmt.log

or something along those lines. (And you can run it in a separate X server so
you don't have to kill your &quot;real&quot; session.)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377270863.6c83eb41.31268--

--===============2051796870==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2051796870==--
