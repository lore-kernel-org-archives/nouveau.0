From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75761] weston-launch no output - black screen
Date: Sun, 01 Jun 2014 10:15:47 +0000
Message-ID: <bug-75761-8800-j79VY3PGYM@http.bugs.freedesktop.org/>
References: <bug-75761-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1592575399=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75761-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1592575399==
Content-Type: multipart/alternative; boundary="1401617747.2bcc5.18099"; charset="us-ascii"


--1401617747.2bcc5.18099
Date: Sun, 1 Jun 2014 10:15:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75761

--- Comment #32 from Pekka Paalanen <ppaalanen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #31)
> Created attachment 100199 [details]
> weston log with pixman

Something is seriously wrong here:
[09:58:29.402] queueing pageflip failed: Permission denied

But I see you have another weston session afterwards, which seems to run, but:
[12:26:36.371] page_flip_handler: time 0.000000 frame 603
[12:26:36.371] got pageflip event
[12:26:36.388] page_flip_handler: time 0.000000 frame 603
[12:26:36.388] got pageflip event
[12:26:36.404] page_flip_handler: time 0.000000 frame 603
[12:26:36.404] got pageflip event
[12:26:36.421] page_flip_handler: time 0.000000 frame 603
[12:26:36.421] got pageflip event
[12:26:36.437] page_flip_handler: time 0.000000 frame 603
[12:26:36.438] got pageflip event
[12:26:36.454] page_flip_handler: time 0.000000 frame 603

That means that the kernel DRM driver does not provide timestamps and it does
not even advance the vblank counter(?) if I understood right.

So at least for you, the problem is that the kernel DRM does not report proper
pageflip timestamps. I would consider this as a kernel driver bug, but if the
kernel developers insist, I suppose we could also hack around it in Weston by
providing fake timestamps, disabling the Presentation extension (somewhat
similar X11 Present, not yet merged) and yelling loudly. But I'd rather the
driver got fixed.

As far as I see, bad timestamps are enough to make Weston stay black (fade-in
animation not advancing), yet appear to work just fine. So at least we (Weston
devs) should detect when the kernel driver is faulty, and abort Weston.

Weston, and also the intention in Wayland, is to rely on the proper pageflip
timestamps from the kernel for timing... well, everything visual, so we really
would like it to work.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1401617747.2bcc5.18099
Date: Sun, 1 Jun 2014 10:15:47 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - weston-launch no output - black screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75761#c32">Comment # 32</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - weston-launch no output - black screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75761">bug 75761</a>
              from <span class="vcard"><a class="email" href="mailto:ppaalanen&#64;gmail.com" title="Pekka Paalanen &lt;ppaalanen&#64;gmail.com&gt;"> <span class="fn">Pekka Paalanen</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=75761#c31">comment #31</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=100199" name="attach_100199" title="weston log with pixman">attachment 100199</a> <a href="attachment.cgi?id=100199&amp;action=edit" title="weston log with pixman">[details]</a></span>
&gt; weston log with pixman</span >

Something is seriously wrong here:
[09:58:29.402] queueing pageflip failed: Permission denied

But I see you have another weston session afterwards, which seems to run, but:
[12:26:36.371] page_flip_handler: time 0.000000 frame 603
[12:26:36.371] got pageflip event
[12:26:36.388] page_flip_handler: time 0.000000 frame 603
[12:26:36.388] got pageflip event
[12:26:36.404] page_flip_handler: time 0.000000 frame 603
[12:26:36.404] got pageflip event
[12:26:36.421] page_flip_handler: time 0.000000 frame 603
[12:26:36.421] got pageflip event
[12:26:36.437] page_flip_handler: time 0.000000 frame 603
[12:26:36.438] got pageflip event
[12:26:36.454] page_flip_handler: time 0.000000 frame 603

That means that the kernel DRM driver does not provide timestamps and it does
not even advance the vblank counter(?) if I understood right.

So at least for you, the problem is that the kernel DRM does not report proper
pageflip timestamps. I would consider this as a kernel driver bug, but if the
kernel developers insist, I suppose we could also hack around it in Weston by
providing fake timestamps, disabling the Presentation extension (somewhat
similar X11 Present, not yet merged) and yelling loudly. But I'd rather the
driver got fixed.

As far as I see, bad timestamps are enough to make Weston stay black (fade-in
animation not advancing), yet appear to work just fine. So at least we (Weston
devs) should detect when the kernel driver is faulty, and abort Weston.

Weston, and also the intention in Wayland, is to rely on the proper pageflip
timestamps from the kernel for timing... well, everything visual, so we really
would like it to work.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1401617747.2bcc5.18099--

--===============1592575399==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1592575399==--
