From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 65310] [regression] failure in building nvc0_vbo.lo:
 /tmp/cclDjdRp.s:1270: Error: missing or invalid displacement expression
 `-8589934576
Date: Sun, 25 Aug 2013 17:46:22 +0000
Message-ID: <bug-65310-8800-w485yyxpSD@http.bugs.freedesktop.org/>
References: <bug-65310-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1870675473=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-65310-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1870675473==
Content-Type: multipart/alternative; boundary="1377452782.6C70e1.12485"; charset="us-ascii"


--1377452782.6C70e1.12485
Date: Sun, 25 Aug 2013 17:46:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=65310

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Please provide repro steps. I'm inclined to believe this is a problem in the
environment, and not a core gcc bug. But those are some trippy optimization
flags, so who knows. Be sure to specify the platform you're building for (given
the sse2 flag, x86 or x86_64... but which one... I guess x86 since x86_64
implies sse2).

If you can reproduce this by just running a single gcc command (like the one
you pasted, but figure out the actual gcc invocation), you should file a gcc
bug too.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377452782.6C70e1.12485
Date: Sun, 25 Aug 2013 17:46:22 +0000
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
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [regression] failure in building nvc0_vbo.lo: /tmp/cclDjdRp.s:1270: Error: missing or invalid displacement expression `-8589934576"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=65310#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [regression] failure in building nvc0_vbo.lo: /tmp/cclDjdRp.s:1270: Error: missing or invalid displacement expression `-8589934576"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=65310">bug 65310</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Please provide repro steps. I'm inclined to believe this is a problem in the
environment, and not a core gcc bug. But those are some trippy optimization
flags, so who knows. Be sure to specify the platform you're building for (given
the sse2 flag, x86 or x86_64... but which one... I guess x86 since x86_64
implies sse2).

If you can reproduce this by just running a single gcc command (like the one
you pasted, but figure out the actual gcc invocation), you should file a gcc
bug too.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377452782.6C70e1.12485--

--===============1870675473==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1870675473==--
