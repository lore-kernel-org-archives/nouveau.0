From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68572] New: shutdown threshold temperature sometimes
 isn't restored properly after hibernate
Date: Mon, 26 Aug 2013 12:53:42 +0000
Message-ID: <bug-68572-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0188370050=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============0188370050==
Content-Type: multipart/alternative; boundary="1377521622.0cc31D01.11863"; charset="us-ascii"


--1377521622.0cc31D01.11863
Date: Mon, 26 Aug 2013 12:53:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=68572

          Priority: medium
            Bug ID: 68572
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: shutdown threshold temperature sometimes isn't
                    restored properly after hibernate
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: mr.dash.four-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

This is what I had about an hour or so ago after restore from hibernate:

Aug 26 13:04:36 test1 kernel: nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch
1 [Xorg[1928]] get 0x00021cfc put 0x0001dcc8 state 0x8002b8c8 (err:
INVALID_CMD) push 0x00000000
Aug 26 13:04:36 test1 kernel: nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch
1 [Xorg[1928]] get 0x0002daa8 put 0x00042324 state 0x80000000 (err:
INVALID_CMD) push 0x5f000000
Aug 26 13:04:36 test1 kernel: nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch
1 [Xorg[1928]] get 0x0004232c put 0x00008800 state 0x80000000 (err:
INVALID_CMD) push 0xff010000
Aug 26 13:04:36 test1 kernel: nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch
1 [Xorg[1928]] get 0x00008810 put 0x0000dd88 state 0x80000000 (err:
INVALID_CMD) push 0xff010000
Aug 26 13:04:36 test1 kernel: nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch
1 [Xorg[1928]] get 0x0000dd88 put 0x0000a0cc state 0x00000000 (err: NONE) push
0x4d011000
Aug 26 13:04:36 test1 kernel: nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch
1 [Xorg[1928]] get 0x0000a0d0 put 0x00008800 state 0x80000000 (err:
INVALID_CMD) push 0xff010000
Aug 26 13:04:36 test1 kernel: nouveau  [  PTHERM][0000:01:00.0] temperature (0
C) hit the 'shutdown' threshold
Aug 26 13:04:36 test1 kernel: nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch
1 [Xorg[1928]] get 0x00008810 put 0x80002264 state 0x80000000 (err:
INVALID_CMD) push 0xff011000
Aug 26 13:04:36 test1 kernel: nouveau W[   PFIFO][0000:01:00.0] unknown intr
0x00010000, ch 3
Aug 26 13:04:36 test1 kernel: nouveau W[   PFIFO][0000:01:00.0] unknown intr
0x00010000, ch 9
[...]
Aug 26 13:04:42 test1 kernel: nouveau E[Xorg[1928]] failed to idle channel
0xcccc0000 [Xorg[1928]]
Aug 26 13:04:43 test1 acpid: exiting
Aug 26 13:04:45 test1 kernel: nouveau E[Xorg[1928]] failed to idle channel
0xcccc0000 [Xorg[1928]]
Aug 26 13:04:45 test1 kernel: nouveau W[   PFIFO][0000:01:00.0] unknown intr
0x00010000, ch 2
Aug 26 13:04:45 test1 kernel: nouveau W[   PFIFO][0000:01:00.0] unknown intr
0x00010000, ch 2
Aug 26 13:04:45 test1 kernel: nouveau W[   PFIFO][0000:01:00.0] unknown intr
0x00010000, ch 2
Aug 26 13:04:45 test1 kernel: nouveau W[   PFIFO][0000:01:00.0] unknown intr
0x00010000, ch 2
[...]
Aug 26 13:04:45 test1 kernel: nouveau E[   PFIFO][0000:01:00.0] still angry
after 101 spins, halt

As evident from the above logs, either the shutdown threshold temperature or my
current card temperature is 0C (or both) for some reason, which causes my video
card to freeze for a couple of seconds and then shut itself down.

My guess is that these values are not restored properly after hibernate. This
doesn't happen very often though - it is the first time I am seeing this after
about 20+ hibernate/restore cycles.

