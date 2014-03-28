From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76732] Kworker using 100% CPU
Date: Fri, 28 Mar 2014 18:04:10 +0000
Message-ID: <bug-76732-8800-qbHeRrgfP2@http.bugs.freedesktop.org/>
References: <bug-76732-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0002556646=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-76732-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0002556646==
Content-Type: multipart/alternative; boundary="1396029850.FfE48f52.26234"; charset="us-ascii"


--1396029850.FfE48f52.26234
Date: Fri, 28 Mar 2014 18:04:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76732

--- Comment #17 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #16)
> Samples: 121K of event 'cycles', Event count (approx.): 71741963089
> +  64.62%      kworker/1:1  [kernel.kallsyms]        [k] ioread32
> +  18.47%      kworker/1:1  [kernel.kallsyms]        [k] native_read_tsc
> +  13.71%      kworker/1:1  [kernel.kallsyms]        [k] delay_tsc
> +   2.31%          swapper  [kernel.kallsyms]        [k] ioread32

There was supposed to be a call graph... Perhaps you're using an older version
of perf? Or perhaps it really wants you to pass in -g for report? (Or you
didn't use -g when recording?)

Or maybe you're in the curses TUI and you have to select to expand? I forget
how it works :(

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1396029850.FfE48f52.26234
Date: Fri, 28 Mar 2014 18:04:10 +0000
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
   title="NEW --- - Kworker using 100% CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76732#c17">Comment # 17</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Kworker using 100% CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76732">bug 76732</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=76732#c16">comment #16</a>)
<span class="quote">&gt; Samples: 121K of event 'cycles', Event count (approx.): 71741963089
&gt; +  64.62%      kworker/1:1  [kernel.kallsyms]        [k] ioread32
&gt; +  18.47%      kworker/1:1  [kernel.kallsyms]        [k] native_read_tsc
&gt; +  13.71%      kworker/1:1  [kernel.kallsyms]        [k] delay_tsc
&gt; +   2.31%          swapper  [kernel.kallsyms]        [k] ioread32</span >

There was supposed to be a call graph... Perhaps you're using an older version
of perf? Or perhaps it really wants you to pass in -g for report? (Or you
didn't use -g when recording?)

Or maybe you're in the curses TUI and you have to select to expand? I forget
how it works :(</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1396029850.FfE48f52.26234--

--===============0002556646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0002556646==--
