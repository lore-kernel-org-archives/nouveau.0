From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58378] [NV86] Distorted graphics on NVIDIA GeForce
 8400M G after upgrade the kernel to 3.7.0 version
Date: Sun, 15 Dec 2013 14:09:55 +0000
Message-ID: <bug-58378-8800-NSI7H5nRsS@http.bugs.freedesktop.org/>
References: <bug-58378-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0312239416=="
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


--===============0312239416==
Content-Type: multipart/alternative; boundary="1387116595.1cDA24f5.14523"; charset="us-ascii"


--1387116595.1cDA24f5.14523
Date: Sun, 15 Dec 2013 14:09:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58378

--- Comment #29 from Andreas Loew <awl1-hi6Y0CQ0nG0@public.gmane.org> ---
OK, finally I have some more encouraging news:

It now looks like the issue indeed started much earlier than initially thought,
namely already between the 3.4 and 3.5 kernel series!!!

Results from my testing with stock kernels obtained from kernel.org (I've never
ever before compiled so many kernels in such a short period of time...):

* 3.4.5 -> NO ISSUE
* 3.4.74 -> NO ISSUE
* 3.5.1 -> ISSUE SEEN
* 3.5.5 -> ISSUE SEEN
* all later versions (3.6 onwards) -> ISSUE SEEN.

So please advise now what next steps I should undertake to track it down more
closely:

What new commits have happened between the 3.4 and 3.5 series, and did one of
them possibly affect so-called "fencing" on NV86/NV50 chips?

(And - in order to learn some more git - how can I find out the associated
commits using git command-line, such that I can produce the respective kernel
tarballs for testing out of git?)

Many thanks in advance for your feedback! :-)

Andreas

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1387116595.1cDA24f5.14523
Date: Sun, 15 Dec 2013 14:09:55 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378#c29">Comment # 29</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378">bug 58378</a>
              from <span class="vcard"><a class="email" href="mailto:awl1&#64;gmx.net" title="Andreas Loew &lt;awl1&#64;gmx.net&gt;"> <span class="fn">Andreas Loew</span></a>
</span></b>
        <pre>OK, finally I have some more encouraging news:

It now looks like the issue indeed started much earlier than initially thought,
namely already between the 3.4 and 3.5 kernel series!!!

Results from my testing with stock kernels obtained from kernel.org (I've never
ever before compiled so many kernels in such a short period of time...):

* 3.4.5 -&gt; NO ISSUE
* 3.4.74 -&gt; NO ISSUE
* 3.5.1 -&gt; ISSUE SEEN
* 3.5.5 -&gt; ISSUE SEEN
* all later versions (3.6 onwards) -&gt; ISSUE SEEN.

So please advise now what next steps I should undertake to track it down more
closely:

What new commits have happened between the 3.4 and 3.5 series, and did one of
them possibly affect so-called &quot;fencing&quot; on NV86/NV50 chips?

(And - in order to learn some more git - how can I find out the associated
commits using git command-line, such that I can produce the respective kernel
tarballs for testing out of git?)

Many thanks in advance for your feedback! :-)

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

--1387116595.1cDA24f5.14523--

--===============0312239416==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0312239416==--
