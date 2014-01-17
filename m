From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 60680] [NV96] HDMI is connected and has mode,
 TV says "no signal"
Date: Fri, 17 Jan 2014 06:54:25 +0000
Message-ID: <bug-60680-8800-i5Uj4e5D01@http.bugs.freedesktop.org/>
References: <bug-60680-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0162977553=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-60680-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0162977553==
Content-Type: multipart/alternative; boundary="1389941665.7eDB6d3.14150"; charset="us-ascii"


--1389941665.7eDB6d3.14150
Date: Fri, 17 Jan 2014 06:54:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=60680

--- Comment #19 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
... and if that doesn't work, try making it a rd32 & 0xff instead of a rd08.
[would also need more logic to handle non-aligned-to-4 reads, but you don't
have those]

Looking at the full mmiotrace (rather than just PDISPLAY as my earlier diff was
doing), there are sections like

[0] 35.111642 MMIO32 R 0x619494 0x000900e8 PDISPLAY.VGA.CR+0x94 => 0x900e8
[0] 35.111688 MMIO32 W 0x619494 0x000900e0 PDISPLAY.VGA.CR+0x94 <= 0x900e0
... ~30 more identical lines ...

and then in the good trace:
[0] 35.113651 MMIO32 R 0x619494 0x000900e0 PDISPLAY.VGA.CR+0x94 => 0x900e0

but in the bad trace:
[0] 39.098615 MMIO8 W 0x6013d4 0x00000094 PRMIO.CRX <= 0x94
[0] 39.098655 CRTC0 R     0x94       0x00 0x94 => 0

And that is the value used by the condition 0x05. So it seems really likely
that this will help. I hope.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389941665.7eDB6d3.14150
Date: Fri, 17 Jan 2014 06:54:25 +0000
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
   title="NEW --- - [NV96] HDMI is connected and has mode, TV says &quot;no signal&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60680#c19">Comment # 19</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV96] HDMI is connected and has mode, TV says &quot;no signal&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60680">bug 60680</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>... and if that doesn't work, try making it a rd32 &amp; 0xff instead of a rd08.
[would also need more logic to handle non-aligned-to-4 reads, but you don't
have those]

Looking at the full mmiotrace (rather than just PDISPLAY as my earlier diff was
doing), there are sections like

[0] 35.111642 MMIO32 R 0x619494 0x000900e8 PDISPLAY.VGA.CR+0x94 =&gt; 0x900e8
[0] 35.111688 MMIO32 W 0x619494 0x000900e0 PDISPLAY.VGA.CR+0x94 &lt;= 0x900e0
... ~30 more identical lines ...

and then in the good trace:
[0] 35.113651 MMIO32 R 0x619494 0x000900e0 PDISPLAY.VGA.CR+0x94 =&gt; 0x900e0

but in the bad trace:
[0] 39.098615 MMIO8 W 0x6013d4 0x00000094 PRMIO.CRX &lt;= 0x94
[0] 39.098655 CRTC0 R     0x94       0x00 0x94 =&gt; 0

And that is the value used by the condition 0x05. So it seems really likely
that this will help. I hope.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389941665.7eDB6d3.14150--

--===============0162977553==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0162977553==--
