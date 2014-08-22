From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82247] [NVA8] The DisplayPort screen does not light
 up at first try on Linux 3.16
Date: Fri, 22 Aug 2014 15:04:35 +0000
Message-ID: <bug-82247-8800-KmLp47djSG@http.bugs.freedesktop.org/>
References: <bug-82247-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1897704165=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-82247-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1897704165==
Content-Type: multipart/alternative; boundary="1408719874.Bd3b62.11231"; charset="us-ascii"


--1408719874.Bd3b62.11231
Date: Fri, 22 Aug 2014 15:04:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82247

--- Comment #5 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Bad case:

[  +0,000009] nouveau D[     I2C][0000:01:00.0] PAD:S:01: -> PORT:0b
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 9: 0x00000000 16
[  +0,000563] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 00 0x0110900f
0x10000010
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x01010101
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x01010101
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x01010101
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x01010101
[  +0,000003] nouveau D[   PDISP][0000:01:00.0] 02:0006:0344: aux power ->
always
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 9: 0x00000100 2
[  +0,000144] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 00 0x01109001
0x10000002
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x0101840a
[  +0,000003] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x01010101
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x01010101
[  +0,000012] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x01010101
[  +0,000003] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 9: 0x00000202 3
[  +0,000154] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 00 0x01109002
0x10000003
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x01800000
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x01010101
[  +0,000003] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x01010101
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x01010101


Good case:

[  +0,000009] nouveau D[     I2C][0000:01:00.0] PAD:S:01: -> PORT:0b
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 9: 0x00000000 16
[  +0,000258] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 00 0x0110900f
0x10000010
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x01840a11
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00010000
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00060202
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00000000
[  +0,000003] nouveau D[   PDISP][0000:01:00.0] 02:0006:0344: aux power ->
always
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 9: 0x00000100 2
[  +0,000144] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 00 0x01109001
0x10000002
[  +0,000003] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x0184840a
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00010000
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00060202
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00000000
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 9: 0x00000202 3
[  +0,000152] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 00 0x01109002
0x10000003
[  +0,000003] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x01800000
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00010000
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00060202
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00000000

Those 01010101's seem unhealthy...

And then later, the bad case has

[  +0,000002] nouveau D[   PDISP][0000:01:00.0] 02:0006:0344: 0 lanes at 0 KB/s
...
[  +0,000002] nouveau E[   PDISP][0000:01:00.0] 02:0006:0344: link training
failed

And then later when it tries to train again with 0 lanes one or two more times,
and the training actually succeeds but it says there's not enough bw. And then
the last time everything works. I think the number of lanes is being computed
based on some sort of stale value, I wonder if that's affecting things.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1408719874.Bd3b62.11231
Date: Fri, 22 Aug 2014 15:04:34 +0000
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
   title="NEW --- - [NVA8] The DisplayPort screen does not light up at first try on Linux 3.16"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82247#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA8] The DisplayPort screen does not light up at first try on Linux 3.16"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82247">bug 82247</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Bad case:

[  +0,000009] nouveau D[     I2C][0000:01:00.0] PAD:S:01: -&gt; PORT:0b
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 9: 0x00000000 16
[  +0,000563] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 00 0x0110900f
0x10000010
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x01010101
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x01010101
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x01010101
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x01010101
[  +0,000003] nouveau D[   PDISP][0000:01:00.0] 02:0006:0344: aux power -&gt;
always
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 9: 0x00000100 2
[  +0,000144] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 00 0x01109001
0x10000002
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x0101840a
[  +0,000003] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x01010101
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x01010101
[  +0,000012] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x01010101
[  +0,000003] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 9: 0x00000202 3
[  +0,000154] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 00 0x01109002
0x10000003
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x01800000
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x01010101
[  +0,000003] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x01010101
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x01010101


Good case:

[  +0,000009] nouveau D[     I2C][0000:01:00.0] PAD:S:01: -&gt; PORT:0b
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 9: 0x00000000 16
[  +0,000258] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 00 0x0110900f
0x10000010
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x01840a11
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00010000
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00060202
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00000000
[  +0,000003] nouveau D[   PDISP][0000:01:00.0] 02:0006:0344: aux power -&gt;
always
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 9: 0x00000100 2
[  +0,000144] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 00 0x01109001
0x10000002
[  +0,000003] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x0184840a
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00010000
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00060202
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00000000
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 9: 0x00000202 3
[  +0,000152] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 00 0x01109002
0x10000003
[  +0,000003] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x01800000
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00010000
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00060202
[  +0,000002] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00000000

Those 01010101's seem unhealthy...

And then later, the bad case has

[  +0,000002] nouveau D[   PDISP][0000:01:00.0] 02:0006:0344: 0 lanes at 0 KB/s
...
[  +0,000002] nouveau E[   PDISP][0000:01:00.0] 02:0006:0344: link training
failed

And then later when it tries to train again with 0 lanes one or two more times,
and the training actually succeeds but it says there's not enough bw. And then
the last time everything works. I think the number of lanes is being computed
based on some sort of stale value, I wonder if that's affecting things.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1408719874.Bd3b62.11231--

--===============1897704165==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1897704165==--
