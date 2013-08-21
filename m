From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61069] [NV17] Crash while displaying large image
Date: Wed, 21 Aug 2013 06:52:14 +0000
Message-ID: <bug-61069-8800-SlxGw7aRC9@http.bugs.freedesktop.org/>
References: <bug-61069-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1256691435=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-61069-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1256691435==
Content-Type: multipart/alternative; boundary="1377067934.1a7Eda2.31066"; charset="us-ascii"


--1377067934.1a7Eda2.31066
Date: Wed, 21 Aug 2013 06:52:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61069

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
I doubt there's anything in 3.11 to fix this, but the fact is that I'm
currently running on top of the nouveau/linux-2.6 tree
(http://cgit.freedesktop.org/nouveau/linux-2.6/), which is 3.11-rc6 + some more
commits. I have a couple of patches applied on top of that, but I don't think
any of them would matter for this case.

What other differences are there? I'm using 1920x1200, you're on 1600x1200. I
did get the "pan" thing from imagemagick's display command. I assume you would
get that too (if it didn't crash)? Do you use a compositor of some sort? I
don't. My NV18 has 64M VRAM, reports a 128M GART... how much does your card
have?

Can you get debug libraries in place so that you get symbol resolution on
nouveau_drv.so in the stacktrace printed by X?

BTW, if you don't want to constantly kill your "regular" X session, you can
start up a second X session to do your testing in. (Might seem obvious, but it
took me a little while before I thought of that.)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377067934.1a7Eda2.31066
Date: Wed, 21 Aug 2013 06:52:14 +0000
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
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [NV17] Crash while displaying large image"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61069#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [NV17] Crash while displaying large image"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61069">bug 61069</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>I doubt there's anything in 3.11 to fix this, but the fact is that I'm
currently running on top of the nouveau/linux-2.6 tree
(<a href="http://cgit.freedesktop.org/nouveau/linux-2.6/">http://cgit.freedesktop.org/nouveau/linux-2.6/</a>), which is 3.11-rc6 + some more
commits. I have a couple of patches applied on top of that, but I don't think
any of them would matter for this case.

What other differences are there? I'm using 1920x1200, you're on 1600x1200. I
did get the &quot;pan&quot; thing from imagemagick's display command. I assume you would
get that too (if it didn't crash)? Do you use a compositor of some sort? I
don't. My NV18 has 64M VRAM, reports a 128M GART... how much does your card
have?

Can you get debug libraries in place so that you get symbol resolution on
nouveau_drv.so in the stacktrace printed by X?

BTW, if you don't want to constantly kill your &quot;regular&quot; X session, you can
start up a second X session to do your testing in. (Might seem obvious, but it
took me a little while before I thought of that.)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377067934.1a7Eda2.31066--

--===============1256691435==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1256691435==--
