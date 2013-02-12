From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 57350] [nouveau,
 linux-3.7-rc] Broken cursor and kernel log swamped with trapped
 reads/writes from BAR/PFIFO_READ/FB
Date: Tue, 12 Feb 2013 21:41:23 +0000
Message-ID: <bug-57350-8800-qIzH4R8T3C@http.bugs.freedesktop.org/>
References: <bug-57350-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1823839929=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-57350-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1823839929==
Content-Type: multipart/alternative; boundary="1360705283.5ebe3a34.19396"; charset="us-ascii"


--1360705283.5ebe3a34.19396
Date: Tue, 12 Feb 2013 21:41:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=57350

--- Comment #17 from Bruno <bonbons67-H4aWS73dXupiYsDpGMXq6A@public.gmane.org> ---
(In reply to comment #16)
> Just to be sure we are not chasing two different bugs - can you confirm
> 3863c9bc887e9638a9d905d55f6038641ece78d6 is the commit which introduced
> *this* bug?

I can't quickly check, both 3863c9bc887e9638a9d905d55f6038641ece78d6 and
preceding 8a9b889e668a5bc2f4031015fe4893005c43403d don't compile here (gcc
4.6.3).

They are failing on redeclaration of NV_* enums in nouveau_drv.h which were
previously declared in core/include/core/device.h and struct nouveau_engine
which was previously declared in core/include/core/engine.h

Will look tomorrow evening (CET) at GIT history around those commits in order
to get it compiling so I can check.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1360705283.5ebe3a34.19396
Date: Tue, 12 Feb 2013 21:41:23 +0000
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
   title="NEW --- - [nouveau, linux-3.7-rc] Broken cursor and kernel log swamped with trapped reads/writes from BAR/PFIFO_READ/FB"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57350#c17">Comment # 17</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nouveau, linux-3.7-rc] Broken cursor and kernel log swamped with trapped reads/writes from BAR/PFIFO_READ/FB"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57350">bug 57350</a>
              from <span class="vcard"><a class="email" href="mailto:bonbons67&#64;internet.lu" title="Bruno &lt;bonbons67&#64;internet.lu&gt;"> <span class="fn">Bruno</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=57350#c16">comment #16</a>)
<span class="quote">&gt; Just to be sure we are not chasing two different bugs - can you confirm
&gt; 3863c9bc887e9638a9d905d55f6038641ece78d6 is the commit which introduced
&gt; *this* bug?</span >

I can't quickly check, both 3863c9bc887e9638a9d905d55f6038641ece78d6 and
preceding 8a9b889e668a5bc2f4031015fe4893005c43403d don't compile here (gcc
4.6.3).

They are failing on redeclaration of NV_* enums in nouveau_drv.h which were
previously declared in core/include/core/device.h and struct nouveau_engine
which was previously declared in core/include/core/engine.h

Will look tomorrow evening (CET) at GIT history around those commits in order
to get it compiling so I can check.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1360705283.5ebe3a34.19396--

--===============1823839929==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1823839929==--
