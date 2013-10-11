From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70390] G84: Repeated system crashes under graphics
 load, E[PFIFO] DMA_PUSHER and lots of E[PGRAPH]
Date: Fri, 11 Oct 2013 20:37:09 +0000
Message-ID: <bug-70390-8800-gyOh6QlbHB@http.bugs.freedesktop.org/>
References: <bug-70390-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0835232448=="
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


--===============0835232448==
Content-Type: multipart/alternative; boundary="1381523830.fBCFa1f21.2768"; charset="us-ascii"


--1381523830.fBCFa1f21.2768
Date: Fri, 11 Oct 2013 20:37:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70390

--- Comment #3 from Martin von Gagern <Martin.vGagern-hi6Y0CQ0nG0@public.gmane.org> ---
Created attachment 87488
  --> https://bugs.freedesktop.org/attachment.cgi?id=87488&action=edit
Oct 11 incident

The Oct 11 incident was mostly Firefox opening a large number of PDF documents
with massive use of (rather low-res) graphics. Probably kept a number of them
buffered somewhere? I'll quote the first and the last TWO lines, since the
penultimate one seems similar to the last one of the previous crashes.

nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 2 [X[3272]] get 0x002002a90c
put 0x002002be40 ib_get 0x0000012b ib_put 0x00000141 state 0x80004861 (err:
INVALID_CMD) push 0x00406040

nouveau E[  PGRAPH][0000:01:00.0] ch 2 [0x000fb33000 X[3272]] subc 0 class
0x5039 mthd 0x0328 data 0x00000000
nouveau E[     PFB][0000:01:00.0] trapped read at 0x0022733000 on channel
0x0000fb33 [X[3272]] PGRAPH/DISPATCH/M2M_IN reason: PAGE_NOT_PRESENT

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381523830.fBCFa1f21.2768
Date: Fri, 11 Oct 2013 20:37:10 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70390#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - G84: Repeated system crashes under graphics load, E[PFIFO] DMA_PUSHER and lots of E[PGRAPH]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70390">bug 70390</a>
              from <span class="vcard"><a class="email" href="mailto:Martin.vGagern&#64;gmx.net" title="Martin von Gagern &lt;Martin.vGagern&#64;gmx.net&gt;"> <span class="fn">Martin von Gagern</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=87488" name="attach_87488" title="Oct 11 incident">attachment 87488</a> <a href="attachment.cgi?id=87488&amp;action=edit" title="Oct 11 incident">[details]</a></span>
Oct 11 incident

The Oct 11 incident was mostly Firefox opening a large number of PDF documents
with massive use of (rather low-res) graphics. Probably kept a number of them
buffered somewhere? I'll quote the first and the last TWO lines, since the
penultimate one seems similar to the last one of the previous crashes.

nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 2 [X[3272]] get 0x002002a90c
put 0x002002be40 ib_get 0x0000012b ib_put 0x00000141 state 0x80004861 (err:
INVALID_CMD) push 0x00406040

nouveau E[  PGRAPH][0000:01:00.0] ch 2 [0x000fb33000 X[3272]] subc 0 class
0x5039 mthd 0x0328 data 0x00000000
nouveau E[     PFB][0000:01:00.0] trapped read at 0x0022733000 on channel
0x0000fb33 [X[3272]] PGRAPH/DISPATCH/M2M_IN reason: PAGE_NOT_PRESENT</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381523830.fBCFa1f21.2768--

--===============0835232448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0835232448==--
