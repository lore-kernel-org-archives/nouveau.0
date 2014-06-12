From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76483] [NV50, bisected,
 RFC patch] xset dpms force {on, off} does not work over DP
Date: Thu, 12 Jun 2014 11:12:11 +0000
Message-ID: <bug-76483-8800-0DImMNgLHQ@http.bugs.freedesktop.org/>
References: <bug-76483-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0599832431=="
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


--===============0599832431==
Content-Type: multipart/alternative; boundary="1402571531.cCD2cd3.17241"; charset="us-ascii"


--1402571531.cCD2cd3.17241
Date: Thu, 12 Jun 2014 11:12:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76483

--- Comment #6 from Damien Diederen <dd-IPhqJjDoDR/z1n+OaKNE4w@public.gmane.org> ---
(In reply to comment #5)
> There is a substantial DP rework bound for 3.16. Can you give
> http://cgit.freedesktop.org/~airlied/linux/log/?h=drm-next a shot? It should
> add proper support for DPMS.

I will.  ASAP, but probably not today.

Thanks!  -D

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1402571531.cCD2cd3.17241
Date: Thu, 12 Jun 2014 11:12:11 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76483#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV50, bisected, RFC patch] xset dpms force {on,off} does not work over DP"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76483">bug 76483</a>
              from <span class="vcard"><a class="email" href="mailto:dd&#64;crosstwine.com" title="Damien Diederen &lt;dd&#64;crosstwine.com&gt;"> <span class="fn">Damien Diederen</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=76483#c5">comment #5</a>)
<span class="quote">&gt; There is a substantial DP rework bound for 3.16. Can you give
&gt; <a href="http://cgit.freedesktop.org/~airlied/linux/log/?h=drm-next">http://cgit.freedesktop.org/~airlied/linux/log/?h=drm-next</a> a shot? It should
&gt; add proper support for DPMS.</span >

I will.  ASAP, but probably not today.

Thanks!  -D</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1402571531.cCD2cd3.17241--

--===============0599832431==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0599832431==--
