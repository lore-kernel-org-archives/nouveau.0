From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74903] [NV34] TV Load not detected in X
Date: Wed, 12 Feb 2014 22:31:28 +0000
Message-ID: <bug-74903-8800-pp0cL8n8U5@http.bugs.freedesktop.org/>
References: <bug-74903-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1544079530=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-74903-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1544079530==
Content-Type: multipart/alternative; boundary="1392244288.CfaAA52.19263"; charset="us-ascii"


--1392244288.CfaAA52.19263
Date: Wed, 12 Feb 2014 22:31:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74903

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #3)
> I tried booting with param video=TV1:e as (poorly) documented way to force

I think you want TV-1:e.

> tv on. dmesg log and X log now plays nice as if the tv was indeed connected,
> however, I can't see anything past kms trigger.
> 
> Is there a way to truly override load detection? As I said, the other tv is
> just fine, the dmesg shows tv connected.

There's a nouveau.tv_disable which is listed as "Disable TV-out detection". I
kind of assume it just ignores the outputs entirely, but who knows. You may
want to peruse drivers/gpu/drm/nouveau/dispnv04/tvnv17.c:nv17_tv_detect

It has special exceptions for a couple of cards with quirks. There's a way to
return a "status unknown" -- try that?

But it's a little odd that it worked fine before -- what was the "before"
kernel?

FTR, S-video worked fine on my NV44 last I checked (~kernel 3.11 or so).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392244288.CfaAA52.19263
Date: Wed, 12 Feb 2014 22:31:28 +0000
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
   title="NEW --- - [NV34] TV Load not detected in X"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74903#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV34] TV Load not detected in X"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74903">bug 74903</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=74903#c3">comment #3</a>)
<span class="quote">&gt; I tried booting with param video=TV1:e as (poorly) documented way to force</span >

I think you want TV-1:e.

<span class="quote">&gt; tv on. dmesg log and X log now plays nice as if the tv was indeed connected,
&gt; however, I can't see anything past kms trigger.
&gt; 
&gt; Is there a way to truly override load detection? As I said, the other tv is
&gt; just fine, the dmesg shows tv connected.</span >

There's a nouveau.tv_disable which is listed as &quot;Disable TV-out detection&quot;. I
kind of assume it just ignores the outputs entirely, but who knows. You may
want to peruse drivers/gpu/drm/nouveau/dispnv04/tvnv17.c:nv17_tv_detect

It has special exceptions for a couple of cards with quirks. There's a way to
return a &quot;status unknown&quot; -- try that?

But it's a little odd that it worked fine before -- what was the &quot;before&quot;
kernel?

FTR, S-video worked fine on my NV44 last I checked (~kernel 3.11 or so).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392244288.CfaAA52.19263--

--===============1544079530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1544079530==--
