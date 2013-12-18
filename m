From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58378] [NV86] Distorted graphics on NVIDIA GeForce
 8400M G after upgrade the kernel to 3.7.0 version
Date: Wed, 18 Dec 2013 19:36:57 +0000
Message-ID: <bug-58378-8800-2630JX0OcX@http.bugs.freedesktop.org/>
References: <bug-58378-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1669954059=="
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


--===============1669954059==
Content-Type: multipart/alternative; boundary="1387395418.A1CE2C5.23350"; charset="us-ascii"


--1387395418.A1CE2C5.23350
Date: Wed, 18 Dec 2013 19:36:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58378

--- Comment #58 from Andreas Loew <awl1-hi6Y0CQ0nG0@public.gmane.org> ---
> > [aloew@aloew-lap envytools-master]$ sudo ./nva/nvapeek 10200c 10
> > 0010200c: SS SS SS SS SS SS SS SS SS SS SS SS SS SS SS SS
> 
> nvapeek 10200c without the 10. (Not sure what that does.... maybe reads out
> 0x10 regs)

yes - seems to read 10 registers:

[aloew@aloew-lap envytools-master]$ sudo ./nva/nvapeek 10200c   
0010200c: SS

> Well, no one's heard of a "missing" PCRYPT before, but it's certainly
> conceivable that certain blocks were omitted. I'd feel better with that
> diagnosis if more people chimed in saying that they had the same issue.

From the screenshots of the corrupted graphics, I definitely think that this is
the exact same issue.

But I fully agree that it is a pity that nobody of the folks who had raised
this previously and/or commented, do react now that it has probably been
tracked down to its root cause.

And something else seems interesting:

All other people who saw the corruption issue (except nemasu with his/her 8800
GTS, who might have seen a different issue indeed from the dmesg output) also
were using early G86 chips, particularly 8400M-based, and mostly the "mobile"
variants...

Maybe NVidia omitted part of the 8400 functionality in the mobile variants?
This would again make up a nice (and easy) question to them...!? ;-)

Thanks again & BR,
Andreas

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1387395418.A1CE2C5.23350
Date: Wed, 18 Dec 2013 19:36:58 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378#c58">Comment # 58</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378">bug 58378</a>
              from <span class="vcard"><a class="email" href="mailto:awl1&#64;gmx.net" title="Andreas Loew &lt;awl1&#64;gmx.net&gt;"> <span class="fn">Andreas Loew</span></a>
</span></b>
        <pre><span class="quote">&gt; &gt; [aloew&#64;aloew-lap envytools-master]$ sudo ./nva/nvapeek 10200c 10
&gt; &gt; 0010200c: SS SS SS SS SS SS SS SS SS SS SS SS SS SS SS SS
&gt; 
&gt; nvapeek 10200c without the 10. (Not sure what that does.... maybe reads out
&gt; 0x10 regs)</span >

yes - seems to read 10 registers:

[aloew&#64;aloew-lap envytools-master]$ sudo ./nva/nvapeek 10200c   
0010200c: SS

<span class="quote">&gt; Well, no one's heard of a &quot;missing&quot; PCRYPT before, but it's certainly
&gt; conceivable that certain blocks were omitted. I'd feel better with that
&gt; diagnosis if more people chimed in saying that they had the same issue.</span >

From the screenshots of the corrupted graphics, I definitely think that this is
the exact same issue.

But I fully agree that it is a pity that nobody of the folks who had raised
this previously and/or commented, do react now that it has probably been
tracked down to its root cause.

And something else seems interesting:

All other people who saw the corruption issue (except nemasu with his/her 8800
GTS, who might have seen a different issue indeed from the dmesg output) also
were using early G86 chips, particularly 8400M-based, and mostly the &quot;mobile&quot;
variants...

Maybe NVidia omitted part of the 8400 functionality in the mobile variants?
This would again make up a nice (and easy) question to them...!? ;-)

Thanks again &amp; BR,
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

--1387395418.A1CE2C5.23350--

--===============1669954059==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1669954059==--
