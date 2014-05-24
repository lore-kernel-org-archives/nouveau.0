From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76483] [NV50, bisected,
 RFC patch] xset dpms force {on, off} does not work over DP
Date: Sat, 24 May 2014 09:29:31 +0000
Message-ID: <bug-76483-8800-Pc0XKMKDns@http.bugs.freedesktop.org/>
References: <bug-76483-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1892467578=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-76483-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1892467578==
Content-Type: multipart/alternative; boundary="1400923771.CD213.12633"; charset="us-ascii"


--1400923771.CD213.12633
Date: Sat, 24 May 2014 09:29:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76483

--- Comment #4 from Randy Andy <gugelhuepf-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> ---
(In reply to comment #1)
> Ah yes, I've been aware of this issue for a while, it just hasn't made it to
> the top of the list yet.  I'll try and address it for the 3.15 cycle, and
> backport the fixes to earlier kernels if possible.

Thanks for your work, Ben.

A little feedback from my side.

I tried this yesterday with the 3.15.0-rc6 Kernel, but this misbehaviour
regarding the none working power management is still the same with my 
NVIDIA Corporation GT200GL [Quadro FX 4800] (rev a1) with NV50 Chipset(NVA0).

So it would be great to get this functionality asap ;-)

Regards, Andy.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1400923771.CD213.12633
Date: Sat, 24 May 2014 09:29:31 +0000
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
   title="NEW --- - [NV50, bisected, RFC patch] xset dpms force {on,off} does not work over DP"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76483#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV50, bisected, RFC patch] xset dpms force {on,off} does not work over DP"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76483">bug 76483</a>
              from <span class="vcard"><a class="email" href="mailto:gugelhuepf&#64;googlemail.com" title="Randy Andy &lt;gugelhuepf&#64;googlemail.com&gt;"> <span class="fn">Randy Andy</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=76483#c1">comment #1</a>)
<span class="quote">&gt; Ah yes, I've been aware of this issue for a while, it just hasn't made it to
&gt; the top of the list yet.  I'll try and address it for the 3.15 cycle, and
&gt; backport the fixes to earlier kernels if possible.</span >

Thanks for your work, Ben.

A little feedback from my side.

I tried this yesterday with the 3.15.0-rc6 Kernel, but this misbehaviour
regarding the none working power management is still the same with my 
NVIDIA Corporation GT200GL [Quadro FX 4800] (rev a1) with NV50 Chipset(NVA0).

So it would be great to get this functionality asap ;-)

Regards, Andy.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1400923771.CD213.12633--

--===============1892467578==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1892467578==--
