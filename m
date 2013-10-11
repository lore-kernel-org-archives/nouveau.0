From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70390] G84: Repeated system crashes under graphics
 load, E[PFIFO] DMA_PUSHER and lots of E[PGRAPH]
Date: Fri, 11 Oct 2013 20:34:20 +0000
Message-ID: <bug-70390-8800-torlI8ClKh@http.bugs.freedesktop.org/>
References: <bug-70390-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1198779100=="
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


--===============1198779100==
Content-Type: multipart/alternative; boundary="1381523660.EBfa0d1.2328"; charset="us-ascii"


--1381523660.EBfa0d1.2328
Date: Fri, 11 Oct 2013 20:34:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70390

--- Comment #1 from Martin von Gagern <Martin.vGagern-hi6Y0CQ0nG0@public.gmane.org> ---
Created attachment 87486
  --> https://bugs.freedesktop.org/attachment.cgi?id=87486&action=edit
Oct 08 incident

I don't recall the exact circumstances of this Oct 08 incident. First and last
line of that error:

nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 2 [X[19399]] get 0x002002965c
put 0x002002ae2c ib_get 0x00000015 ib_put 0x0000002f state 0x8000e684 (err:
INVALID_CMD) push 0x00406040

nouveau E[  PGRAPH][0000:01:00.0] ch 2 [0x000fb33000 X[19399]] subc 7 class
0x8297 mthd 0x1358 data 0x00004303

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381523660.EBfa0d1.2328
Date: Fri, 11 Oct 2013 20:34:20 +0000
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
   title="NEW --- - G84: Repeated system crashes under graphics load, E[PFIFO] DMA_PUSHER and lots of E[PGRAPH]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70390#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - G84: Repeated system crashes under graphics load, E[PFIFO] DMA_PUSHER and lots of E[PGRAPH]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70390">bug 70390</a>
              from <span class="vcard"><a class="email" href="mailto:Martin.vGagern&#64;gmx.net" title="Martin von Gagern &lt;Martin.vGagern&#64;gmx.net&gt;"> <span class="fn">Martin von Gagern</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=87486" name="attach_87486" title="Oct 08 incident">attachment 87486</a> <a href="attachment.cgi?id=87486&amp;action=edit" title="Oct 08 incident">[details]</a></span>
Oct 08 incident

I don't recall the exact circumstances of this Oct 08 incident. First and last
line of that error:

nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 2 [X[19399]] get 0x002002965c
put 0x002002ae2c ib_get 0x00000015 ib_put 0x0000002f state 0x8000e684 (err:
INVALID_CMD) push 0x00406040

nouveau E[  PGRAPH][0000:01:00.0] ch 2 [0x000fb33000 X[19399]] subc 7 class
0x8297 mthd 0x1358 data 0x00004303</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381523660.EBfa0d1.2328--

--===============1198779100==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1198779100==--
