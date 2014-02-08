From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67878] [NV98] [BISECTED] Hardware freeze after
 resume from suspend
Date: Sat, 08 Feb 2014 07:20:42 +0000
Message-ID: <bug-67878-8800-CBEHp7B09y@http.bugs.freedesktop.org/>
References: <bug-67878-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1571925852=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67878-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1571925852==
Content-Type: multipart/alternative; boundary="1391844042.eE2bF5B3.9581"; charset="us-ascii"


--1391844042.eE2bF5B3.9581
Date: Sat, 8 Feb 2014 07:20:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67878

--- Comment #39 from Brian <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #38)
> Do you have any reason to believe that you have the same problem? This one
> was bisected to commit 4f6029da58ba9204c98e33f4f3737fe085c87a6f which
> appeared in v3.8 (which means that 3.7.x should all be fine).

Not necessarily, although initially the bug symptoms were rather similar, and
it's a similar family of hardware. I'm only now checking the bisection myself,
and it seems that that particular commit is not my only problem.

> Of course you have the additional problem of having a nva8 (this bug has
> nv98 hw users, although that doesn't exclude you from having the same issue
> -- the bisected commit was fairly generic), which is still unstable for some
> users, but was even more unstable in earlier kernels.

Well, that could complicate my ability to fix things here. I suspect that this
particular regression is one of several issues on my hardware, then.

> As for not seeing a
> PAGE_NOT_PRESENT -- are you sure that the kernels in question had code to
> emit the error in the first place?

The code seems to be present. For instance, I'm trying 3.6, where I see
nv50_fb_vm_trap() (drivers/gpu/drm/nouveau/nv50_fb.c) has the same "VM: trapped
write at 0x...." log message. So I presume that if I was still experiencing the
fault in 3.6, it would appear in the log.

BTW, I noticed Ben Gamari's earlier comments about mesa versioning, so I
downgraded to 9.1.4, and I still experience the same behavior.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391844042.eE2bF5B3.9581
Date: Sat, 8 Feb 2014 07:20:42 +0000
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
   title="NEW --- - [NV98] [BISECTED] Hardware freeze after resume from suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67878#c39">Comment # 39</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV98] [BISECTED] Hardware freeze after resume from suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67878">bug 67878</a>
              from <span class="vcard"><a class="email" href="mailto:computersforpeace&#64;gmail.com" title="Brian &lt;computersforpeace&#64;gmail.com&gt;"> <span class="fn">Brian</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=67878#c38">comment #38</a>)
<span class="quote">&gt; Do you have any reason to believe that you have the same problem? This one
&gt; was bisected to commit 4f6029da58ba9204c98e33f4f3737fe085c87a6f which
&gt; appeared in v3.8 (which means that 3.7.x should all be fine).</span >

Not necessarily, although initially the bug symptoms were rather similar, and
it's a similar family of hardware. I'm only now checking the bisection myself,
and it seems that that particular commit is not my only problem.

<span class="quote">&gt; Of course you have the additional problem of having a nva8 (this bug has
&gt; nv98 hw users, although that doesn't exclude you from having the same issue
&gt; -- the bisected commit was fairly generic), which is still unstable for some
&gt; users, but was even more unstable in earlier kernels.</span >

Well, that could complicate my ability to fix things here. I suspect that this
particular regression is one of several issues on my hardware, then.

<span class="quote">&gt; As for not seeing a
&gt; PAGE_NOT_PRESENT -- are you sure that the kernels in question had code to
&gt; emit the error in the first place?</span >

The code seems to be present. For instance, I'm trying 3.6, where I see
nv50_fb_vm_trap() (drivers/gpu/drm/nouveau/nv50_fb.c) has the same &quot;VM: trapped
write at 0x....&quot; log message. So I presume that if I was still experiencing the
fault in 3.6, it would appear in the log.

BTW, I noticed Ben Gamari's earlier comments about mesa versioning, so I
downgraded to 9.1.4, and I still experience the same behavior.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391844042.eE2bF5B3.9581--

--===============1571925852==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1571925852==--
