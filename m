From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70875] [NVC1] NOUVEAU(0): [drm] failed to set drm
 interface version
Date: Thu, 28 Nov 2013 21:00:31 +0000
Message-ID: <bug-70875-8800-A8ihD8ojsR@http.bugs.freedesktop.org/>
References: <bug-70875-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2050032061=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70875-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2050032061==
Content-Type: multipart/alternative; boundary="1385672430.BcD34c281.10063"; charset="us-ascii"


--1385672430.BcD34c281.10063
Date: Thu, 28 Nov 2013 21:00:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70875

--- Comment #11 from Marcin Zajaczkowski <mszpak-5tc4TXWwyLM@public.gmane.org> ---
> But I think you can still use the xrandr offload stuff in that case, as shown
> on http://nouveau.freedesktop.org/wiki/Optimus/. In the end, what are you
> looking for from your nvidia card? If it's the occasional 3d game/whatever,
> you can use DRI_PRIME=1 for that, at which point it should turn on and then
> turn back off when you're done due to runtime pm. [Make sure that your
> kernel is configured with CONFIG_RUNTIME_PM.]

You are right. DRI_PRIME=1 works fine on my hardware. If CONFIG_RUNTIME_PM
would turn off my NVidia card when not used it would enough. I haven't found
RPMS for 3.13-rc1 for Fedora, so probably I would need to refresh my knowledge
about kernel building (I haven't been doing it for years :) ).

Thanks for your support.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1385672430.BcD34c281.10063
Date: Thu, 28 Nov 2013 21:00:30 +0000
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
   title="NEW --- - [NVC1] NOUVEAU(0): [drm] failed to set drm interface version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70875#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] NOUVEAU(0): [drm] failed to set drm interface version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70875">bug 70875</a>
              from <span class="vcard"><a class="email" href="mailto:mszpak&#64;wp.pl" title="Marcin Zajaczkowski &lt;mszpak&#64;wp.pl&gt;"> <span class="fn">Marcin Zajaczkowski</span></a>
</span></b>
        <pre><span class="quote">&gt; But I think you can still use the xrandr offload stuff in that case, as shown
&gt; on <a href="http://nouveau.freedesktop.org/wiki/Optimus/">http://nouveau.freedesktop.org/wiki/Optimus/</a>. In the end, what are you
&gt; looking for from your nvidia card? If it's the occasional 3d game/whatever,
&gt; you can use DRI_PRIME=1 for that, at which point it should turn on and then
&gt; turn back off when you're done due to runtime pm. [Make sure that your
&gt; kernel is configured with CONFIG_RUNTIME_PM.]</span >

You are right. DRI_PRIME=1 works fine on my hardware. If CONFIG_RUNTIME_PM
would turn off my NVidia card when not used it would enough. I haven't found
RPMS for 3.13-rc1 for Fedora, so probably I would need to refresh my knowledge
about kernel building (I haven't been doing it for years :) ).

Thanks for your support.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1385672430.BcD34c281.10063--

--===============2050032061==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2050032061==--
