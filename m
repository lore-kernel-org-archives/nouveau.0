From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 60772] xf86-video-nouveau fails to modprobe nouveau:
 KMS not enabled
Date: Wed, 21 Aug 2013 12:12:26 +0000
Message-ID: <bug-60772-8800-QuKLolPusU@http.bugs.freedesktop.org/>
References: <bug-60772-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0663766232=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-60772-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0663766232==
Content-Type: multipart/alternative; boundary="1377087146.eFeAD1.12994"; charset="us-ascii"


--1377087146.eFeAD1.12994
Date: Wed, 21 Aug 2013 12:12:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=60772

--- Comment #13 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
To put this in another light

(In reply to comment #11)
> Mirkin: You might've overlooked it, but there IS patch in the message you
> posted reference to. I don't see what other patch might be needed.
> 
No-one is saying there is a need for (other) patch(es)

> Also, the behaviour I'm seeking is behaviour previous versions (like
> xf86-video-nouveau-0.0.16) had. Versions which already supported KMS.
> 
Yes we made a mistake and forgot to do this when we dropped UMS. Sorry for
that, we are not perfect :\

> I fail to see why you think it's necessary to change behaviour of
> xf86-video-nouveau to support less workflows just to force the workflow you
> prefer. All replies against this patch I saw was on ideological ground, none
> presented any real reason why it's better this way.
> 
Afaics thing will work fine if you use udev/eudev/mdev over linux-hotplug. In
the latter of which I cannot see any progress (or changes) over the last few
years.

Whereas for the ideological ground - I think that the maintainer of the kernel
drm subsystem(Dave) would know better. Yes a bit more information would not
hurt, but considering the other drivers are doing this I do not see it as a
wrong thing/bikeshedding.

Btw, I believe he already mentioned that it's racy :)

> But ok. If I'm only one needing this workflow, I can accept the need to
> patch xf86-video-nouveau myself. Still better than reworking whole setup to
> workaround your decision.
> 
Whichever works for you :)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377087146.eFeAD1.12994
Date: Wed, 21 Aug 2013 12:12:26 +0000
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
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED WONTFIX - xf86-video-nouveau fails to modprobe nouveau: KMS not enabled"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60772#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED WONTFIX - xf86-video-nouveau fails to modprobe nouveau: KMS not enabled"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60772">bug 60772</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>To put this in another light

(In reply to <a href="show_bug.cgi?id=60772#c11">comment #11</a>)
<span class="quote">&gt; Mirkin: You might've overlooked it, but there IS patch in the message you
&gt; posted reference to. I don't see what other patch might be needed.
&gt; </span >
No-one is saying there is a need for (other) patch(es)

<span class="quote">&gt; Also, the behaviour I'm seeking is behaviour previous versions (like
&gt; xf86-video-nouveau-0.0.16) had. Versions which already supported KMS.
&gt; </span >
Yes we made a mistake and forgot to do this when we dropped UMS. Sorry for
that, we are not perfect :\

<span class="quote">&gt; I fail to see why you think it's necessary to change behaviour of
&gt; xf86-video-nouveau to support less workflows just to force the workflow you
&gt; prefer. All replies against this patch I saw was on ideological ground, none
&gt; presented any real reason why it's better this way.
&gt; </span >
Afaics thing will work fine if you use udev/eudev/mdev over linux-hotplug. In
the latter of which I cannot see any progress (or changes) over the last few
years.

Whereas for the ideological ground - I think that the maintainer of the kernel
drm subsystem(Dave) would know better. Yes a bit more information would not
hurt, but considering the other drivers are doing this I do not see it as a
wrong thing/bikeshedding.

Btw, I believe he already mentioned that it's racy :)

<span class="quote">&gt; But ok. If I'm only one needing this workflow, I can accept the need to
&gt; patch xf86-video-nouveau myself. Still better than reworking whole setup to
&gt; workaround your decision.
&gt; </span >
Whichever works for you :)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377087146.eFeAD1.12994--

--===============0663766232==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0663766232==--
