From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 60680] HDMI is connected and has mode,
	TV says "no signal"
Date: Wed, 13 Feb 2013 20:04:47 +0000
Message-ID: <bug-60680-8800-PaTBgDj6Ii@http.bugs.freedesktop.org/>
References: <bug-60680-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2020179824=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-60680-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2020179824==
Content-Type: multipart/alternative; boundary="1360785887.0eCe01.15961"; charset="us-ascii"


--1360785887.0eCe01.15961
Date: Wed, 13 Feb 2013 20:04:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=60680

--- Comment #5 from Pekka Paalanen <ppaalanen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #4)
> I'm not sure if it'll help, but there's an additional commit (fix missing
> sor modectrl sync flags) which might be related sitting in git.

I tried a new complete kernel with that patch, but unfortunately it doesn't
help.

Btw. the attached kernel log has this line:
[   10.194866] farn kernel: nouveau E[    PBUS][0000:01:00.0] MMIO write of
0x00000000 FAULT at 0x400724
and a few times I have been left with no outputs at all, when changing modes on
the 3.8-rc kernel, but that is a different story.


Now I know this is a regression: in 3.5.2-gentoo kernel Nouveau can drive the
HDMI output fine.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1360785887.0eCe01.15961
Date: Wed, 13 Feb 2013 20:04:47 +0000
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
   title="NEW --- - HDMI is connected and has mode, TV says &quot;no signal&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60680#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - HDMI is connected and has mode, TV says &quot;no signal&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60680">bug 60680</a>
              from <span class="vcard"><a class="email" href="mailto:ppaalanen&#64;gmail.com" title="Pekka Paalanen &lt;ppaalanen&#64;gmail.com&gt;"> <span class="fn">Pekka Paalanen</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=60680#c4">comment #4</a>)
<span class="quote">&gt; I'm not sure if it'll help, but there's an additional commit (fix missing
&gt; sor modectrl sync flags) which might be related sitting in git.</span >

I tried a new complete kernel with that patch, but unfortunately it doesn't
help.

Btw. the attached kernel log has this line:
[   10.194866] farn kernel: nouveau E[    PBUS][0000:01:00.0] MMIO write of
0x00000000 FAULT at 0x400724
and a few times I have been left with no outputs at all, when changing modes on
the 3.8-rc kernel, but that is a different story.


Now I know this is a regression: in 3.5.2-gentoo kernel Nouveau can drive the
HDMI output fine.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1360785887.0eCe01.15961--

--===============2020179824==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2020179824==--
