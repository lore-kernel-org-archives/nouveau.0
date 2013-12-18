From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58378] [NV86] Distorted graphics on NVIDIA GeForce
 8400M G after upgrade the kernel to 3.7.0 version
Date: Wed, 18 Dec 2013 19:01:01 +0000
Message-ID: <bug-58378-8800-3fR5nZP9EX@http.bugs.freedesktop.org/>
References: <bug-58378-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1911139498=="
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


--===============1911139498==
Content-Type: multipart/alternative; boundary="1387393261.2fc533d6.15366"; charset="us-ascii"


--1387393261.2fc533d6.15366
Date: Wed, 18 Dec 2013 19:01:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58378

--- Comment #54 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #52)
> Hello again, Ilia,
> 
> > Can you grab envytools (https://github.com/envytools/envytools) and run
> 
> bad news (or maybe expected from what we have been seeing earlier): 
> 
> [aloew@aloew-lap envytools-master]$ ./nva/nvapeek 10200c
> WARN: Can't probe 0000:01:00.0
> PCI init failure!
> 
> [aloew@aloew-lap envytools-master]$ ./nva/nvapoke 10200c 10
> WARN: Can't probe 0000:01:00.0
> PCI init failure!

You need to run these as root.

> > I'd also still be interested in knowing whether a previously-known-good 
> > version of the blob still works.
> 
> I am 99.9% certain it does, as my Windows install with NVidia 285.09 driver
> also still runs fine, while any more recent Windows driver from NVidia hangs
> with the same symptoms as their Linux "blob" - I had just checked this last
> week with their latest Windows version 331.82, once again without any luck.

Ah OK, that's probably good enough of a test.

> Maybe indeed you could ask your new friends/contacts at NVidia about this?

I just bugged them about video decoding stuff a few weeks ago, don't want to
use up all of my brownie points :)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1387393261.2fc533d6.15366
Date: Wed, 18 Dec 2013 19:01:01 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378#c54">Comment # 54</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378">bug 58378</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=58378#c52">comment #52</a>)
<span class="quote">&gt; Hello again, Ilia,
&gt; 
&gt; &gt; Can you grab envytools (<a href="https://github.com/envytools/envytools">https://github.com/envytools/envytools</a>) and run
&gt; 
&gt; bad news (or maybe expected from what we have been seeing earlier): 
&gt; 
&gt; [aloew&#64;aloew-lap envytools-master]$ ./nva/nvapeek 10200c
&gt; WARN: Can't probe 0000:01:00.0
&gt; PCI init failure!
&gt; 
&gt; [aloew&#64;aloew-lap envytools-master]$ ./nva/nvapoke 10200c 10
&gt; WARN: Can't probe 0000:01:00.0
&gt; PCI init failure!</span >

You need to run these as root.

<span class="quote">&gt; &gt; I'd also still be interested in knowing whether a previously-known-good 
&gt; &gt; version of the blob still works.
&gt; 
&gt; I am 99.9% certain it does, as my Windows install with NVidia 285.09 driver
&gt; also still runs fine, while any more recent Windows driver from NVidia hangs
&gt; with the same symptoms as their Linux &quot;blob&quot; - I had just checked this last
&gt; week with their latest Windows version 331.82, once again without any luck.</span >

Ah OK, that's probably good enough of a test.

<span class="quote">&gt; Maybe indeed you could ask your new friends/contacts at NVidia about this?</span >

I just bugged them about video decoding stuff a few weeks ago, don't want to
use up all of my brownie points :)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1387393261.2fc533d6.15366--

--===============1911139498==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1911139498==--
