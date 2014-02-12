From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74903] [NV34] TV Load not detected in X
Date: Wed, 12 Feb 2014 22:20:18 +0000
Message-ID: <bug-74903-8800-P8qzVPD49D@http.bugs.freedesktop.org/>
References: <bug-74903-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0686329465=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-74903-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0686329465==
Content-Type: multipart/alternative; boundary="1392243617.72dB3DcE1.16452"; charset="us-ascii"


--1392243617.72dB3DcE1.16452
Date: Wed, 12 Feb 2014 22:20:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74903

--- Comment #3 from Alexandre <alexandre.nunes-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #2)
> What happens if you're in X (with the image off) and then try to switch back
> to the console? Does it come on, or is it off forever?

It's off forever. But I can't even reproduce this anymore, please keep reading.
> 
> I don't see any relevant changes between 3.11.2 and 3.11.6... would be very
> interesitng to know what causes the additional regression -- it should be a
> pretty fast bisect, if you're up for it.

In fact, it's worse: It seems intermitent. I can only get there about 1 in 3
attempts if I cold boot (w kernel 3.11.2, I suspect newer kernels could be the
same thing) (i.e. turn the power off and on again), but never if I just reboot
after getting the "blue screen" from tv.

But here is the strange thing: I tested on another tv and it's ok. Since this
problematic tv only hits this bug on KMS (intermitent)/xserver w/
nouveau(always happens as far as I've observed), but not on console or vesa fb,
I suspect it could be related to load detection. 

I tried booting with param video=TV1:e as (poorly) documented way to force tv
on. dmesg log and X log now plays nice as if the tv was indeed connected,
however, I can't see anything past kms trigger.

Is there a way to truly override load detection? As I said, the other tv is
just fine, the dmesg shows tv connected.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392243617.72dB3DcE1.16452
Date: Wed, 12 Feb 2014 22:20:17 +0000
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
   title="NEW --- - [NV34] TV Load not detected in X"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74903#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV34] TV Load not detected in X"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74903">bug 74903</a>
              from <span class="vcard"><a class="email" href="mailto:alexandre.nunes&#64;gmail.com" title="Alexandre &lt;alexandre.nunes&#64;gmail.com&gt;"> <span class="fn">Alexandre</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=74903#c2">comment #2</a>)
<span class="quote">&gt; What happens if you're in X (with the image off) and then try to switch back
&gt; to the console? Does it come on, or is it off forever?</span >

It's off forever. But I can't even reproduce this anymore, please keep reading.
<span class="quote">&gt; 
&gt; I don't see any relevant changes between 3.11.2 and 3.11.6... would be very
&gt; interesitng to know what causes the additional regression -- it should be a
&gt; pretty fast bisect, if you're up for it.</span >

In fact, it's worse: It seems intermitent. I can only get there about 1 in 3
attempts if I cold boot (w kernel 3.11.2, I suspect newer kernels could be the
same thing) (i.e. turn the power off and on again), but never if I just reboot
after getting the &quot;blue screen&quot; from tv.

But here is the strange thing: I tested on another tv and it's ok. Since this
problematic tv only hits this bug on KMS (intermitent)/xserver w/
nouveau(always happens as far as I've observed), but not on console or vesa fb,
I suspect it could be related to load detection. 

I tried booting with param video=TV1:e as (poorly) documented way to force tv
on. dmesg log and X log now plays nice as if the tv was indeed connected,
however, I can't see anything past kms trigger.

Is there a way to truly override load detection? As I said, the other tv is
just fine, the dmesg shows tv connected.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392243617.72dB3DcE1.16452--

--===============0686329465==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0686329465==--
