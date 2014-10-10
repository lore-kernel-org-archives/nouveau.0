From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 84759] EXTREME and blocking drawing delay
 accumulation with certain websites and programs (e.g. rdesktop) since
 forever
Date: Fri, 10 Oct 2014 15:29:30 +0000
Message-ID: <bug-84759-8800-0lDgrEO9hn@http.bugs.freedesktop.org/>
References: <bug-84759-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1444381905=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-84759-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1444381905==
Content-Type: multipart/alternative; boundary="1412954970.53CD52.31795"; charset="UTF-8"


--1412954970.53CD52.31795
Date: Fri, 10 Oct 2014 15:29:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=84759

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
You must be hitting some case that we don't handle with EXA (or worse yet, some
case that EXA in general doesn't handle well, but that's less likely).

One quick thing to try is to use GLAMOR -- with xf86-video-nouveau 1.0.11 you
can set the AccelMode driver option to "glamor". [Note that I've seen a bunch
of X crashes when glamor is enabled, and it apparently locks you out of
creating core GL contexts somehow, so it's not a panacea.]

I can't tell your technical level, but if you're up for it, grab the
xf86-video-nouveau source, and in nouveau_local.h switch the #if 0 to #if 1
above NOUVEAU_FALLBACK. That will print a ton of stuff in your Xorg log about
which actions are falling back. Hopefully it will be easy to identify which
ones are hitting the rdesktop silliness.

Also... you appear to have an uncommon X setup. You're using ZaphodHeads, but
you're not using xinerama. Does that mean that everything is on separate X
screens? But I also see one of the cards being added as a "GPU" card. It's all
a little odd... Are you using reverse prime at all? That's probably also not
the fastest thing in the world.

By the way, I assume this all works fine when running rdesktop off the
intel-connected screen?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1412954970.53CD52.31795
Date: Fri, 10 Oct 2014 15:29:30 +0000
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
   title="NEW - EXTREME and blocking drawing delay accumulation with certain websites and programs (e.g. rdesktop) since forever"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=84759#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - EXTREME and blocking drawing delay accumulation with certain websites and programs (e.g. rdesktop) since forever"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=84759">bug 84759</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>You must be hitting some case that we don't handle with EXA (or worse yet, some
case that EXA in general doesn't handle well, but that's less likely).

One quick thing to try is to use GLAMOR -- with xf86-video-nouveau 1.0.11 you
can set the AccelMode driver option to &quot;glamor&quot;. [Note that I've seen a bunch
of X crashes when glamor is enabled, and it apparently locks you out of
creating core GL contexts somehow, so it's not a panacea.]

I can't tell your technical level, but if you're up for it, grab the
xf86-video-nouveau source, and in nouveau_local.h switch the #if 0 to #if 1
above NOUVEAU_FALLBACK. That will print a ton of stuff in your Xorg log about
which actions are falling back. Hopefully it will be easy to identify which
ones are hitting the rdesktop silliness.

Also... you appear to have an uncommon X setup. You're using ZaphodHeads, but
you're not using xinerama. Does that mean that everything is on separate X
screens? But I also see one of the cards being added as a &quot;GPU&quot; card. It's all
a little odd... Are you using reverse prime at all? That's probably also not
the fastest thing in the world.

By the way, I assume this all works fine when running rdesktop off the
intel-connected screen?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1412954970.53CD52.31795--

--===============1444381905==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1444381905==--
