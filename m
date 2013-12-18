From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58378] [NV86] Distorted graphics on NVIDIA GeForce
 8400M G after upgrade the kernel to 3.7.0 version
Date: Wed, 18 Dec 2013 19:27:47 +0000
Message-ID: <bug-58378-8800-EwqXTVtHnz@http.bugs.freedesktop.org/>
References: <bug-58378-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1048077775=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58378-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1048077775==
Content-Type: multipart/alternative; boundary="1387394867.25ACb6.20938"; charset="us-ascii"


--1387394867.25ACb6.20938
Date: Wed, 18 Dec 2013 19:27:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58378

--- Comment #57 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #55)
> > > [aloew@aloew-lap envytools-master]$ ./nva/nvapoke 10200c 10
> > > WARN: Can't probe 0000:01:00.0
> > > PCI init failure!
> 
> > You need to run these as root.
> 
> Ouch - sorry - could have indeed had this idea myself... :-(
> 
> Here are the results as root:
> 
> [aloew@aloew-lap envytools-master]$ sudo ./nva/nvapeek 10200c 10
> 0010200c: SS SS SS SS SS SS SS SS SS SS SS SS SS SS SS SS

nvapeek 10200c without the 10. (Not sure what that does.... maybe reads out
0x10 regs)

> [aloew@aloew-lap envytools-master]$ sudo ./nva/nvapoke 10200c 10
> 0010200c: ERR S

Oh well. Some sort of error.

> [aloew@aloew-lap envytools-master]$ sudo ./nva/nvapeek 10200c 10
> 0010200c: SS SS SS SS SS SS SS SS SS SS SS SS SS SS SS SS
> [aloew@aloew-lap envytools-master]$ 
> 
> And no new messages in "dmesg" output at all. Still not enlightening... :-(

Well, no one's heard of a "missing" PCRYPT before, but it's certainly
conceivable that certain blocks were omitted. I'd feel better with that
diagnosis if more people chimed in saying that they had the same issue.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1387394867.25ACb6.20938
Date: Wed, 18 Dec 2013 19:27:47 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378#c57">Comment # 57</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378">bug 58378</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=58378#c55">comment #55</a>)
<span class="quote">&gt; &gt; &gt; [aloew&#64;aloew-lap envytools-master]$ ./nva/nvapoke 10200c 10
&gt; &gt; &gt; WARN: Can't probe 0000:01:00.0
&gt; &gt; &gt; PCI init failure!
&gt; 
&gt; &gt; You need to run these as root.
&gt; 
&gt; Ouch - sorry - could have indeed had this idea myself... :-(
&gt; 
&gt; Here are the results as root:
&gt; 
&gt; [aloew&#64;aloew-lap envytools-master]$ sudo ./nva/nvapeek 10200c 10
&gt; 0010200c: SS SS SS SS SS SS SS SS SS SS SS SS SS SS SS SS</span >

nvapeek 10200c without the 10. (Not sure what that does.... maybe reads out
0x10 regs)

<span class="quote">&gt; [aloew&#64;aloew-lap envytools-master]$ sudo ./nva/nvapoke 10200c 10
&gt; 0010200c: ERR S</span >

Oh well. Some sort of error.

<span class="quote">&gt; [aloew&#64;aloew-lap envytools-master]$ sudo ./nva/nvapeek 10200c 10
&gt; 0010200c: SS SS SS SS SS SS SS SS SS SS SS SS SS SS SS SS
&gt; [aloew&#64;aloew-lap envytools-master]$ 
&gt; 
&gt; And no new messages in &quot;dmesg&quot; output at all. Still not enlightening... :-(</span >

Well, no one's heard of a &quot;missing&quot; PCRYPT before, but it's certainly
conceivable that certain blocks were omitted. I'd feel better with that
diagnosis if more people chimed in saying that they had the same issue.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1387394867.25ACb6.20938--

--===============1048077775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1048077775==--
