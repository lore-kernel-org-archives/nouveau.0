From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 66129] [BISECTED] nouveau,
 nv50: dual display doesn't work in 3.9
Date: Thu, 27 Jun 2013 08:29:59 +0000
Message-ID: <bug-66129-8800-axNu5iTGEz@http.bugs.freedesktop.org/>
References: <bug-66129-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0884096711=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-66129-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0884096711==
Content-Type: multipart/alternative; boundary="1372321799.58fBaa3.28443"; charset="us-ascii"


--1372321799.58fBaa3.28443
Date: Thu, 27 Jun 2013 08:29:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=66129

--- Comment #9 from Yves-Alexis <corsac-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> ---
Created attachment 81536
  --> https://bugs.freedesktop.org/attachment.cgi?id=81536&action=edit
dmesg with 3.8.0-rc6-00083-ga2bc283

(In reply to comment #2)
> Secondly please attach the output of dmesg for working and non-working
> setup. vbios might be useful as well [1]

Here's the working case (commit ga2bc283 just before the bad one)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1372321799.58fBaa3.28443
Date: Thu, 27 Jun 2013 08:29:59 +0000
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
   title="NEEDINFO --- - [BISECTED] nouveau, nv50: dual display doesn't work in 3.9"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66129#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [BISECTED] nouveau, nv50: dual display doesn't work in 3.9"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66129">bug 66129</a>
              from <span class="vcard"><a class="email" href="mailto:corsac&#64;debian.org" title="Yves-Alexis &lt;corsac&#64;debian.org&gt;"> <span class="fn">Yves-Alexis</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=81536" name="attach_81536" title="dmesg with 3.8.0-rc6-00083-ga2bc283">attachment 81536</a> <a href="attachment.cgi?id=81536&amp;action=edit" title="dmesg with 3.8.0-rc6-00083-ga2bc283">[details]</a></span>
dmesg with 3.8.0-rc6-00083-ga2bc283

(In reply to <a href="show_bug.cgi?id=66129#c2">comment #2</a>)
<span class="quote">&gt; Secondly please attach the output of dmesg for working and non-working
&gt; setup. vbios might be useful as well [1]</span >

Here's the working case (commit ga2bc283 just before the bad one)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1372321799.58fBaa3.28443--

--===============0884096711==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0884096711==--
