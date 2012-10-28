From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56474] 3D app segfaults on NV46
Date: Sun, 28 Oct 2012 01:22:30 +0000
Message-ID: <bug-56474-8800-YT4aqQmQ5c@http.bugs.freedesktop.org/>
References: <bug-56474-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1452481942=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-56474-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1452481942==
Content-Type: multipart/alternative; boundary="1351387350.B711a5Ca0.11212"; charset="us-ascii"


--1351387350.B711a5Ca0.11212
Date: Sun, 28 Oct 2012 01:22:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56474

--- Comment #2 from Gabriele Giacone <1o5g4r8o-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
22:34 < joi> gg0: does it work if you set NV30_SWTNL env var?
22:39 < gg0> joi: it started but seems stuck and it's taking 100% cpu
22:47 < joi> if I understand this code correctly, only SWTNL path handles 
             user buffers, so... someone needs to implement user buffers in 
             hw path or fix sw path (which is disabled by default and 
             probably broken)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1351387350.B711a5Ca0.11212
Date: Sun, 28 Oct 2012 01:22:30 +0000
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
   title="NEW --- - 3D app segfaults on NV46"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56474#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - 3D app segfaults on NV46"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56474">bug 56474</a>
              from <span class="vcard"><a class="email" href="mailto:1o5g4r8o&#64;gmail.com" title="Gabriele Giacone &lt;1o5g4r8o&#64;gmail.com&gt;"> <span class="fn">Gabriele Giacone</span></a>
</span></b>
        <pre>22:34 &lt; joi&gt; gg0: does it work if you set NV30_SWTNL env var?
22:39 &lt; gg0&gt; joi: it started but seems stuck and it's taking 100% cpu
22:47 &lt; joi&gt; if I understand this code correctly, only SWTNL path handles 
             user buffers, so... someone needs to implement user buffers in 
             hw path or fix sw path (which is disabled by default and 
             probably broken)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1351387350.B711a5Ca0.11212--

--===============1452481942==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1452481942==--
