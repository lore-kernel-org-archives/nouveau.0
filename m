From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67382] [nouveau,
 nv50] linux 3.9.7-3.10.3: Xorg won't be available
Date: Thu, 01 Aug 2013 15:02:37 +0000
Message-ID: <bug-67382-8800-6Y5441KJoj@http.bugs.freedesktop.org/>
References: <bug-67382-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1768230939=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67382-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1768230939==
Content-Type: multipart/alternative; boundary="1375369356.fcF1281.15748"; charset="us-ascii"


--1375369356.fcF1281.15748
Date: Thu, 1 Aug 2013 15:02:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67382

--- Comment #20 from Anonymous Helper <anonymous-IjDkMZObD1hBDgjK7y7TUQ@public.gmane.org> ---
(In reply to comment #19)

Interim report

> According to your vbios
> > dvi-1 --> dvi-to-vga adaptor going to a vga monitor
> The above uses OR 2/1 for analogue/digital output
> 
> > dvi-2 --> normally not used. But working
> OR 1/1 respectively here
> 
> > tv-out --> never tested
> OR 0

Whatever that means :D


> Can you redo my request from comment 15, but with the monitor connected into
> the other dvi port

It was working. Xorg.log wrote, that DVI-I-1 is disconnected and DVI-I-2
connected.
The resulting dmesg varies at following lines from the first:
[   11.804787] nouveau  [   PDISP][0000:01:00.0] nv50_dac_mthd power(or 2,
data[0] 0x000001a4) 0x00000000
[   11.806777] nouveau  [   PDISP][0000:01:00.0] nv50_dac_mthd power(or 2,
data[0] 0x000001a4) 0x00000000
[   11.837181] nouveau  [   PDISP][0000:01:00.0] nv50_dac_mthd power(or 2,
data[0] 0x000001a4) 0x00000000
[   11.839164] nouveau  [   PDISP][0000:01:00.0] nv50_dac_mthd power(or 2,
data[0] 0x000001a4) 0x00000000


> Just for the jokes can you try booting a failing kernel with
> nouveau.tv_disable=1 appended to your command line.

No positive result from that either. It was still failing

> If the above fails would be great if you can grab and compile a couple of
> kernels
> * git checkout 7ebb38b556485449bfaa506a196439f6a6fd6ebd~1
> 
> and
> * git checkout 7ebb38b556485449bfaa506a196439f6a6fd6ebd~2
> 
> Obviously let me know how they fare and attach the output of dmesg for both

Will do, but it will take it's time. The kernel repo is not a small one :)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1375369356.fcF1281.15748
Date: Thu, 1 Aug 2013 15:02:36 +0000
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
   title="NEW --- - [nouveau, nv50] linux 3.9.7-3.10.3: Xorg won't be available"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67382#c20">Comment # 20</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nouveau, nv50] linux 3.9.7-3.10.3: Xorg won't be available"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67382">bug 67382</a>
              from <span class="vcard"><a class="email" href="mailto:anonymous&#64;dodgeit.com" title="Anonymous Helper &lt;anonymous&#64;dodgeit.com&gt;"> <span class="fn">Anonymous Helper</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=67382#c19">comment #19</a>)

Interim report

<span class="quote">&gt; According to your vbios
&gt; &gt; dvi-1 --&gt; dvi-to-vga adaptor going to a vga monitor
&gt; The above uses OR 2/1 for analogue/digital output
&gt; 
&gt; &gt; dvi-2 --&gt; normally not used. But working
&gt; OR 1/1 respectively here
&gt; 
&gt; &gt; tv-out --&gt; never tested
&gt; OR 0</span >

Whatever that means :D


<span class="quote">&gt; Can you redo my request from <a href="show_bug.cgi?id=67382#c15">comment 15</a>, but with the monitor connected into
&gt; the other dvi port</span >

It was working. Xorg.log wrote, that DVI-I-1 is disconnected and DVI-I-2
connected.
The resulting dmesg varies at following lines from the first:
[   11.804787] nouveau  [   PDISP][0000:01:00.0] nv50_dac_mthd power(or 2,
data[0] 0x000001a4) 0x00000000
[   11.806777] nouveau  [   PDISP][0000:01:00.0] nv50_dac_mthd power(or 2,
data[0] 0x000001a4) 0x00000000
[   11.837181] nouveau  [   PDISP][0000:01:00.0] nv50_dac_mthd power(or 2,
data[0] 0x000001a4) 0x00000000
[   11.839164] nouveau  [   PDISP][0000:01:00.0] nv50_dac_mthd power(or 2,
data[0] 0x000001a4) 0x00000000


<span class="quote">&gt; Just for the jokes can you try booting a failing kernel with
&gt; nouveau.tv_disable=1 appended to your command line.</span >

No positive result from that either. It was still failing

<span class="quote">&gt; If the above fails would be great if you can grab and compile a couple of
&gt; kernels
&gt; * git checkout 7ebb38b556485449bfaa506a196439f6a6fd6ebd~1
&gt; 
&gt; and
&gt; * git checkout 7ebb38b556485449bfaa506a196439f6a6fd6ebd~2
&gt; 
&gt; Obviously let me know how they fare and attach the output of dmesg for both</span >

Will do, but it will take it's time. The kernel repo is not a small one :)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1375369356.fcF1281.15748--

--===============1768230939==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1768230939==--
