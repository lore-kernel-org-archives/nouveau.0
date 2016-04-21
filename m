From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95031] [NVE4] 660 Ti Random GPU lockups
Date: Thu, 21 Apr 2016 03:12:30 +0000
Message-ID: <bug-95031-8800-xqqVIA89Uu@http.bugs.freedesktop.org/>
References: <bug-95031-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1469008926=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-95031-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1469008926==
Content-Type: multipart/alternative; boundary="14612083500.627F0.31033";
 charset="UTF-8"


--14612083500.627F0.31033
Date: Thu, 21 Apr 2016 03:12:30 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=95031

--- Comment #4 from Lucas Ribeiro <lucasout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
OK, some interesting findings.

07 pstate on Linux has:
core 324 MHz memory 648 MHz AC DC
GPU core:     +0.99 V
Increasing GPU core voltage to 1.09V has wielded a stable system so far.

On Windows, the idle state has (checked with gpu-z):
core 324 MHz memory 162MHz
GPU core voltage: 0.99V
It has never managed to hang.

So maybe 07 pstate on Linux has a memory clock too high for its voltage. Also,
as it is the lowest pstate, maybe memory clock could be reduced further to
162MHz (as in Windows).

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14612083500.627F0.31033
Date: Thu, 21 Apr 2016 03:12:30 +0000
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
   title="NEW - [NVE4] 660 Ti Random GPU lockups"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95031#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE4] 660 Ti Random GPU lockups"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95031">bug 95031</a>
              from <span class="vcard"><a class="email" href="mailto:lucasout&#64;gmail.com" title="Lucas Ribeiro &lt;lucasout&#64;gmail.com&gt;"> <span class="fn">Lucas Ribeiro</span></a>
</span></b>
        <pre>OK, some interesting findings.

07 pstate on Linux has:
core 324 MHz memory 648 MHz AC DC
GPU core:     +0.99 V
Increasing GPU core voltage to 1.09V has wielded a stable system so far.

On Windows, the idle state has (checked with gpu-z):
core 324 MHz memory 162MHz
GPU core voltage: 0.99V
It has never managed to hang.

So maybe 07 pstate on Linux has a memory clock too high for its voltage. Also,
as it is the lowest pstate, maybe memory clock could be reduced further to
162MHz (as in Windows).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14612083500.627F0.31033--

--===============1469008926==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1469008926==--
