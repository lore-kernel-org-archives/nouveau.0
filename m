From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90513] Odd gray and red flicker in The Talos
	Principle on GK104
Date: Wed, 08 Jul 2015 18:40:50 +0000
Message-ID: <bug-90513-8800-uxioonUaOC@http.bugs.freedesktop.org/>
References: <bug-90513-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1479771612=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90513-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1479771612==
Content-Type: multipart/alternative; boundary="1436380849.BFDD580.5460"; charset="UTF-8"


--1436380849.BFDD580.5460
Date: Wed, 8 Jul 2015 18:40:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90513

--- Comment #4 from Gediminas Jakutis <gediminas-1NU85dn7e2ownf/OCUKchA@public.gmane.org> ---
(In reply to Karol Herbst from comment #3)
> does enabling "No Dynamic Lightning" helps with the issue even on very high
> gpu settings Like Ultra? Its a customize options for the gpu speed.

Oh my, yes it does. 
I suppose that means the dynamic lighting is responsible for it.

Hmmm... previously[1], dynamic lighting used to crash the game at certain
locations, but would not create any visual problems. This particular flickering
started appearing after some change[2] that made the game to NOT crash anymore.

I'm going to ping the game's developers and ask them to look into this
particular report. Maybe by knowing their engine's internals, they can toss
some [valuable] insight.

[1] While the game was still in closed beta
[2] Not sure if a change to the game, to Mesa or both. As far as I can recall,
probably both.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1436380849.BFDD580.5460
Date: Wed, 8 Jul 2015 18:40:49 +0000
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
   title="NEW - Odd gray and red flicker in The Talos Principle on GK104"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90513#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Odd gray and red flicker in The Talos Principle on GK104"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90513">bug 90513</a>
              from <span class="vcard"><a class="email" href="mailto:gediminas&#64;varciai.lt" title="Gediminas Jakutis &lt;gediminas&#64;varciai.lt&gt;"> <span class="fn">Gediminas Jakutis</span></a>
</span></b>
        <pre>(In reply to Karol Herbst from <a href="show_bug.cgi?id=90513#c3">comment #3</a>)
<span class="quote">&gt; does enabling &quot;No Dynamic Lightning&quot; helps with the issue even on very high
&gt; gpu settings Like Ultra? Its a customize options for the gpu speed.</span >

Oh my, yes it does. 
I suppose that means the dynamic lighting is responsible for it.

Hmmm... previously[1], dynamic lighting used to crash the game at certain
locations, but would not create any visual problems. This particular flickering
started appearing after some change[2] that made the game to NOT crash anymore.

I'm going to ping the game's developers and ask them to look into this
particular report. Maybe by knowing their engine's internals, they can toss
some [valuable] insight.

[1] While the game was still in closed beta
[2] Not sure if a change to the game, to Mesa or both. As far as I can recall,
probably both.</pre>
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

--1436380849.BFDD580.5460--

--===============1479771612==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1479771612==--
