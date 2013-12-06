From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69952] [NVAA] Xorg crash+restart after glxgears on
	3.12-rc2
Date: Fri, 06 Dec 2013 22:51:42 +0000
Message-ID: <bug-69952-8800-B8b5MWI36A@http.bugs.freedesktop.org/>
References: <bug-69952-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1615593954=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69952-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1615593954==
Content-Type: multipart/alternative; boundary="1386370302.CeE2aBb1.10444"; charset="us-ascii"


--1386370302.CeE2aBb1.10444
Date: Fri, 6 Dec 2013 22:51:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69952

--- Comment #5 from dirkneukirchen-S0/GAf8tV78@public.gmane.org ---
Created attachment 90379
  --> https://bugs.freedesktop.org/attachment.cgi?id=90379&action=edit
Same error on kernel 3.13-rc2

Kernel 3.13-rc2 has it too 

complete log attached with nouveau trace enabled; possibly interesting snippets
(these were seen previously too):
[   47.726763] nouveau E[   PFIFO][0000:02:00.0] DMA_PUSHER - ch 2 [Xorg[2244]]
get 0x0020016b30 put 0x0020016b4c ib_get 0x0000024b ib_put 0x000002a9 state
0x80000030 (err: INVALID_CMD) push 0x00400040
[   47.810523] nouveau E[  PGRAPH][0000:02:00.0] DATA_ERROR INVALID_VALUE
[   47.810545] nouveau E[  PGRAPH][0000:02:00.0]  DATA_ERROR
[   47.810565] nouveau E[  PGRAPH][0000:02:00.0] ch 2 [0x0007b45000 Xorg[2244]]
subc 2 class 0x502d mthd 0x08d4 data 0x00144230
[  131.224959] nouveau E[   PFIFO][0000:02:00.0] DMA_PUSHER - ch 2 [Xorg[2244]]
get 0x002002b068 put 0x002002b11c ib_get 0x0000016c ib_put 0x000001bb state
0x800048e0 (err: INVALID_CMD) push 0x00400040
[  131.392877] nouveau E[  PGRAPH][0000:02:00.0] DATA_ERROR INVALID_VALUE
[  131.392898] nouveau E[  PGRAPH][0000:02:00.0]  DATA_ERROR
[  131.392918] nouveau E[  PGRAPH][0000:02:00.0] ch 2 [0x0007b45000 Xorg[2244]]
subc 2 class 0x502d mthd 0x08dc data 0x00144230


[  162.340013] nouveau E[Xorg[2244]] failed to idle channel 0xcccc0000
[Xorg[2244]]
[  177.340015] nouveau E[Xorg[2244]] failed to idle channel 0xcccc0000
[Xorg[2244]]
[  207.520133] nouveau E[     PFB][0000:02:00.0] trapped read at 0x0020012020
on channel 0x0000797f [unknown] SEMAPHORE_BG/PFIFO_READ/00 reason:
PAGE_NOT_PRESENT

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1386370302.CeE2aBb1.10444
Date: Fri, 6 Dec 2013 22:51:42 +0000
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
   title="NEW --- - [NVAA] Xorg crash+restart after glxgears on 3.12-rc2"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69952#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVAA] Xorg crash+restart after glxgears on 3.12-rc2"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69952">bug 69952</a>
              from <span class="vcard"><a class="email" href="mailto:dirkneukirchen&#64;web.de" title="dirkneukirchen&#64;web.de">dirkneukirchen&#64;web.de</a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=90379" name="attach_90379" title="Same error on kernel 3.13-rc2">attachment 90379</a> <a href="attachment.cgi?id=90379&amp;action=edit" title="Same error on kernel 3.13-rc2">[details]</a></span>
Same error on kernel 3.13-rc2

Kernel 3.13-rc2 has it too 

complete log attached with nouveau trace enabled; possibly interesting snippets
(these were seen previously too):
[   47.726763] nouveau E[   PFIFO][0000:02:00.0] DMA_PUSHER - ch 2 [Xorg[2244]]
get 0x0020016b30 put 0x0020016b4c ib_get 0x0000024b ib_put 0x000002a9 state
0x80000030 (err: INVALID_CMD) push 0x00400040
[   47.810523] nouveau E[  PGRAPH][0000:02:00.0] DATA_ERROR INVALID_VALUE
[   47.810545] nouveau E[  PGRAPH][0000:02:00.0]  DATA_ERROR
[   47.810565] nouveau E[  PGRAPH][0000:02:00.0] ch 2 [0x0007b45000 Xorg[2244]]
subc 2 class 0x502d mthd 0x08d4 data 0x00144230
[  131.224959] nouveau E[   PFIFO][0000:02:00.0] DMA_PUSHER - ch 2 [Xorg[2244]]
get 0x002002b068 put 0x002002b11c ib_get 0x0000016c ib_put 0x000001bb state
0x800048e0 (err: INVALID_CMD) push 0x00400040
[  131.392877] nouveau E[  PGRAPH][0000:02:00.0] DATA_ERROR INVALID_VALUE
[  131.392898] nouveau E[  PGRAPH][0000:02:00.0]  DATA_ERROR
[  131.392918] nouveau E[  PGRAPH][0000:02:00.0] ch 2 [0x0007b45000 Xorg[2244]]
subc 2 class 0x502d mthd 0x08dc data 0x00144230


[  162.340013] nouveau E[Xorg[2244]] failed to idle channel 0xcccc0000
[Xorg[2244]]
[  177.340015] nouveau E[Xorg[2244]] failed to idle channel 0xcccc0000
[Xorg[2244]]
[  207.520133] nouveau E[     PFB][0000:02:00.0] trapped read at 0x0020012020
on channel 0x0000797f [unknown] SEMAPHORE_BG/PFIFO_READ/00 reason:
PAGE_NOT_PRESENT</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1386370302.CeE2aBb1.10444--

--===============1615593954==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1615593954==--
