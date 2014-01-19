From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73791] [NV96] [BISECTED] Regression: 9600M GT fails
 to boot with 3.13-rc8
Date: Sun, 19 Jan 2014 12:57:47 +0000
Message-ID: <bug-73791-8800-TmK8mhALNL@http.bugs.freedesktop.org/>
References: <bug-73791-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0068340958=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-73791-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0068340958==
Content-Type: multipart/alternative; boundary="1390136267.a23e2.27862"; charset="us-ascii"


--1390136267.a23e2.27862
Date: Sun, 19 Jan 2014 12:57:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73791

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
The only weird thing I see in your log is

[    0.766097] nouveau  [     MXM][0000:01:00.0] unmatched output device
0x96006403e8060100
[    0.766099] nouveau  [     MXM][0000:01:00.0] unmatched output device
0x0000004100009600

Can you get the dmesg from one of the failed boots with a HEAD kernel? It's
probably in your system logs. That should pinpoint exactly where the issue is.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390136267.a23e2.27862
Date: Sun, 19 Jan 2014 12:57:47 +0000
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
   title="NEW --- - [NV96] [BISECTED] Regression: 9600M GT fails to boot with 3.13-rc8"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73791#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV96] [BISECTED] Regression: 9600M GT fails to boot with 3.13-rc8"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73791">bug 73791</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>The only weird thing I see in your log is

[    0.766097] nouveau  [     MXM][0000:01:00.0] unmatched output device
0x96006403e8060100
[    0.766099] nouveau  [     MXM][0000:01:00.0] unmatched output device
0x0000004100009600

Can you get the dmesg from one of the failed boots with a HEAD kernel? It's
probably in your system logs. That should pinpoint exactly where the issue is.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1390136267.a23e2.27862--

--===============0068340958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0068340958==--
