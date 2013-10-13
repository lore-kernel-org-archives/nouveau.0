From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70390] [NV84] Repeated system crashes under graphics
 load, E[PFIFO] DMA_PUSHER and lots of E[PGRAPH]
Date: Sun, 13 Oct 2013 12:09:20 +0000
Message-ID: <bug-70390-8800-YdAZlhF4Oy@http.bugs.freedesktop.org/>
References: <bug-70390-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1290227924=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70390-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1290227924==
Content-Type: multipart/alternative; boundary="1381666160.0FF8F651.716"; charset="us-ascii"


--1381666160.0FF8F651.716
Date: Sun, 13 Oct 2013 12:09:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70390

--- Comment #10 from Martin von Gagern <Martin.vGagern-hi6Y0CQ0nG0@public.gmane.org> ---
Created attachment 87553
  --> https://bugs.freedesktop.org/attachment.cgi?id=87553&action=edit
report 0x00406040 value in nouveau_bo_wr32

(In reply to comment #9)
> (In reply to comment #8)
> > So... the mystery is where does this 0x40 method come from.
> 
> Can we add a bit of debug code somewhere, to detect that specific value when
> it enters the ring, and emit useful information like a kernel stack trace?

Gave this a stab, using a BUG_ON conditional the way this attachment describes
it. Unless static function scope variables don't work the same in kernel space
and in unser space, this should report if, BEGIN_NV04, OUT_RING or some other
command was used to write this value.

Result: I managed to get that first DMA_PUSHER line all by itself:

nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 4 [stellarium[14333]] get
0x0020111a6c put 0x0020116e10 ib_get 0x00000070 ib_put 0x00000097 state
0x80007641 (err: INVALID_CMD) push 0x00406040

With no stack trace or other indication that my BUG_ON got triggered. Also with
no subsequent error messages, or system crash.

So I'd conclude that the line does not neccessarily lead to a crash, and that
the critical value does not get written via nouveau_bo_wr32. Where else could
it come from? What is the most central location where I might put such code?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381666160.0FF8F651.716
Date: Sun, 13 Oct 2013 12:09:20 +0000
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
   title="NEW --- - [NV84] Repeated system crashes under graphics load, E[PFIFO] DMA_PUSHER and lots of E[PGRAPH]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70390#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV84] Repeated system crashes under graphics load, E[PFIFO] DMA_PUSHER and lots of E[PGRAPH]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70390">bug 70390</a>
              from <span class="vcard"><a class="email" href="mailto:Martin.vGagern&#64;gmx.net" title="Martin von Gagern &lt;Martin.vGagern&#64;gmx.net&gt;"> <span class="fn">Martin von Gagern</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=87553" name="attach_87553" title="report 0x00406040 value in nouveau_bo_wr32">attachment 87553</a> <a href="attachment.cgi?id=87553&amp;action=edit" title="report 0x00406040 value in nouveau_bo_wr32">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=70390&amp;attachment=87553'>[review]</a>
report 0x00406040 value in nouveau_bo_wr32

(In reply to <a href="show_bug.cgi?id=70390#c9">comment #9</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=70390#c8">comment #8</a>)
&gt; &gt; So... the mystery is where does this 0x40 method come from.
&gt; 
&gt; Can we add a bit of debug code somewhere, to detect that specific value when
&gt; it enters the ring, and emit useful information like a kernel stack trace?</span >

Gave this a stab, using a BUG_ON conditional the way this attachment describes
it. Unless static function scope variables don't work the same in kernel space
and in unser space, this should report if, BEGIN_NV04, OUT_RING or some other
command was used to write this value.

Result: I managed to get that first DMA_PUSHER line all by itself:

nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 4 [stellarium[14333]] get
0x0020111a6c put 0x0020116e10 ib_get 0x00000070 ib_put 0x00000097 state
0x80007641 (err: INVALID_CMD) push 0x00406040

With no stack trace or other indication that my BUG_ON got triggered. Also with
no subsequent error messages, or system crash.

So I'd conclude that the line does not neccessarily lead to a crash, and that
the critical value does not get written via nouveau_bo_wr32. Where else could
it come from? What is the most central location where I might put such code?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381666160.0FF8F651.716--

--===============1290227924==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1290227924==--
