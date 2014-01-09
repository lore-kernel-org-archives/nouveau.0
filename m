From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58378] [NV86] Distorted graphics on NVIDIA GeForce
 8400M G after upgrade the kernel to 3.7.0 version
Date: Thu, 09 Jan 2014 11:23:09 +0000
Message-ID: <bug-58378-8800-iDbacD8Y40@http.bugs.freedesktop.org/>
References: <bug-58378-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0709276925=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58378-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0709276925==
Content-Type: multipart/alternative; boundary="1389266589.AF4F88ED5.5223"; charset="us-ascii"


--1389266589.AF4F88ED5.5223
Date: Thu, 9 Jan 2014 11:23:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58378

--- Comment #69 from Andreas Loew <awl1-hi6Y0CQ0nG0@public.gmane.org> ---
> Could you provide the output of
> 
> nvapeek 154c
> nvapeek 1540
> 
> Those registers specify which engines are there. I think we're ignoring them
> in nouveau...

OK - that might indeed explain the issues seen...
Here you are:

[aloew@aloew-lap nva]$ sudo ./nvapeek 154c
0000154c: 0000009c

[aloew@aloew-lap nva]$ sudo ./nvapeek 1540
00001540: b1010001

Looking at the patch you provided, if the rusty binary arithmetics chip in my
brain is still valid, this means for my case:

vdec = nv_rd32(device, 0x1540) & 0x40000000;

0xb(...) = 1011(...)
0x4(...) = 0100(...)

=> for me, vdec indeed is 0x00000000, i.e. false

and as my chipset is 0x86, furthermore:

MPEG -> disabled
VP -> disabled

and for the dynamic features,

0x9c = 10011100 binary

0x20 = 00100000 binary
0x40 = 01000000 binary

as 0x9c & 0x20 == 0x00, BSP -> disabled
as 0x9c & 0x40 == 0x00, PCRYPT -> disabled

which would probably confirm your that for me your patch is correct.

That said, I will apply this patch to my current stock RHEL6 kernel and report
back later today on whether this works fine for me (which it indeed should,
based on the above considerations!).

Thanks a million - great work! :-)

Best regards,
Andreas

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389266589.AF4F88ED5.5223
Date: Thu, 9 Jan 2014 11:23:09 +0000
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
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378#c69">Comment # 69</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378">bug 58378</a>
              from <span class="vcard"><a class="email" href="mailto:awl1&#64;gmx.net" title="Andreas Loew &lt;awl1&#64;gmx.net&gt;"> <span class="fn">Andreas Loew</span></a>
</span></b>
        <pre><span class="quote">&gt; Could you provide the output of
&gt; 
&gt; nvapeek 154c
&gt; nvapeek 1540
&gt; 
&gt; Those registers specify which engines are there. I think we're ignoring them
&gt; in nouveau...</span >

OK - that might indeed explain the issues seen...
Here you are:

[aloew&#64;aloew-lap nva]$ sudo ./nvapeek 154c
0000154c: 0000009c

[aloew&#64;aloew-lap nva]$ sudo ./nvapeek 1540
00001540: b1010001

Looking at the patch you provided, if the rusty binary arithmetics chip in my
brain is still valid, this means for my case:

vdec = nv_rd32(device, 0x1540) &amp; 0x40000000;

0xb(...) = 1011(...)
0x4(...) = 0100(...)

=&gt; for me, vdec indeed is 0x00000000, i.e. false

and as my chipset is 0x86, furthermore:

MPEG -&gt; disabled
VP -&gt; disabled

and for the dynamic features,

0x9c = 10011100 binary

0x20 = 00100000 binary
0x40 = 01000000 binary

as 0x9c &amp; 0x20 == 0x00, BSP -&gt; disabled
as 0x9c &amp; 0x40 == 0x00, PCRYPT -&gt; disabled

which would probably confirm your that for me your patch is correct.

That said, I will apply this patch to my current stock RHEL6 kernel and report
back later today on whether this works fine for me (which it indeed should,
based on the above considerations!).

Thanks a million - great work! :-)

Best regards,
Andreas</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389266589.AF4F88ED5.5223--

--===============0709276925==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0709276925==--
