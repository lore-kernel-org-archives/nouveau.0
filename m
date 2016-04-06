From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79518] nouveau causes lockup and reboot on GT215
Date: Wed, 06 Apr 2016 20:37:00 +0000
Message-ID: <bug-79518-8800-kdOnGbfaz5@http.bugs.freedesktop.org/>
References: <bug-79518-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1848185119=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-79518-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1848185119==
Content-Type: multipart/alternative; boundary="14599750192.941BED425.14338";
 charset="UTF-8"


--14599750192.941BED425.14338
Date: Wed, 6 Apr 2016 20:36:59 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=79518

--- Comment #8 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Adam Borowski from comment #7)
> 03: core 135 MHz shader 270 MHz memory 135 MHz
> 07: core 405 MHz shader 810 MHz memory 324 MHz
> 0f: core 600 MHz shader 1460 MHz memory 800 MHz
> AC: core 405 MHz shader 810 MHz memory 324 MHz

try

echo 07 > /sys/kernel/debug/dri/0/pstate

This should try to normalize the parameters while keeping the same perf level.
You can also try 03 and 0f (for low and high pstates).

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14599750192.941BED425.14338
Date: Wed, 6 Apr 2016 20:36:59 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau causes lockup and reboot on GT215"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79518#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau causes lockup and reboot on GT215"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79518">bug 79518</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Adam Borowski from <a href="show_bug.cgi?id=79518#c7">comment #7</a>)
<span class="quote">&gt; 03: core 135 MHz shader 270 MHz memory 135 MHz
&gt; 07: core 405 MHz shader 810 MHz memory 324 MHz
&gt; 0f: core 600 MHz shader 1460 MHz memory 800 MHz
&gt; AC: core 405 MHz shader 810 MHz memory 324 MHz</span >

try

echo 07 &gt; /sys/kernel/debug/dri/0/pstate

This should try to normalize the parameters while keeping the same perf level.
You can also try 03 and 0f (for low and high pstates).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14599750192.941BED425.14338--

--===============1848185119==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1848185119==--
