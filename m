From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 60772] xf86-video-nouveau fails to modprobe nouveau:
 KMS not enabled
Date: Thu, 22 Aug 2013 09:06:43 +0000
Message-ID: <bug-60772-8800-ESZGcLb8fh@http.bugs.freedesktop.org/>
References: <bug-60772-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0531404538=="
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


--===============0531404538==
Content-Type: multipart/alternative; boundary="1377162403.F7BFbA1.18565"; charset="us-ascii"


--1377162403.F7BFbA1.18565
Date: Thu, 22 Aug 2013 09:06:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=60772

--- Comment #14 from Honza <hkmaly-jG/AHqQBv7lBDgjK7y7TUQ@public.gmane.org> ---
(In reply to comment #13)
> (In reply to comment #11)
> > Mirkin: You might've overlooked it, but there IS patch in the message you
> > posted reference to. I don't see what other patch might be needed.
> > 
> No-one is saying there is a need for (other) patch(es)
> 

"If you really want to change the behaviour, send a patch, ping people, etc."

> > I fail to see why you think it's necessary to change behaviour of
> > xf86-video-nouveau to support less workflows just to force the workflow you
> > prefer. All replies against this patch I saw was on ideological ground, none
> > presented any real reason why it's better this way.
> > 
> Afaics thing will work fine if you use udev/eudev/mdev over linux-hotplug.
> In the latter of which I cannot see any progress (or changes) over the last
> few years.
> 

I successfully ignored devfs. Fads like that come and go. No need to change
what's working. Current attempts of integrating pulseaudio and init doesn't
convince me udev is stable. Sure, sysvinit didn't have much change in last few
years ... because it's working. Systemd, on the other hand ...

> Whereas for the ideological ground - I think that the maintainer of the
> kernel drm subsystem(Dave) would know better. Yes a bit more information
> would not hurt, but considering the other drivers are doing this I do not
> see it as a wrong thing/bikeshedding.
> 
> Btw, I believe he already mentioned that it's racy :)
> 

He mentioned that there is race when you start the module and X server
immediately starts using it. If you start udev and immediately after it start
X, the race will still be there, wouldn't it? In fact, it will be even worse,
as udev doesn't exactly have predictable timing.

With distributions trying to make startup fast and parallel and often starting
display managers-based logins, I'm actually surprised it works.

If the code would be supposed to solve the race, it would contain cycle
sleeping until some ioctl returns the module finished initialization. Probably
with timeout around 30 seconds.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377162403.F7BFbA1.18565
Date: Thu, 22 Aug 2013 09:06:43 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60772#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED WONTFIX - xf86-video-nouveau fails to modprobe nouveau: KMS not enabled"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60772">bug 60772</a>
              from <span class="vcard"><a class="email" href="mailto:hkmaly&#64;bigfoot.com" title="Honza &lt;hkmaly&#64;bigfoot.com&gt;"> <span class="fn">Honza</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=60772#c13">comment #13</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=60772#c11">comment #11</a>)
&gt; &gt; Mirkin: You might've overlooked it, but there IS patch in the message you
&gt; &gt; posted reference to. I don't see what other patch might be needed.
&gt; &gt; 
&gt; No-one is saying there is a need for (other) patch(es)
&gt; </span >

&quot;If you really want to change the behaviour, send a patch, ping people, etc.&quot;

<span class="quote">&gt; &gt; I fail to see why you think it's necessary to change behaviour of
&gt; &gt; xf86-video-nouveau to support less workflows just to force the workflow you
&gt; &gt; prefer. All replies against this patch I saw was on ideological ground, none
&gt; &gt; presented any real reason why it's better this way.
&gt; &gt; 
&gt; Afaics thing will work fine if you use udev/eudev/mdev over linux-hotplug.
&gt; In the latter of which I cannot see any progress (or changes) over the last
&gt; few years.
&gt; </span >

I successfully ignored devfs. Fads like that come and go. No need to change
what's working. Current attempts of integrating pulseaudio and init doesn't
convince me udev is stable. Sure, sysvinit didn't have much change in last few
years ... because it's working. Systemd, on the other hand ...

<span class="quote">&gt; Whereas for the ideological ground - I think that the maintainer of the
&gt; kernel drm subsystem(Dave) would know better. Yes a bit more information
&gt; would not hurt, but considering the other drivers are doing this I do not
&gt; see it as a wrong thing/bikeshedding.
&gt; 
&gt; Btw, I believe he already mentioned that it's racy :)
&gt; </span >

He mentioned that there is race when you start the module and X server
immediately starts using it. If you start udev and immediately after it start
X, the race will still be there, wouldn't it? In fact, it will be even worse,
as udev doesn't exactly have predictable timing.

With distributions trying to make startup fast and parallel and often starting
display managers-based logins, I'm actually surprised it works.

If the code would be supposed to solve the race, it would contain cycle
sleeping until some ioctl returns the module finished initialization. Probably
with timeout around 30 seconds.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377162403.F7BFbA1.18565--

--===============0531404538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0531404538==--
