From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89484] [NVD9] xrandr no output to DisplayPort with
 GeForce GT 520M.
Date: Tue, 10 Mar 2015 20:16:53 +0000
Message-ID: <bug-89484-8800-J2Fi5cC0bd@http.bugs.freedesktop.org/>
References: <bug-89484-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1402080328=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89484-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1402080328==
Content-Type: multipart/alternative; boundary="1426018612.dAedfE2.4916"; charset="UTF-8"


--1426018612.dAedfE2.4916
Date: Tue, 10 Mar 2015 20:16:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89484

--- Comment #10 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Corey Bresnan from comment #8)
> As far as I can tell, the provider stuff is set up correctly as per the link
> (I'm not sure as to what specifically you would like me to confirm, could
> you please elaborate?).

The fact that you know about provider stuff to begin with leads me to believe
you've probably done it correctly :) Basically wanted to make sure that you had
done xrandr --setprovideroutputsource 1 0 or something.

> On closer inspection, I think the VBIOS issue is
> related, *but not limited* to my DP problems; I can't seem to access the GPU
> with other methods, i.e using the method described in the above link or via
> bumblebee for example.

bumblebee just causes more issues. nouveau should auto-suspend the card if
things are working fine -- check the vgaswitcheroo file, it should say DynOff.

Will look at the nouveau trace + blob mmiotrace to see if anything interesting
pops up.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1426018612.dAedfE2.4916
Date: Tue, 10 Mar 2015 20:16:52 +0000
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
   title="NEW - [NVD9] xrandr no output to DisplayPort with GeForce GT 520M."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89484#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVD9] xrandr no output to DisplayPort with GeForce GT 520M."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89484">bug 89484</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Corey Bresnan from <a href="show_bug.cgi?id=89484#c8">comment #8</a>)
<span class="quote">&gt; As far as I can tell, the provider stuff is set up correctly as per the link
&gt; (I'm not sure as to what specifically you would like me to confirm, could
&gt; you please elaborate?).</span >

The fact that you know about provider stuff to begin with leads me to believe
you've probably done it correctly :) Basically wanted to make sure that you had
done xrandr --setprovideroutputsource 1 0 or something.

<span class="quote">&gt; On closer inspection, I think the VBIOS issue is
&gt; related, *but not limited* to my DP problems; I can't seem to access the GPU
&gt; with other methods, i.e using the method described in the above link or via
&gt; bumblebee for example.</span >

bumblebee just causes more issues. nouveau should auto-suspend the card if
things are working fine -- check the vgaswitcheroo file, it should say DynOff.

Will look at the nouveau trace + blob mmiotrace to see if anything interesting
pops up.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1426018612.dAedfE2.4916--

--===============1402080328==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1402080328==--
