From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91526] World of Warcraft (on Wine) has UI corruption
 with nouveau
Date: Thu, 04 Feb 2016 17:09:17 +0000
Message-ID: <bug-91526-8800-bvDlV9HDwn@http.bugs.freedesktop.org/>
References: <bug-91526-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0219354570=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91526-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0219354570==
Content-Type: multipart/alternative; boundary="14546057570.bCDbFD4D2.26075";
 charset="UTF-8"


--14546057570.bCDbFD4D2.26075
Date: Thu, 4 Feb 2016 17:09:17 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=91526

--- Comment #8 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Gediminas Jakutis from comment #7)
> This is still an issue[1], so I suppose it should be re-opened.
> I assume commit d68226087cf5f2f686d6c8f3377c5a1dec3d8bc4 might be at fault,
> but I haven't tested the game around that time, so I can't tell. I can
> bisect, if needed.
> 
> [1] I just re-tested with the current mesa git head on a fully patched WoW
> client and the problem is there.

Argh! You're right :( Just retested with latest mesa and the trace you
originally supplied didn't work. But I *swear* it worked for me at commit
d68226087c. Maybe it was through luck? Or perhaps something in st/mesa changed
and it's taking a different path now...

--- Comment #9 from Gediminas Jakutis <gediminas-1NU85dn7e2ownf/OCUKchA@public.gmane.org> ---
Diablo 3 seems to be hitting the exact same issue, BTW.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.
--14546057570.bCDbFD4D2.26075
Date: Thu, 4 Feb 2016 17:09:17 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - World of Warcraft (on Wine) has UI corruption with nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91526#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - World of Warcraft (on Wine) has UI corruption with nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91526">bug 91526</a>
              from <span class="vcard"><a class="email" href="mailto:gediminas&#64;varciai.lt" title="Gediminas Jakutis &lt;gediminas&#64;varciai.lt&gt;"> <span class="fn">Gediminas Jakutis</span></a>
</span></b>
        <pre>Diablo 3 seems to be hitting the exact same issue, BTW.</pre>
        </div>
        <div>
            <b><a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - World of Warcraft (on Wine) has UI corruption with nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91526#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - World of Warcraft (on Wine) has UI corruption with nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91526">bug 91526</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Gediminas Jakutis from <a href="show_bug.cgi?id=91526#c7">comment #7</a>)
<span class="quote">&gt; This is still an issue[1], so I suppose it should be re-opened.
&gt; I assume commit d68226087cf5f2f686d6c8f3377c5a1dec3d8bc4 might be at fault,
&gt; but I haven't tested the game around that time, so I can't tell. I can
&gt; bisect, if needed.
&gt; 
&gt; [1] I just re-tested with the current mesa git head on a fully patched WoW
&gt; client and the problem is there.</span >

Argh! You're right :( Just retested with latest mesa and the trace you
originally supplied didn't work. But I *swear* it worked for me at commit
d68226087c. Maybe it was through luck? Or perhaps something in st/mesa changed
and it's taking a different path now...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14546057570.bCDbFD4D2.26075--

--===============0219354570==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0219354570==--