Also worth pointing out that I have the nouveau patches for bug #66177 applied
and I am in auto fan management mode, which has been working properly.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377521622.0cc31D01.11863
Date: Mon, 26 Aug 2013 12:53:42 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - shutdown threshold temperature sometimes isn't restored properly after hibernate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68572">68572</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>shutdown threshold temperature sometimes isn't restored properly after hibernate
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>mr.dash.four&#64;googlemail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>This is what I had about an hour or so ago after restore from hibernate:

Aug 26 13:04:36 test1 kernel: nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch
1 [Xorg[1928]] get 0x00021cfc put 0x0001dcc8 state 0x8002b8c8 (err:
INVALID_CMD) push 0x00000000
Aug 26 13:04:36 test1 kernel: nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch
1 [Xorg[1928]] get 0x0002daa8 put 0x00042324 state 0x80000000 (err:
INVALID_CMD) push 0x5f000000
Aug 26 13:04:36 test1 kernel: nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch
1 [Xorg[1928]] get 0x0004232c put 0x00008800 state 0x80000000 (err:
INVALID_CMD) push 0xff010000
Aug 26 13:04:36 test1 kernel: nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch
1 [Xorg[1928]] get 0x00008810 put 0x0000dd88 state 0x80000000 (err:
INVALID_CMD) push 0xff010000
Aug 26 13:04:36 test1 kernel: nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch
1 [Xorg[1928]] get 0x0000dd88 put 0x0000a0cc state 0x00000000 (err: NONE) push
0x4d011000
Aug 26 13:04:36 test1 kernel: nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch
1 [Xorg[1928]] get 0x0000a0d0 put 0x00008800 state 0x80000000 (err:
INVALID_CMD) push 0xff010000
Aug 26 13:04:36 test1 kernel: nouveau  [  PTHERM][0000:01:00.0] temperature (0
C) hit the 'shutdown' threshold
Aug 26 13:04:36 test1 kernel: nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch
1 [Xorg[1928]] get 0x00008810 put 0x80002264 state 0x80000000 (err:
INVALID_CMD) push 0xff011000
Aug 26 13:04:36 test1 kernel: nouveau W[   PFIFO][0000:01:00.0] unknown intr
0x00010000, ch 3
Aug 26 13:04:36 test1 kernel: nouveau W[   PFIFO][0000:01:00.0] unknown intr
0x00010000, ch 9
[...]
Aug 26 13:04:42 test1 kernel: nouveau E[Xorg[1928]] failed to idle channel
0xcccc0000 [Xorg[1928]]
Aug 26 13:04:43 test1 acpid: exiting
Aug 26 13:04:45 test1 kernel: nouveau E[Xorg[1928]] failed to idle channel
0xcccc0000 [Xorg[1928]]
Aug 26 13:04:45 test1 kernel: nouveau W[   PFIFO][0000:01:00.0] unknown intr
0x00010000, ch 2
Aug 26 13:04:45 test1 kernel: nouveau W[   PFIFO][0000:01:00.0] unknown intr
0x00010000, ch 2
Aug 26 13:04:45 test1 kernel: nouveau W[   PFIFO][0000:01:00.0] unknown intr
0x00010000, ch 2
Aug 26 13:04:45 test1 kernel: nouveau W[   PFIFO][0000:01:00.0] unknown intr
0x00010000, ch 2
[...]
Aug 26 13:04:45 test1 kernel: nouveau E[   PFIFO][0000:01:00.0] still angry
after 101 spins, halt

As evident from the above logs, either the shutdown threshold temperature or my
current card temperature is 0C (or both) for some reason, which causes my video
card to freeze for a couple of seconds and then shut itself down.

My guess is that these values are not restored properly after hibernate. This
doesn't happen very often though - it is the first time I am seeing this after
about 20+ hibernate/restore cycles.

Also worth pointing out that I have the nouveau patches for <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - pwm1 value not restored during hibernate/restore cycle in the event of manual fan management mode"
   href="show_bug.cgi?id=66177">bug #66177</a> applied
and I am in auto fan management mode, which has been working properly.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377521622.0cc31D01.11863--

--===============0188370050==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0188370050==--
