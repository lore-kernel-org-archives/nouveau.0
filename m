From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 57350] [nouveau,
 linux-3.7-rc] Broken cursor and kernel log swamped with trapped
 reads/writes from BAR/PFIFO_READ/FB
Date: Mon, 18 Feb 2013 19:44:17 +0000
Message-ID: <bug-57350-8800-AaL3fBtz0A@http.bugs.freedesktop.org/>
References: <bug-57350-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1574423655=="
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


--===============1574423655==
Content-Type: multipart/alternative; boundary="1361216657.6d2B24.22226"; charset="us-ascii"


--1361216657.6d2B24.22226
Date: Mon, 18 Feb 2013 19:44:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=57350

--- Comment #26 from Bruno <bonbons67-H4aWS73dXupiYsDpGMXq6A@public.gmane.org> ---
(In reply to comment #23)
> in-tree

Yes, compiling in-tree does work... so includes search paths somehow are broken
between those two revisions I mentioned in comment #18 when building
out-of-tree. Not so good.

(In reply to comment #25)
> Note that one recent commit in xf86-video-nouveau
> (912d418fdfd2e99eef1e5c631c76dda1d82cf451) may reduce visibility of this
> bug... Did you update xf86-video-nouveau too?

No, I just updated kernel. For userspace I'm still on xf86-video-nouveau-1.0.4,
libdrm-2.4.40, mesa-9.0.1 and xorg-server-1.13.1
The nouveau/master commit I tried was 43b629c047... (drm/nouveau: Fix DPMS 1 on
G4 Snowball, from snow white to coal black) by Stefan de Konink.

(In reply to comment #16)
> Just to be sure we are not chasing two different bugs - can you confirm
> 3863c9bc887e9638a9d905d55f6038641ece78d6 is the commit which introduced
> *this* bug?

Bug present in 3863c9bc887e9638a9d905d55f6038641ece78d6.
Bug not present in preceding 8a9b889e668a5bc2f4031015fe4893005c43403d.

So yes, I can confirm.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1361216657.6d2B24.22226
Date: Mon, 18 Feb 2013 19:44:17 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57350#c26">Comment # 26</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nouveau, linux-3.7-rc] Broken cursor and kernel log swamped with trapped reads/writes from BAR/PFIFO_READ/FB"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57350">bug 57350</a>
              from <span class="vcard"><a class="email" href="mailto:bonbons67&#64;internet.lu" title="Bruno &lt;bonbons67&#64;internet.lu&gt;"> <span class="fn">Bruno</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=57350#c23">comment #23</a>)
<span class="quote">&gt; in-tree</span >

Yes, compiling in-tree does work... so includes search paths somehow are broken
between those two revisions I mentioned in <a href="show_bug.cgi?id=57350#c18">comment #18</a> when building
out-of-tree. Not so good.

(In reply to <a href="show_bug.cgi?id=57350#c25">comment #25</a>)
<span class="quote">&gt; Note that one recent commit in xf86-video-nouveau
&gt; (912d418fdfd2e99eef1e5c631c76dda1d82cf451) may reduce visibility of this
&gt; bug... Did you update xf86-video-nouveau too?</span >

No, I just updated kernel. For userspace I'm still on xf86-video-nouveau-1.0.4,
libdrm-2.4.40, mesa-9.0.1 and xorg-server-1.13.1
The nouveau/master commit I tried was 43b629c047... (drm/nouveau: Fix DPMS 1 on
G4 Snowball, from snow white to coal black) by Stefan de Konink.

(In reply to <a href="show_bug.cgi?id=57350#c16">comment #16</a>)
<span class="quote">&gt; Just to be sure we are not chasing two different bugs - can you confirm
&gt; 3863c9bc887e9638a9d905d55f6038641ece78d6 is the commit which introduced
&gt; *this* bug?</span >

Bug present in 3863c9bc887e9638a9d905d55f6038641ece78d6.
Bug not present in preceding 8a9b889e668a5bc2f4031015fe4893005c43403d.

So yes, I can confirm.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1361216657.6d2B24.22226--

--===============1574423655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1574423655==--
