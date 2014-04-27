From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54700] Distorted graphics (double cursor) with
 GeForce 4200Go (NV28)
Date: Sun, 27 Apr 2014 17:12:50 +0000
Message-ID: <bug-54700-8800-v8nhgRlecJ@http.bugs.freedesktop.org/>
References: <bug-54700-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2108492225=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54700-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2108492225==
Content-Type: multipart/alternative; boundary="1398618770.C6b34.31717"; charset="us-ascii"


--1398618770.C6b34.31717
Date: Sun, 27 Apr 2014 17:12:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=54700

--- Comment #57 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #55)
> So something is initialized by the nvidia driver, which is not touched by
> nouveau but is required for correct operation.
> 
> Is there a way I could help? Like dumping register states with/without the
> nvidia init?

You could do a mmiotrace of the nvidia driver. It's likely that we're missing
some bit of init. The resulting file will probably be quite large (50-100MB)...
xz -9 it and email to mmio.dumps-Re5JQEeQqe9fmgfxC/sS/w@public.gmane.org (Also wouldn't hurt to upload your
vbios from /sys/kernel/debug/dri/0/vbios.rom to this bug, and also attach it in
the email while you're at it.)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1398618770.C6b34.31717
Date: Sun, 27 Apr 2014 17:12:50 +0000
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
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700#c57">Comment # 57</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700">bug 54700</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=54700#c55">comment #55</a>)
<span class="quote">&gt; So something is initialized by the nvidia driver, which is not touched by
&gt; nouveau but is required for correct operation.
&gt; 
&gt; Is there a way I could help? Like dumping register states with/without the
&gt; nvidia init?</span >

You could do a mmiotrace of the nvidia driver. It's likely that we're missing
some bit of init. The resulting file will probably be quite large (50-100MB)...
xz -9 it and email to <a href="mailto:mmio.dumps&#64;gmail.com">mmio.dumps&#64;gmail.com</a>. (Also wouldn't hurt to upload your
vbios from /sys/kernel/debug/dri/0/vbios.rom to this bug, and also attach it in
the email while you're at it.)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1398618770.C6b34.31717--

--===============2108492225==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2108492225==--
