From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76483] [NV50, bisected,
 RFC patch] xset dpms force {on, off} does not work over DP
Date: Sat, 09 Aug 2014 09:03:48 +0000
Message-ID: <bug-76483-8800-r8sXiZ9GmP@http.bugs.freedesktop.org/>
References: <bug-76483-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0300341234=="
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


--===============0300341234==
Content-Type: multipart/alternative; boundary="1407575028.BbeE3.2638"; charset="us-ascii"


--1407575028.BbeE3.2638
Date: Sat, 9 Aug 2014 09:03:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76483

--- Comment #32 from Damien Diederen <dd-IPhqJjDoDR/z1n+OaKNE4w@public.gmane.org> ---
Hi Ben, Karl,

I'm very happy Karl could help diagnose this.

(In reply to comment #30)
> Give this a try:
> http://cgit.freedesktop.org/~darktama/nouveau/commit/
> ?id=31080d6499d64e0578ef55f7473ed83b7bfd72af

A janitorial mishap gave me an opportunity to (finally!) update the
affected machine.  It is now running v3.16-rc6, which includes commit
7fac4933 (matching your patch above).

The remaining issues mentioned in comment #8 appear to be fixed in my
configuration, too.  Thanks!  I think this ticket can be closed.

Cheers, -D

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1407575028.BbeE3.2638
Date: Sat, 9 Aug 2014 09:03:48 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76483#c32">Comment # 32</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV50, bisected, RFC patch] xset dpms force {on,off} does not work over DP"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76483">bug 76483</a>
              from <span class="vcard"><a class="email" href="mailto:dd&#64;crosstwine.com" title="Damien Diederen &lt;dd&#64;crosstwine.com&gt;"> <span class="fn">Damien Diederen</span></a>
</span></b>
        <pre>Hi Ben, Karl,

I'm very happy Karl could help diagnose this.

(In reply to <a href="show_bug.cgi?id=76483#c30">comment #30</a>)
<span class="quote">&gt; Give this a try:
&gt; <a href="http://cgit.freedesktop.org/~darktama/nouveau/commit/">http://cgit.freedesktop.org/~darktama/nouveau/commit/</a>
&gt; ?id=31080d6499d64e0578ef55f7473ed83b7bfd72af</span >

A janitorial mishap gave me an opportunity to (finally!) update the
affected machine.  It is now running v3.16-rc6, which includes commit
7fac4933 (matching your patch above).

The remaining issues mentioned in <a href="show_bug.cgi?id=76483#c8">comment #8</a> appear to be fixed in my
configuration, too.  Thanks!  I think this ticket can be closed.

Cheers, -D</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1407575028.BbeE3.2638--

--===============0300341234==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0300341234==--
