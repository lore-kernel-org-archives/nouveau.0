From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70390] [NV84] Repeated system crashes under graphics
 load, E[PFIFO] DMA_PUSHER and lots of E[PGRAPH]
Date: Sun, 09 Mar 2014 23:04:33 +0000
Message-ID: <bug-70390-8800-r231DmgFli@http.bugs.freedesktop.org/>
References: <bug-70390-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1129059032=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70390-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1129059032==
Content-Type: multipart/alternative; boundary="1394406273.BdFfB5E3.17275"; charset="us-ascii"


--1394406273.BdFfB5E3.17275
Date: Sun, 9 Mar 2014 23:04:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70390

--- Comment #18 from Martin von Gagern <Martin.vGagern-hi6Y0CQ0nG0@public.gmane.org> ---
Had some third party module incompatibilities with 3.13, but after finding
suitable patches, I now upgraded to 3.13.6 and things look well so far. Which
is to say, flightgear started several times without a single crash so far.
Still see some lines about nouveau in dmesg, but haven't detected any adverse
consequences so far. Nevertheless, here are the lines in question:

[25251.856093] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 2 [X[2974]]
get 0x00200111e4 put 0x0020011204 ib_get 0x000002e8 ib_put 0x0000035d state
0x80004861 (err: INVALID_CMD) push 0x00406040
[28962.591861] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 2 [X[2974]]
get 0x0020027e98 put 0x0020028470 ib_get 0x00000185 ib_put 0x000001ab state
0xc000ef05 (err: MEM_FAULT) push 0x00406040
[28962.592096] nouveau E[     PFB][0000:01:00.0] trapped read at 0xfffffffffc
on channel 0x0000fcb0 [unknown] PFIFO/PFIFO_READ/PUSHBUF reason: PT_NOT_PRESENT

So the first line, the INVALID_CMD, is still there occasionally. At least once
in my current session.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1394406273.BdFfB5E3.17275
Date: Sun, 9 Mar 2014 23:04:33 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70390#c18">Comment # 18</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV84] Repeated system crashes under graphics load, E[PFIFO] DMA_PUSHER and lots of E[PGRAPH]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70390">bug 70390</a>
              from <span class="vcard"><a class="email" href="mailto:Martin.vGagern&#64;gmx.net" title="Martin von Gagern &lt;Martin.vGagern&#64;gmx.net&gt;"> <span class="fn">Martin von Gagern</span></a>
</span></b>
        <pre>Had some third party module incompatibilities with 3.13, but after finding
suitable patches, I now upgraded to 3.13.6 and things look well so far. Which
is to say, flightgear started several times without a single crash so far.
Still see some lines about nouveau in dmesg, but haven't detected any adverse
consequences so far. Nevertheless, here are the lines in question:

[25251.856093] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 2 [X[2974]]
get 0x00200111e4 put 0x0020011204 ib_get 0x000002e8 ib_put 0x0000035d state
0x80004861 (err: INVALID_CMD) push 0x00406040
[28962.591861] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 2 [X[2974]]
get 0x0020027e98 put 0x0020028470 ib_get 0x00000185 ib_put 0x000001ab state
0xc000ef05 (err: MEM_FAULT) push 0x00406040
[28962.592096] nouveau E[     PFB][0000:01:00.0] trapped read at 0xfffffffffc
on channel 0x0000fcb0 [unknown] PFIFO/PFIFO_READ/PUSHBUF reason: PT_NOT_PRESENT

So the first line, the INVALID_CMD, is still there occasionally. At least once
in my current session.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1394406273.BdFfB5E3.17275--

--===============1129059032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1129059032==--
