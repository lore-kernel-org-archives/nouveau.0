From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94817] Nearest neighbor scaling?
Date: Tue, 05 Apr 2016 03:35:53 +0000
Message-ID: <bug-94817-8800-9wjaASuiMO@http.bugs.freedesktop.org/>
References: <bug-94817-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0630001644=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94817-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0630001644==
Content-Type: multipart/alternative; boundary="14598273520.f9262e.9966";
 charset="UTF-8"


--14598273520.f9262e.9966
Date: Tue, 5 Apr 2016 03:35:52 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94817

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
I believe you can get this behaviour by setting the scaling mode property
to full. This should be possible with xrandr, or directly via the kms api.
It defaults to no scaling for external screens, as those usually have
better scalers built in.
On Apr 4, 2016 10:44 AM, <bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org> wrote:

> Bug ID 94817 <https://bugs.freedesktop.org/show_bug.cgi?id=94817>
> Summary Nearest neighbor scaling?
> Product xorg
> Version unspecified
> Hardware Other
> OS All
> Status NEW
> Severity enhancement
> Priority medium
> Component Driver/nouveau
> Assignee nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> Reporter nw9165-3201-/E1597aS9LQAvxtiuMwx3w@public.gmane.org
> QA Contact xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
>
> Hello,
>
> would it be possible that you add a nearest-neighbor scaling mode to the
> driver, so that one could display 1920x1080 natively on a 3840x2160 monitor or
> 1280x720 natively on a 2560x1440 monitor and so on (one pixel becomes four
> pixels)?
>
> There is some information on this topic over there:
> https://forums.geforce.com/default/topic/844905/geforce-drivers/integer-scaling-mode/
>
> Regards
>
> ------------------------------
> You are receiving this mail because:
>
>    - You are the assignee for the bug.
>
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>
>

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14598273520.f9262e.9966
Date: Tue, 5 Apr 2016 03:35:52 +0000
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
   title="NEW - Nearest neighbor scaling?"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94817#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nearest neighbor scaling?"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94817">bug 94817</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>I believe you can get this behaviour by setting the scaling mode property
to full. This should be possible with xrandr, or directly via the kms api.
It defaults to no scaling for external screens, as those usually have
better scalers built in.
On Apr 4, 2016 10:44 AM, &lt;<a href="mailto:bugzilla-daemon&#64;freedesktop.org">bugzilla-daemon&#64;freedesktop.org</a>&gt; wrote:

<span class="quote">&gt; Bug ID 94817 &lt;<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nearest neighbor scaling?"
   href="show_bug.cgi?id=94817">https://bugs.freedesktop.org/show_bug.cgi?id=94817</a>&gt;
&gt; Summary Nearest neighbor scaling?
&gt; Product xorg
&gt; Version unspecified
&gt; Hardware Other
&gt; OS All
&gt; Status NEW
&gt; Severity enhancement
&gt; Priority medium
&gt; Component Driver/nouveau
&gt; Assignee <a href="mailto:nouveau&#64;lists.freedesktop.org">nouveau&#64;lists.freedesktop.org</a>
&gt; Reporter <a href="mailto:nw9165-3201&#64;yahoo.com">nw9165-3201&#64;yahoo.com</a>
&gt; QA Contact <a href="mailto:xorg-team&#64;lists.x.org">xorg-team&#64;lists.x.org</a></span >
&gt;
<span class="quote">&gt; Hello,</span >
&gt;
<span class="quote">&gt; would it be possible that you add a nearest-neighbor scaling mode to the
&gt; driver, so that one could display 1920x1080 natively on a 3840x2160 monitor or
&gt; 1280x720 natively on a 2560x1440 monitor and so on (one pixel becomes four
&gt; pixels)?</span >
&gt;
<span class="quote">&gt; There is some information on this topic over there:
&gt; <a href="https://forums.geforce.com/default/topic/844905/geforce-drivers/integer-scaling-mode/">https://forums.geforce.com/default/topic/844905/geforce-drivers/integer-scaling-mode/</a></span >
&gt;
<span class="quote">&gt; Regards</span >
&gt;
<span class="quote">&gt; ------------------------------
&gt; You are receiving this mail because:</span >
&gt;
<span class="quote">&gt;    - You are the assignee for the bug.</span >
&gt;
&gt;
<span class="quote">&gt; _______________________________________________
&gt; Nouveau mailing list
&gt; <a href="mailto:Nouveau&#64;lists.freedesktop.org">Nouveau&#64;lists.freedesktop.org</a>
&gt; <a href="https://lists.freedesktop.org/mailman/listinfo/nouveau">https://lists.freedesktop.org/mailman/listinfo/nouveau</a></span >
&gt;
&gt;</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14598273520.f9262e.9966--

--===============0630001644==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0630001644==--
