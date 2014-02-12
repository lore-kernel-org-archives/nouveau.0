From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74815] [NVA5,
 NVC1] no displayport output on quadro 400/600 cards
Date: Wed, 12 Feb 2014 15:17:35 +0000
Message-ID: <bug-74815-8800-OnCDrIsbt2@http.bugs.freedesktop.org/>
References: <bug-74815-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0394915939=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-74815-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0394915939==
Content-Type: multipart/alternative; boundary="1392218254.FF0f611.20299"; charset="us-ascii"


--1392218254.FF0f611.20299
Date: Wed, 12 Feb 2014 15:17:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74815

--- Comment #3 from Michael Gulick <mgulick-I5WecO5yM8GakBO8gow8eQ@public.gmane.org> ---
After seeing that commit 5cc027f6b1e was still good, I bisected the rest of the
commits in that merge, and came to the very next commit, 0a0afd282f
("drm/nv50-/disp: move DP link training to core and train from supervisor")
that breaks the displayport output (which is not surprising given the commit
message).

What additional information can I provide to help find a resolution to this
bug?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392218254.FF0f611.20299
Date: Wed, 12 Feb 2014 15:17:34 +0000
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
   title="NEW --- - [NVA5,NVC1] no displayport output on quadro 400/600 cards"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74815#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA5,NVC1] no displayport output on quadro 400/600 cards"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74815">bug 74815</a>
              from <span class="vcard"><a class="email" href="mailto:mgulick&#64;mathworks.com" title="Michael Gulick &lt;mgulick&#64;mathworks.com&gt;"> <span class="fn">Michael Gulick</span></a>
</span></b>
        <pre>After seeing that commit 5cc027f6b1e was still good, I bisected the rest of the
commits in that merge, and came to the very next commit, 0a0afd282f
(&quot;drm/nv50-/disp: move DP link training to core and train from supervisor&quot;)
that breaks the displayport output (which is not surprising given the commit
message).

What additional information can I provide to help find a resolution to this
bug?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392218254.FF0f611.20299--

--===============0394915939==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0394915939==--
