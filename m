From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59168] [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic
 garbage/corruption/noise on resume
Date: Mon, 03 Mar 2014 05:27:24 +0000
Message-ID: <bug-59168-8800-QElu6ks2lv@http.bugs.freedesktop.org/>
References: <bug-59168-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0783248728=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59168-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0783248728==
Content-Type: multipart/alternative; boundary="1393824444.80Fa1.31453"; charset="us-ascii"


--1393824444.80Fa1.31453
Date: Mon, 3 Mar 2014 05:27:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59168

--- Comment #46 from Laurence Lee <rubyjedi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Thanks for the command-line tip, that does indeed have the desired effect on
standard-built Fedora kernels, and is much better than setting
nouveau.noaccel=1 (which, when activated, is now leading to some font-rendering
glitches).

Actually, it does kind of make sense that an invalid copy engine would cause
screen garbage to be displayed, and that this would be triggered by the rapid
screen repainting that happens on Resume.

I'll leave it up to more knowledgeable minds whether to act upon this patch or
not; but it's worth noting that only 4 other devices out of the 9 declared in
nvc0.c have an entry for a secondary, "COPY1" engine -- the GF100, GF104,
GF110, and GF114.

I'm just thankful to have a usable solution on my rig in the meantime. Thanks!

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1393824444.80Fa1.31453
Date: Mon, 3 Mar 2014 05:27:24 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168#c46">Comment # 46</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168">bug 59168</a>
              from <span class="vcard"><a class="email" href="mailto:rubyjedi&#64;gmail.com" title="Laurence Lee &lt;rubyjedi&#64;gmail.com&gt;"> <span class="fn">Laurence Lee</span></a>
</span></b>
        <pre>Thanks for the command-line tip, that does indeed have the desired effect on
standard-built Fedora kernels, and is much better than setting
nouveau.noaccel=1 (which, when activated, is now leading to some font-rendering
glitches).

Actually, it does kind of make sense that an invalid copy engine would cause
screen garbage to be displayed, and that this would be triggered by the rapid
screen repainting that happens on Resume.

I'll leave it up to more knowledgeable minds whether to act upon this patch or
not; but it's worth noting that only 4 other devices out of the 9 declared in
nvc0.c have an entry for a secondary, &quot;COPY1&quot; engine -- the GF100, GF104,
GF110, and GF114.

I'm just thankful to have a usable solution on my rig in the meantime. Thanks!</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1393824444.80Fa1.31453--

--===============0783248728==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0783248728==--
