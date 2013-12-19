From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58378] [NV86] Distorted graphics on NVIDIA GeForce
 8400M G after upgrade the kernel to 3.7.0 version
Date: Thu, 19 Dec 2013 15:20:02 +0000
Message-ID: <bug-58378-8800-X4Yi3BfAD0@http.bugs.freedesktop.org/>
References: <bug-58378-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1853278741=="
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


--===============1853278741==
Content-Type: multipart/alternative; boundary="1387466402.c6b2C35.12013"; charset="us-ascii"


--1387466402.c6b2C35.12013
Date: Thu, 19 Dec 2013 15:20:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58378

--- Comment #60 from Andreas Loew <awl1-hi6Y0CQ0nG0@public.gmane.org> ---
> There was a bug in nvapeek/poke (it was using the wrong address space by
> default), can you update your pull and try again? [That explains why you saw
> 'S' in the output.]

Of course - here you are:

The version I used is from the "Download ZIP" button in GitHub:
https://github.com/envytools/envytools/archive/master.zip

[aloew@aloew-lap nva]$ sudo ./nvapeek 10200c
...
[aloew@aloew-lap nva]$ sudo ./nvapoke 10200c 10
[aloew@aloew-lap nva]$ sudo ./nvapeek 10200c
...

Maybe now another bug, as we don't seem to get any hex address and/or value
output?

Please advise if we need to pass any additional parameters to get hex ouput...

BR,
Andreas

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1387466402.c6b2C35.12013
Date: Thu, 19 Dec 2013 15:20:02 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378#c60">Comment # 60</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378">bug 58378</a>
              from <span class="vcard"><a class="email" href="mailto:awl1&#64;gmx.net" title="Andreas Loew &lt;awl1&#64;gmx.net&gt;"> <span class="fn">Andreas Loew</span></a>
</span></b>
        <pre><span class="quote">&gt; There was a bug in nvapeek/poke (it was using the wrong address space by
&gt; default), can you update your pull and try again? [That explains why you saw
&gt; 'S' in the output.]</span >

Of course - here you are:

The version I used is from the &quot;Download ZIP&quot; button in GitHub:
<a href="https://github.com/envytools/envytools/archive/master.zip">https://github.com/envytools/envytools/archive/master.zip</a>

[aloew&#64;aloew-lap nva]$ sudo ./nvapeek 10200c
...
[aloew&#64;aloew-lap nva]$ sudo ./nvapoke 10200c 10
[aloew&#64;aloew-lap nva]$ sudo ./nvapeek 10200c
...

Maybe now another bug, as we don't seem to get any hex address and/or value
output?

Please advise if we need to pass any additional parameters to get hex ouput...

BR,
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

--1387466402.c6b2C35.12013--

--===============1853278741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1853278741==--
